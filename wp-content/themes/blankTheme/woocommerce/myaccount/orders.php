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
		<div class="selectMyPedidos">
			<p>
				<i>Filtros:</i>
				<img src="<?php echo get_template_directory_uri().'/img/filter.png'; ?>">
			</p>
			<div class="filterContent">
				<h5>FILTRAR POR<i class="closeFilter"></i></h5>
				<ul>
					<li data=".<?php echo sanitize_title('En espera (de pago)'); ?>">Validando pago</li>
					<li data=".<?php echo sanitize_title('Fallido (No pagado)'); ?>">Pedido Fallido</li>
					<li data=".<?php echo sanitize_title('En preparación (Pagado)'); ?>">Pedido por entregar</li>
					<li data=".<?php echo sanitize_title('Completado (Pagado-Enviado)'); ?>">Pedido Entregado</li>
					<li data=".<?php echo sanitize_title('En espera (de pago)'); ?>">Pedido en Espera</li>
					<li data=".<?php echo sanitize_title('Cancelado'); ?>">Pedido cancelado</li>
					<li data=".<?php echo sanitize_title('Reembolsado (Devuelto)'); ?>">Pedido reembolzado</li>
				</ul>				
			</div>
		</div>
		<?php
			foreach ( $customer_orders->orders as $customer_order ) {
				$order = wc_get_order( $customer_order ); // phpcs:ignore WordPress.WP.GlobalVariablesOverride.OverrideProhibited
				$item_count = $order->get_item_count() - $order->get_item_count_refunded();
				$status = wc_get_order_status_name($order->get_status());

				$msj = '';
				$img = get_template_directory_uri().'/img/isotipo-personaje.png';
				if ( $status == 'En espera (de pago)' ) {
					$msj = 'Validando pago';
					$img = get_template_directory_uri().'/img/time-is-money.png';
				}
				if ( $status == 'Fallido (No pagado)' ) {
					$msj = 'Pedido Fallido';
					$img = get_template_directory_uri().'/img/isotipo-personaje.png';
				}
				if ( $status == 'En preparación (Pagado)' ) {
					$msj = 'Pedido por entregar';
					$img = get_template_directory_uri().'/img/delivery.png';
				}
				if ( $status == 'Completado (Pagado-Enviado)' ) {
					$msj = 'Pedido Entregado';
					$img = get_template_directory_uri().'/img/delivery-guy.png';
				}
				if ( $status == 'En espera (de pago)' ) {
					$msj = 'Pedido en Espera';
					$img = get_template_directory_uri().'/img/delivery.png';
				}
				if ( $status == 'Cancelado' ) {
					$msj = 'Pedido cancelado';
					$img = get_template_directory_uri().'/img/cancelado.png';
				}
				if ( $status == 'Reembolsado (Devuelto)' ) {
					$msj = 'Pedido reembolzado';
					$img = get_template_directory_uri().'/img/isotipo-personaje.png';
				}

				?>
				<div class="itemPedido <?php echo sanitize_title($status); ?>" >
					<a href="<?php echo esc_url( $order->get_view_order_url() ); ?>">
						<div class="title_pedido">
							<?php
								echo $msj;
							?>
						</div>
						<div class="body_pedido">
							<div class="left_img">
								<img src="<?php echo $img; ?>">
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
		<div class="addC">
			<a href="javascript:void(0)" class="link">Eliminar todo</a>
		</div>
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