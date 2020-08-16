<?php
/**
 * Thankyou page
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/checkout/thankyou.php.
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
$user = wp_get_current_user();
?>

<div class="woocommerce-order thanks-order-s">

	

	<?php if ( $order ) :

		do_action( 'woocommerce_before_thankyou', $order->get_id() ); ?>

		<?php if ( $order->has_status( 'failed' ) ) : ?>
			<div class="error-shee">
				<h1>Error</h1>
				<p class="woocommerce-notice woocommerce-notice--error woocommerce-thankyou-order-failed">Desfortunadamente no hemos podidos transferir tu orden, comunícate con nuestros asesores.</p>
			</div>
		<?php else : ?>

			<div class="thanks-section">
				<div class="thanks-section__title">
					<h1>Hola <?php echo esc_attr( $user->first_name ); ?></h1>
					<p>¡Gracias por tu compra!</p>
					<img src="<?php echo get_template_directory_uri(); ?>/img/isotipo-personaje.png">
				</div>
				<div class="thanks-section-rel">
					Estamos trabajando para validar tu información y medio de pago. Una vez confirmado y aprobado tu pedido <strong><?php echo $order->get_order_number(); ?></strong>, sera entregado según lo requerido. En breve te estará llegando un correo con el resumen de tu compra.
				</div>
			</div>
			<div class="thanks-col">
				<div class="line-s" style="background: transparent linear-gradient(90deg, #FF9F32 0%, #4B5AFC 100%) 0% 0% no-repeat padding-box;">
					Pedido <?php echo $order->get_order_number(); ?>
				</div>
				<div class="list-line-s">
					<ul>
						<li>
							<img src="<?php echo get_template_directory_uri(); ?>/img/time-is-money.png">
							<p><img src="<?php echo get_template_directory_uri(); ?>/img/tick.png">Validando Pedido</p>	
						</li>
						<li>
							<img src="<?php echo get_template_directory_uri(); ?>/img/money.png">
							<p>Pago Validado</p>	
						</li>
						<li>
							<img src="<?php echo get_template_directory_uri(); ?>/img/delivery.png">
							<p>Pedido por Entregar</p>	
						</li>
						<li>
							<img src="<?php echo get_template_directory_uri(); ?>/img/delivery-guy.png">
							<p>Pedido Entregado</p>	
						</li>
					</ul>
				</div>
				<div class="list-line-s newlis">
					<ul class="woocommerce-order-overview woocommerce-thankyou-order-details order_details">

						<li class="woocommerce-order-overview__order order">
							<?php esc_html_e( 'Order number:', 'woocommerce' ); ?>
							<strong><?php echo $order->get_order_number(); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></strong>
						</li>

						<li class="woocommerce-order-overview__date date">
							<?php esc_html_e( 'Date:', 'woocommerce' ); ?>
							<strong><?php echo wc_format_datetime( $order->get_date_created() ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></strong>
						</li>

						<?php if ( is_user_logged_in() && $order->get_user_id() === get_current_user_id() && $order->get_billing_email() ) : ?>
							<li class="woocommerce-order-overview__email email">
								<?php esc_html_e( 'Email:', 'woocommerce' ); ?>
								<strong><?php echo $order->get_billing_email(); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></strong>
							</li>
						<?php endif; ?>

						<li class="woocommerce-order-overview__total total">
							<?php esc_html_e( 'Total:', 'woocommerce' ); ?>
							<strong><?php echo $order->get_formatted_order_total(); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></strong>
						</li>

						<?php if ( $order->get_payment_method_title() ) : ?>
							<li class="woocommerce-order-overview__payment-method method">
								<?php esc_html_e( 'Payment method:', 'woocommerce' ); ?>
								<strong><?php echo wp_kses_post( $order->get_payment_method_title() ); ?></strong>
							</li>
						<?php endif; ?>

					</ul>
				</div>
				<div class="paymet">
					<?php do_action( 'woocommerce_thankyou_' . $order->get_payment_method(), $order->get_id() ); ?>		
				</div>
				<div class="bloxflex">
					<?php do_action( 'woocommerce_thankyou', $order->get_id() ); ?>
				</div>
			</div>


		<?php endif; ?>

		

	<?php else : ?>

		<p class="woocommerce-notice woocommerce-notice--success woocommerce-thankyou-order-received"><?php echo apply_filters( 'woocommerce_thankyou_order_received_text', esc_html__( 'Thank you. Your order has been received.', 'woocommerce' ), null ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></p>

	<?php endif; ?>

</div>
