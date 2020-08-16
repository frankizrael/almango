<?php
/**
 * Orders
 *
 * Shows orders on the account page.
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/orders.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.7.0
 */

defined( 'ABSPATH' ) || exit;

do_action( 'woocommerce_before_account_orders', $has_orders ); ?>

<?php if ( $has_orders ) : ?>
	<div class="simpletitle">
		<h2><?php echo apply_filters( 'woocommerce_my_account_my_orders_title', esc_html__( 'Mis pedidos', 'woocommerce' ) ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></h2>
	</div>
	<div class="contentMyPedidos">
		<?php
			foreach ( $customer_orders->orders as $customer_order ) {
				$order = wc_get_order( $customer_order ); // phpcs:ignore WordPress.WP.GlobalVariablesOverride.OverrideProhibited
				$item_count = $order->get_item_count() - $order->get_item_count_refunded();
				?>

				<div class="itemPedido">
					<a href="<?php echo esc_url( $order->get_view_order_url() ); ?>">
						<div class="title_pedido">
							<?php
								$status = wc_get_order_status_name($order->get_status());
								if ( $status == 'Pending payment' ) {
									?>
									Validando pago
									<?php
								}
								if ( $status == 'Failed' ) {
									?>
									Pedido Fallido
									<?php
								}
								if ( $status == 'Processing' ) {
									?>
									Pedido por entregar
									<?php
								}
								if ( $status == 'Completed' ) {
									?>
									Pedido Entregado
									<?php
								}
								if ( $status == 'On hold' ) {
									?>
									Pedido en Espera
									<?php
								}
								if ( $status == 'Cancelled' ) {
									?>
									Pedido cancelado
									<?php
								}
								if ( $status == 'Refunded' ) {
									?>
									Pedido reembolzado
									<?php
								}
							?>
						</div>
						<div class="body_pedido">
							<div class="left_img">
								<?php
									$status = wc_get_order_status_name($order->get_status());
									if ( $status == 'Pending payment' ) {
										?>
										<img src="<?php echo get_template_directory_uri(); ?>/img/time-is-money.png">
										<?php
									}
									if ( $status == 'Failed' ) {
										?>
										<img src="<?php echo get_template_directory_uri(); ?>/img/isotipo-personaje.png">
										<?php
									}
									if ( $status == 'Processing' ) {
										?>
										<img src="<?php echo get_template_directory_uri(); ?>/img/delivery.png">
										<?php
									}
									if ( $status == 'Completed' ) {
										?>
										<img src="<?php echo get_template_directory_uri(); ?>/img/delivery-guy.png">
										<?php
									}
									if ( $status == 'On hold' ) {
										?>										
										<img src="<?php echo get_template_directory_uri(); ?>/img/delivery.png">
										<?php
									}
									if ( $status == 'Cancelled' ) {
										?>
										<img src="<?php echo get_template_directory_uri(); ?>/img/isotipo-personaje.png">
										<?php
									}
									if ( $status == 'Refunded' ) {
										?>
										<img src="<?php echo get_template_directory_uri(); ?>/img/isotipo-personaje.png">
										<?php
									}
								?>
							</div>
							<div class="right_p">
							<ul>
								<li>
									<strong>N° de pedido :</strong>
									<p><?php echo $order->get_order_number(); ?></p>
								</li>
								<li>
									<strong>Fecha de pedido :</strong>
									<p><?php echo esc_html( wc_format_datetime( $order->get_date_created() ) ); ?></p>
								</li>
								<li>
									<strong>Total :</strong>
									<p><?php echo $order->get_formatted_order_total(); ?></p>
								</li>
							</ul>
						</div>
						</div>
					</a>
				</div>

				<?php
			}
		?>
	</div>

	<?php do_action( 'woocommerce_before_account_orders_pagination' ); ?>

	<?php if ( 1 < $customer_orders->max_num_pages ) : ?>
		<div class="woocommerce-pagination woocommerce-pagination--without-numbers woocommerce-Pagination">
			<?php if ( 1 !== $current_page ) : ?>
				<a class="woocommerce-button woocommerce-button--previous woocommerce-Button woocommerce-Button--previous button" href="<?php echo esc_url( wc_get_endpoint_url( 'orders', $current_page - 1 ) ); ?>"><?php esc_html_e( 'Anterior', 'woocommerce' ); ?></a>
			<?php endif; ?>

			<?php if ( intval( $customer_orders->max_num_pages ) !== $current_page ) : ?>
				<a class="woocommerce-button woocommerce-button--next woocommerce-Button woocommerce-Button--next button" href="<?php echo esc_url( wc_get_endpoint_url( 'orders', $current_page + 1 ) ); ?>"><?php esc_html_e( 'Siguiente', 'woocommerce' ); ?></a>
			<?php endif; ?>
		</div>
	<?php endif; ?>

<?php else : ?>
	<div class="woocommerce-message woocommerce-message--info woocommerce-Message woocommerce-Message--info woocommerce-info">
		<a class="woocommerce-Button button" href="<?php echo esc_url( apply_filters( 'woocommerce_return_to_shop_redirect', wc_get_page_permalink( 'shop' ) ) ); ?>">
			<?php esc_html_e( 'Vuelve a la tienda', 'woocommerce' ); ?>
		</a>
		<?php esc_html_e( 'Aún no tienes ninguna orden.', 'woocommerce' ); ?>
	</div>
<?php endif; ?>

<?php do_action( 'woocommerce_after_account_orders', $has_orders ); ?>
<script type="text/javascript">
	jQuery('.myaccount-navigation .link_list').eq(3).find('a').addClass('active');
</script>