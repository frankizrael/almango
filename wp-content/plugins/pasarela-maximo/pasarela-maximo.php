<?php
/**
 * Plugin Name: Pasarela MAXIMO
 * Description: Habilita MAXIMO como método de pago en tu tienda.
 * Version:     1.0
 * Author:      maximodev
 * Author URI:  https://profiles.wordpress.org/maximodev/
 * Text Domain: woo-maximo
 * Domain Path: /languages
 */

function init_maximo_gateway_class() {
	class WC_Gateway_MAXIMO extends WC_Payment_Gateway {
		public function __construct() {
			$this->id                 = 'woo-maximo';
			$this->has_fields         = false;
			$this->title              = __( 'Tarjeta  de crédito y débito ', 'woo-maximo' );
			$this->method_title       = __( 'Tarjeta  de crédito y débito', 'woo-maximo' );
			$this->icon               = site_url().'/wp-content/plugins/pasarela-maximo/assets/marcas-3.png';
			$this->method_description = __( 'Acepta tarjetas de crédito y débito.', 'woo-maximo' );
			$this->init_form_fields();
			$this->init_settings();
			$this->actions_and_filters();
			//require_once plugin_dir_path( __FILE__ ) . '/vendor/autoload.php';
		}

		public function actions_and_filters() {
			add_action( 'woocommerce_update_options_payment_gateways_' . $this->id, array(
				$this,
				'process_admin_options'
			) );
			add_action( 'woocommerce_receipt_woo-maximo', array( $this, 'receipt_page' ), 10, 1 );
			if ( empty( $_POST ) ) {
				//add_filter( 'woocommerce_thankyou_order_received_text', '__return_false' );
			}
		}

		public function init_form_fields() {
			$this->form_fields = array(
				'enabled'     => array(
					'title'   => __( 'Habilitar', 'woo-maximo' ),
					'type'    => 'checkbox',
					'label'   => __( 'Habilita MAXIMO como método de pago para tus clientes.', 'woo-maximo' ),
					'default' => 'yes'
				),
				'test-mode'   => array(
					'title'   => __( 'Desarrollador', 'woo-maximo' ),
					'type'    => 'checkbox',
					'label'   => __( 'Habilita el modo desarrollo para realizar pruebas en tu tienda.', 'woo-maximo' ),
					'default' => 'yes'
				),
				'public_key'        => array(
					'title'   => __( 'Públic key', 'woo-maximo' ),
					'type'    => 'text',
					'default' => ''
				),
				'private_key'    => array(
					'title'   => __( 'Private Key', 'woo-maximo' ),
					'type'    => 'password',
					'default' => ''
				)
			);
		}

		public function process_payment( $order_id ) {

			$order = new WC_Order( $order_id );

			return array(
				'result'   => 'success',
				//'redirect' => $this->get_return_url( $order )
				'redirect' => add_query_arg('order', $order->id, add_query_arg('key', $order->order_key, get_permalink(woocommerce_get_page_id('pay'))))
			);
		}

		private function get_script_src() {
			$test = $this->get_option( 'test-mode' );
			if ( $test == 'yes' ) {
				return 'https://maximo-widget.s3.amazonaws.com/widget.js';
			} else {
				return 'https://maximo-widget.s3.amazonaws.com/PROD/widget.js';
			}		
		}

		private function get_maximo_endpoint() {
			$test = $this->get_option( 'test-mode' );
			if ( $test == 'yes' ) {
				return 'http://maximo-api.herokuapp.com/api/v1';
			}
			else {
				return 'https://api.billeteramaximo.com/api/v1';
			}			
		}


		private function create_charge( $order_id, $token ) {
			$order       = new WC_Order( $order_id );			
			//cambia endpoint
			$endpoint    = $this->get_maximo_endpoint() . '/guest-payment/generate-payment';
			$headers     = array(
				'Content-Type'  => 'application/json'
			);
			$data        = array(
				'private_key'   => $this->get_option( 'private_key' ),
				'guest_payment_token' => $token
			);
			$request     = Requests::post( $endpoint, $headers, json_encode( $data ), array('timeout' => 30) );

			return json_decode( $request->body );
		}

		private function get_the_user_ip() {
			if ( ! empty( $_SERVER['HTTP_CLIENT_IP'] ) ) {
				$ip = $_SERVER['HTTP_CLIENT_IP'];
			} elseif ( ! empty( $_SERVER['HTTP_X_FORWARDED_FOR'] ) ) {
				$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
			} else {
				$ip = $_SERVER['REMOTE_ADDR'];
			}

			return $ip;
		}

		function receipt_page( $order_id ) {
		    $public_key = $this->get_option( 'public_key' );
			$order = new WC_Order( $order_id );
			$order_number = $order->get_order_number();
			if ( empty( $_POST ) ) {
				if ( $order->has_status( 'pending' ) ): ?>
					<section class="woocommerce-order-details">
						<h2 class="woocommerce-order-details__title"><?php esc_html_e('Order details', 'woocommerce'); ?></h2>
						<table class="woocommerce-table woocommerce-table--order-details shop_table order_details">
							<thead>
								<tr>
									<th class="woocommerce-table__product-name product-name"><?php esc_html_e('Product', 'woocommerce'); ?></th>
									<th class="woocommerce-table__product-table product-total"><?php esc_html_e('Total', 'woocommerce'); ?></th>
								</tr>
							</thead>

							<tbody>
								<?php
								$order_items = $order->get_items(apply_filters('woocommerce_purchase_order_item_types', 'line_item'));
								$show_purchase_note = $order->has_status(apply_filters('woocommerce_purchase_note_order_statuses', array('completed', 'processing')));
								foreach ($order_items as $item_id => $item) {
									$product = $item->get_product();
									?>
									<tr class="<?php echo esc_attr( apply_filters( 'woocommerce_order_item_class', 'woocommerce-table__line-item order_item', $item, $order ) ); ?>">

										<td class="woocommerce-table__product-name product-name">
											<?php
											$is_visible        = $product && $product->is_visible();
											$product_permalink = apply_filters( 'woocommerce_order_item_permalink', $is_visible ? $product->get_permalink( $item ) : '', $item, $order );

											echo apply_filters( 'woocommerce_order_item_name', $product_permalink ? sprintf( '<a href="%s">%s</a>', $product_permalink, $item->get_name() ) : $item->get_name(), $item, $is_visible ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped

											$qty          = $item->get_quantity();
											$refunded_qty = $order->get_qty_refunded_for_item( $item_id );

											if ( $refunded_qty ) {
												$qty_display = '<del>' . esc_html( $qty ) . '</del> <ins>' . esc_html( $qty - ( $refunded_qty * -1 ) ) . '</ins>';
											} else {
												$qty_display = esc_html( $qty );
											}

											echo apply_filters( 'woocommerce_order_item_quantity_html', ' <strong class="product-quantity">' . sprintf( '&times;&nbsp;%s', $qty_display ) . '</strong>', $item ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped

											do_action( 'woocommerce_order_item_meta_start', $item_id, $item, $order, false );

											wc_display_item_meta( $item ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped

											do_action( 'woocommerce_order_item_meta_end', $item_id, $item, $order, false );
											?>
										</td>

										<td class="woocommerce-table__product-total product-total">
											<?php echo $order->get_formatted_line_subtotal( $item ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?>
										</td>

									</tr>
								<?php
								}
								?>
							</tbody>

							<tfoot>
								<?php
								foreach ($order->get_order_item_totals() as $key => $total) {
									?>
									<tr>
										<th scope="row"><?php echo esc_html($total['label']); ?></th>
											<td><?php echo ('payment_method' === $key) ? esc_html($total['value']) : wp_kses_post($total['value']); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped 
											?></td>
										</tr>
										<?php
									}
									?>
									<?php if ($order->get_customer_note()) : ?>
										<tr>
											<th><?php esc_html_e('Note:', 'woocommerce'); ?></th>
											<td><?php echo wp_kses_post(nl2br(wptexturize($order->get_customer_note()))); ?></td>
										</tr>
									<?php endif; ?>
								</tfoot>

							</table>
						</section>
                    <section class="woocommerce woo-maximo">
                    	<form id="maximo-widget" action="<?php echo add_query_arg('order', $order->id, add_query_arg('key', $order->order_key, get_permalink(woocommerce_get_page_id('pay')))); ?>" method="post" publicKey="<?php echo $public_key; ?>" order_number="<?php echo $order_number; ?>" amount="<?php echo $order->get_total() ?>" currency="PEN"></form>
                    	<script src="<?php echo $this->get_script_src() ?>"></script>
                    	<div class="MaximoButtons">
                    		<button onclick="run()">PAGAR</button>	                    		
                    		<a href="#" onclick="back()">CANCELAR</a>	
                    	</div>
                    	<style type="text/css">
                    		.MaximoButtons {
                    			display: flex;
							    width: 300px;
							    justify-content: space-between;
							    margin: 10px 0px;
                    		}
							.MaximoButtons button {
							    border: solid 1px #504cd6;
							    background: #7370d8;
							    color: white;
							    flex: 1;
							    margin-right: 5px;
							    padding: 10px;
							    border-radius: 3px;
							}							
                    		.MaximoButtons a {
							    border: solid 1px #504cd6;
							    flex: 1;
							    margin-right: 5px;
							    padding: 10px;
							    border-radius: 3px;
							    background: white;
							    color: #7370d8;
							    text-align: center;
							}
                    	</style>
                    	<script>
					   	function run() {
					      window.Maximo.run();
					    }
					    function back() {
					      window.history.back();
					    }
					  	</script>
                    </section>
				<?php endif;
			} else {
				$token = filter_input( INPUT_POST, 'token' );
				$charge = $this->create_charge( $order_id, $token );
				if ( $charge->error ) {
					$order->update_status( 'failed' ); ?>
					<div style="padding: 15px 10px;background: #ff8686;color: white;">
	                    <h2>Error al procesar la compra</h2>
	                    <div><?php echo $charge->message ?></div>
                    </div>
					<?php
				} else {
					global $woocommerce;
					$woocommerce->cart->empty_cart();
					$order->update_status( 'processing' );
					?>
					<div class="maximoresponse">
	                    <h2>¡Lo Máximo!</h2>	
	                    <p>El pago fue realizado</p> 
	                    <?php
	                    	if ($charge->transaction->card_brand == 'Master Card') {
	                    ?>
		                    <video id="myVideo">
							  <source src="<?php echo site_url() ?>/wp-content/plugins/pasarela-maximo/assets/mastercardvideo.mp4" type="video/mp4">
							</video>
							<script type="text/javascript">
	                    		var playVideo = document.getElementById('myVideo');
	                    		setTimeout(function(){
	                    			playVideo.play();
	                    		},500);
	                    	</script>
                    	<?php 
                    		} else {
                    			?>
	                    		<img src="<?php echo site_url() ?>/wp-content/plugins/pasarela-maximo/assets/like.png">
                    			<?php
                    		}
                    	?>
                    	<div class="maximoresponse-comercial">
                    		<div class="maximoresponse-name">
                    			<img src="<?php echo $charge->transaction->officeBranch->company->brandPicture; ?>">
                    			<p><?php echo $charge->transaction->officeBranch->company->comercialName; ?></p>
                    		</div>
                    		<div class="maximoresponse-amount">
                    			S/. <?php echo $charge->transaction->amount; ?>
                    		</div>
                    		<div class="maximoresponse-mss">
                    			<h5><?php echo $charge->message; ?></h5>
                    			<p>Ticket: <?php echo $charge->transaction->ticketNumber; ?></p>
                    		</div>
                    	</div>                  
                    </div>
                    
                    <style type="text/css">
                    	.maximoresponse {
						    text-align: center;
						    margin: 20px 0px;
						}
                    	.maximoresponse h2 {
						    color: #7370d8;
						    font-size: 25px;
						    font-style: italic;
						}
                    	.maximoresponse video {
						    width: 240px;
						    display: block;
						    margin: auto;
						}
						.maximoresponse img {
						    display: block;
						    margin: 20px auto;
						    width: 90px;
						}
						.maximoresponse p {
						    color: #7370d8;
						    font-size: 16px;
						}
						.maximoresponse-mss h5 {
						    color: black;
						    font-size: 16px;
						}

						.maximoresponse-mss p {
						    color: black;
						    font-size: 14px;
						}
						.maximoresponse-amount {
						    border: solid 2px;
						    display: block;
						    width: 300px;
						    margin: auto;
						    margin-bottom: 20px;
						    padding: 10px;
						    font-size: 30px;
						    border-color: #7370da;
						    border-radius: 5px;
						    color: #7370da;
						}
						.maximoresponse-name p {
						    font-size: 18px;
						}
						.maximoresponse-name img {
						    width: 70px;
						}
						.maximoresponse-name {
						    display: flex;
						    width: 300px;
						    align-items: center;
						    margin: 10px auto;
						    padding: 0px 10px;
						}
                    </style>
					<?php
				}
			}
		}

	}

	function add_payment_method_class_maximo( $methods ) {
		$methods[] = 'WC_Gateway_MAXIMO';

		return $methods;
	}

	add_filter( 'woocommerce_payment_gateways', 'add_payment_method_class_maximo' );
}

add_action( 'plugins_loaded', 'init_maximo_gateway_class' );
