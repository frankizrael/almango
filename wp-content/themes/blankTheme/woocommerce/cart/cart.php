<?php
/**
 * Cart Page
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/cart/cart.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.7.0
 */

defined( 'ABSPATH' ) || exit;

do_action( 'woocommerce_before_cart' ); ?>

<form class="woocommerce-cart-form" action="<?php echo esc_url( wc_get_cart_url() ); ?>" method="post">
	<?php do_action( 'woocommerce_before_cart_table' ); ?>

	<table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
		<tbody>
			<?php do_action( 'woocommerce_before_cart_contents' ); ?>

			<?php
			foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
				$_product   = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
				$product_id = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );

				if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
					$product_permalink = apply_filters( 'woocommerce_cart_item_permalink', $_product->is_visible() ? $_product->get_permalink( $cart_item ) : '', $cart_item, $cart_item_key );
					?>
					<tr class="woocommerce-cart-form__cart-item <?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">						
						<td class="product-thumbnail">
							<div class="remove-s">
								<?php
									echo apply_filters( // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
										'woocommerce_cart_item_remove_link',
										sprintf(
											'<a href="%s" class="remove" aria-label="%s" data-product_id="%s" data-product_sku="%s"><svg xmlns="http://www.w3.org/2000/svg" width="30.141" height="40.52" viewBox="0 0 30.141 40.52"><path d="M83.014,12.029h-23.9c-.025.309-.113-1.339,1.617,25.924a2.683,2.683,0,0,0,2.612,2.567H78.785A2.683,2.683,0,0,0,81.4,37.954C83.129,10.667,83.038,12.332,83.014,12.029ZM66.347,35.45A1.225,1.225,0,0,1,65.041,34.3L63.835,19.737a1.25,1.25,0,0,1,1.1-1.372,1.225,1.225,0,0,1,1.306,1.152l1.206,14.562A1.25,1.25,0,0,1,66.347,35.45Zm5.923-1.262a1.207,1.207,0,1,1-2.411,0V19.627a1.207,1.207,0,1,1,2.411,0Zm6.023-14.452L77.088,34.3a1.23,1.23,0,0,1-1.2,1.156,1.243,1.243,0,0,1-1.2-1.376l1.206-14.562A1.225,1.225,0,0,1,77.2,18.365a1.25,1.25,0,0,1,1.1,1.372ZM83.516,4.432h-5.83c.012-.167.009-.042.009-1.682A2.69,2.69,0,0,0,75.077,0H67.052a2.69,2.69,0,0,0-2.618,2.75c0,1.608,0,1.515.009,1.682h-5.83a2.69,2.69,0,0,0-2.618,2.75c0,2.262,0,2.155.008,2.315H86.126c.012-.162.008-.066.008-2.315A2.69,2.69,0,0,0,83.516,4.432Zm-8.232-.218a.212.212,0,0,1-.207.218H67.052a.212.212,0,0,1-.207-.218V2.75a.212.212,0,0,1,.207-.218h8.025a.212.212,0,0,1,.207.218Z" transform="translate(-55.994)"/></svg></a>',
											esc_url( wc_get_cart_remove_url( $cart_item_key ) ),
											esc_html__( 'Remove this item', 'woocommerce' ),
											esc_attr( $product_id ),
											esc_attr( $_product->get_sku() )
										),
										$cart_item_key
									);
								?>
							</div>
							<?php
								$thumbnail = apply_filters( 'woocommerce_cart_item_thumbnail', $_product->get_image(), $cart_item, $cart_item_key );

								if ( ! $product_permalink ) {
									echo $thumbnail; // PHPCS: XSS ok.
								} else {
									printf( '<a href="%s" class="thumbnail_core">%s</a>', esc_url( $product_permalink ), $thumbnail ); // PHPCS: XSS ok.
								}
							?>
						</td>
						<td class="product-name" data-title="<?php esc_attr_e( 'Product', 'woocommerce' ); ?>">
							<p class="marca">
								<?php
								$cat = get_the_terms( $product_id, 'product_cat');
								$catargs = array();
								if ($cat) {	
									$a = 0;		
									foreach ($cat as $ta) {
										$name =  $ta->name;
										if ($a == 2) {
											echo $name;
										}
										$a++;
									}
								}
								?>
							</p>
							<h4 class="price">
							<?php
								if ( ! $product_permalink ) {
									echo wp_kses_post( apply_filters( 'woocommerce_cart_item_name', $_product->get_name(), $cart_item, $cart_item_key ) . '&nbsp;' );
								} else {
									echo wp_kses_post( apply_filters( 'woocommerce_cart_item_name', sprintf( '<a href="%s">%s</a>', esc_url( $product_permalink ), $_product->get_name() ), $cart_item, $cart_item_key ) );
								}

								do_action( 'woocommerce_after_cart_item_name', $cart_item, $cart_item_key );

								// Meta data.
								echo wc_get_formatted_cart_item_data( $cart_item ); // PHPCS: XSS ok.

								// Backorder notification.
								if ( $_product->backorders_require_notification() && $_product->is_on_backorder( $cart_item['quantity'] ) ) {
									echo wp_kses_post( apply_filters( 'woocommerce_cart_item_backorder_notification', '<p class="backorder_notification">' . esc_html__( 'Available on backorder', 'woocommerce' ) . '</p>', $product_id ) );
								}
							?>
							</h4>
							<p class="modelo">
								<?php the_field('modelo',$product_id); ?>
							</p>
							<div class="predns">
								<h5>Recuerda que tu compra incluye</h5>
								<?php
									$presents = get_field('presents',$product_id);
									$transition = 0;
									if ($presents) {
										foreach ($presents as $pp) {
									?>
								<div class="predns_item">
									<img src="<?php echo $pp['imagen']; ?>">
									<p><?php echo $pp['text']; ?></p>
								</div>
									<?php
									$transition = $transition + 2;
										}
									}
								?>
							</div>
						</td>
						<td class="product-price" data-title="<?php esc_attr_e( 'Price', 'woocommerce' ); ?>">
							<?php
								//echo apply_filters( 'woocommerce_cart_item_price', WC()->cart->get_product_price( $_product ), $cart_item, $cart_item_key ); // PHPCS: XSS ok.
							?>
							<div class="prices_html__price">
								<?php
									$product = wc_get_product( $product_id );
									echo $product->get_price_html();
								?>
							</div>
							<div class="prices_html__mPrice">
								<span class="pp">Otro medio de pago</span>
								<span class="bb">
									<?php
										$porcentaje = get_field('porcentaje_conversion','options');
										$price = $product->get_price();
										$price_new = $porcentaje*$price;
										echo get_woocommerce_currency_symbol();
										echo $price_new;
									?>
								</span>
							</div>
						</td>
						<td class="product-quantity" data-title="<?php esc_attr_e( 'Quantity', 'woocommerce' ); ?>">
							<?php
							if ( $_product->is_sold_individually() ) {
								$product_quantity = sprintf( '1 <input type="hidden" name="cart[%s][qty]" value="1" />', $cart_item_key );
							} else {
								$product_quantity = woocommerce_quantity_input(
									array(
										'input_name'   => "cart[{$cart_item_key}][qty]",
										'input_value'  => $cart_item['quantity'],
										'max_value'    => $_product->get_max_purchase_quantity(),
										'min_value'    => '0',
										'product_name' => $_product->get_name(),
									),
									$_product,
									false
								);
							}
							echo apply_filters( 'woocommerce_cart_item_quantity', $product_quantity, $cart_item_key, $cart_item ); // PHPCS: XSS ok.
							?>
						</td>
						<td class="product-subtotal" data-title="<?php esc_attr_e( 'Total', 'woocommerce' ); ?>">
							<?php
								echo apply_filters( 'woocommerce_cart_item_subtotal', WC()->cart->get_product_subtotal( $_product, $cart_item['quantity'] ), $cart_item, $cart_item_key ); // PHPCS: XSS ok.
							?>
						</td>
					</tr>
					<?php
				}
			}
			?>

			<tr class="additionaltr" colspan="5">
				<td class="additionaltd" colspan="5">
					<div class="addtionalTitle">
						<h3>
							<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Selecciona tu color favorito
						</h3>
					</div>
					<div class="addtionalContent">
						<div class="colores_tag">
							<?php
								$colores = get_field('colores',$product_id);
								if ($colores) {
									$a=0;
									foreach ($colores as $ce) {
								?>
								<div class="colors_step" data="#colors_img_<?php echo $a;?>">
									<span style="background: <?php echo $ce['color']; ?>"></span>
									<p><?php echo $ce['text']; ?></p>
								</div>
								<?php
									$a++;
									}
								}
							?>
						</div>
					</div>
				</td>
			</tr>

			<tr class="additionaltr" colspan="5">
				<td class="additionaltd" colspan="5">
					<div class="addtionalTitle">
						<h3>
							<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Selecciona productos adicionales
						</h3>
					</div>
					<div class="addtionalContent">
						<div class="content_additionalproducts">
							<div class="item_additional">
								<div class="flex add_flex" style="background: transparent linear-gradient(178deg, #CCFF00 0%, #27F4CA 100%) 0% 0% no-repeat padding-box;box-shadow: 0px 3px 3px #000000AB;">
									<div class="left">
										<img src="<?php echo get_template_directory_uri(); ?>/img/soat.png">
									</div>
									<div class="right">
										<p>¡Llevate tu soat a un precio especial!</p>
										<h4>S/ 450.00</h4>
										<a href="#">ver info</a>
									</div>
								</div>
								<div class="inbox_check">
									<input type="checkbox">
								</div>
							</div>
							<div class="item_additional">
								<div class="flex add_flex" style="background: transparent linear-gradient(177deg, #000EA8 0%, #FF9F32 100%) 0% 0% no-repeat padding-box;;box-shadow: 0px 3px 3px #000000AB;">
									<div class="left">
										<img src="<?php echo get_template_directory_uri(); ?>/img/soat.png">
									</div>
									<div class="right">
										<p>¡Llevate tu soat a un precio especial!</p>
										<h4>S/ 450.00</h4>
										<a href="#">ver info</a>
									</div>
								</div>
								<div class="inbox_check">
									<input type="checkbox">
								</div>
							</div>
							<div class="item_additional">
								<div class="flex add_flex" style="background: transparent linear-gradient(178deg, #CCFF00 0%, #27F4CA 100%) 0% 0% no-repeat padding-box;box-shadow: 0px 3px 3px #000000AB;">
									<div class="left">
										<img src="<?php echo get_template_directory_uri(); ?>/img/soat.png">
									</div>
									<div class="right">
										<p>¡Llevate tu soat a un precio especial!</p>
										<h4>S/ 450.00</h4>
										<a href="#">ver info</a>
									</div>
								</div>
								<div class="inbox_check">
									<input type="checkbox">
								</div>
							</div>
							<div class="item_additional">
								<div class="flex add_flex" style="background: transparent linear-gradient(177deg, #000EA8 0%, #FF9F32 100%) 0% 0% no-repeat padding-box;;box-shadow: 0px 3px 3px #000000AB;">
									<div class="left">
										<img src="<?php echo get_template_directory_uri(); ?>/img/soat.png">
									</div>
									<div class="right">
										<p>¡Llevate tu soat a un precio especial!</p>
										<h4>S/ 450.00</h4>
										<a href="#">ver info</a>
									</div>
								</div>
								<div class="inbox_check">
									<input type="checkbox">
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>

			<?php do_action( 'woocommerce_cart_contents' ); ?>

			<tr>
				<td colspan="6" class="actions">

					<?php if ( wc_coupons_enabled() ) { ?>
						<div class="coupon" style="display: none;">
							<label for="coupon_code"><?php esc_html_e( 'Coupon:', 'woocommerce' ); ?></label> <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="<?php esc_attr_e( 'Coupon code', 'woocommerce' ); ?>" /> <button type="submit" class="button" name="apply_coupon" value="<?php esc_attr_e( 'Apply coupon', 'woocommerce' ); ?>"><?php esc_attr_e( 'Apply coupon', 'woocommerce' ); ?></button>
							<?php do_action( 'woocommerce_cart_coupon' ); ?>
						</div>
					<?php } ?>

					<button type="submit" class="btn update_cart" name="update_cart" value="<?php esc_attr_e( 'Update cart', 'woocommerce' ); ?>"><?php esc_html_e( 'Actualizar Carrito', 'woocommerce' ); ?></button>

					<?php do_action( 'woocommerce_cart_actions' ); ?>

					<?php wp_nonce_field( 'woocommerce-cart', 'woocommerce-cart-nonce' ); ?>
				</td>
			</tr>

			<?php do_action( 'woocommerce_after_cart_contents' ); ?>
		</tbody>
	</table>
	<?php do_action( 'woocommerce_after_cart_table' ); ?>
</form>

<?php do_action( 'woocommerce_before_cart_collaterals' ); ?>

<div class="cart-collaterals">
	<div class="cart-left">
		<h5>¿Tienes un cupón de descuento?</h5>
		<div class="cupone_f">
			<input type="text" name="" placeholder="Introduce tu cupón">
			<button>APLICAR</button>
		</div>
	</div>
	<div class="cart-right">
		<?php
		/**
		 * Cart collaterals hook.
		 *
		 * @hooked woocommerce_cross_sell_display
		 * @hooked woocommerce_cart_totals - 10
		 */
		do_action( 'woocommerce_cart_collaterals' );
	?>
	</div>
	
</div>

<?php do_action( 'woocommerce_after_cart' ); ?>
<script type="text/javascript">
	jQuery('header').addClass('header-notactive');
</script>