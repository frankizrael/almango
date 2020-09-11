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
	
	<a href="javascript:void(0)" class="backend" onclick="goBack()">
		<img src="<?php echo get_template_directory_uri(); ?>/img/back.png">
		Volver
	</a>
</div>
<div class="contentMyPedidos">
	<div class="itemPedido">
		<div class="title_pedido">
			<?php
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
						<strong>Estado :</strong>
						<p><?php echo wc_get_order_status_name( $order->get_status() ); ?></p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="cruzInfomation">
		<div class="leftTop item">
			<h4>Dia de despacho</h4>
			<p>Jr. Emilio Fernandez 697 Urb Sta Beatriz</p>
		</div>
		<div class="rightTop item">
			<h4>Dirección de despacho</h4>
			<p>Entrega programada el día 15/08/2020 entre las 09:00 a.m. a 06:00 p.m.</p>
		</div>
		<div class="leftBottom item">
			<h4>Forma de pago</h4>
			<p>Pago con tarjeta de crédito a 12 cuotas</p>
		</div>
		<div class="righttBottom item">
			<h4>Persona autorizada para entrega</h4>
			<p>Melissa Calderon Purisaca</p>
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
	function goBack() {
	  window.history.back();
	}
</script>