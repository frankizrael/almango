<?php
/**
 * View Order
 *
 * Shows the details of a particular order on the account page.
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/view-order.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.0.0
 */

defined( 'ABSPATH' ) || exit;

$notes = $order->get_customer_order_notes();
?>
<div class="simpletitle">
	<h2><?php echo apply_filters( 'woocommerce_my_account_my_orders_title', esc_html__( 'Mis pedidos', 'woocommerce' ) ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></h2>
</div>
<div class="contentMyPedidos">
	<div class="itemPedido">
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
						<strong>Estado :</strong>
						<p><?php echo wc_get_order_status_name( $order->get_status() ); ?></p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>


<?php if ( $notes ) : ?>
	<h2><?php esc_html_e( 'Order updates', 'woocommerce' ); ?></h2>
	<ol class="woocommerce-OrderUpdates commentlist notes">
		<?php foreach ( $notes as $note ) : ?>
		<li class="woocommerce-OrderUpdate comment note">
			<div class="woocommerce-OrderUpdate-inner comment_container">
				<div class="woocommerce-OrderUpdate-text comment-text">
					<p class="woocommerce-OrderUpdate-meta meta"><?php echo date_i18n( esc_html__( 'l jS \o\f F Y, h:ia', 'woocommerce' ), strtotime( $note->comment_date ) ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></p>
					<div class="woocommerce-OrderUpdate-description description">
						<?php echo wpautop( wptexturize( $note->comment_content ) ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</li>
		<?php endforeach; ?>
	</ol>
<?php endif; ?>

<?php do_action( 'woocommerce_view_order', $order_id ); ?>

<script type="text/javascript">
	jQuery('.myaccount-navigation .link_list').eq(3).find('a').addClass('active');
</script>