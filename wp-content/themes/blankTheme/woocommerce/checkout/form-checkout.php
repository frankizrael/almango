<?php
/**
 * Checkout Form
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/checkout/form-checkout.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.5.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

do_action( 'woocommerce_before_checkout_form', $checkout );

// If checkout registration is disabled and not logged in, the user cannot checkout.
if ( ! $checkout->is_registration_enabled() && $checkout->is_registration_required() && ! is_user_logged_in() ) {
	echo esc_html( apply_filters( 'woocommerce_checkout_must_be_logged_in_message', __( 'You must be logged in to checkout.', 'woocommerce' ) ) );
	return;
}

?>


<form name="checkout" method="post" class="checkout woocommerce-checkout" action="<?php echo esc_url( wc_get_checkout_url() ); ?>" enctype="multipart/form-data">
	<div class="flex-content flex">
		<?php if ( $checkout->get_checkout_fields() ) : ?>
			<?php do_action( 'woocommerce_checkout_before_customer_details' ); ?>
			<div class="flex-item">
				<div class="boxFlex">
					<div class="checkoutTitle">
						<h3>
							<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Selecciona tu color favorito
						</h3>
					</div>
					<div class="simple-verifydata">
						<h4>
							<img src="<?php echo get_template_directory_uri(); ?>/img/user.png"> Datos personales
						</h4>
						<div class="editData">
							<a href="javascript:void(0)" class="edit">
								Editar datos <img src="<?php echo get_template_directory_uri(); ?>/img/pen.png">	
							</a>
						</div>
						<div class="datos">
							<ul>
								<li>
									DNI: 70437424
								</li>
								<li>
									Teléfono: 960579083
								</li>
								<li>
									Correo: frankde@gmail.com
								</li>
							</ul>
						</div>
						<div class="solitarfactura">
							<a href="javascript:void(0)" class="solFactura">Solicitar Factura</a>
						</div>
					</div>
					<div class="col2-set__c" id="customer_details">
						<?php do_action( 'woocommerce_checkout_billing' ); ?>
					</div>
				</div>
			</div>
			<div class="flex-item">
				<div class="boxFlex">
					<div class="checkoutTitle">
						<h3>
							<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Selecciona tu método de entrega
						</h3>
					</div>
					<div class="escoger_metodo">
						<ul>
							<li data-id="#method_domicilio" data-cr="">
								<div class="contentMetodo">
									<img src="<?php echo get_template_directory_uri(); ?>/img/camion.png">
								</div>
									<p>ENVÍO A DOMICILIO</p>
							</li>
							<li data-id="#method_tienda" data-cr="">
								<div class="contentMetodo">
									<img src="<?php echo get_template_directory_uri(); ?>/img/almacenar.png">
								</div>
									<p>RECOJO EN TIENDA</p>
							</li>
						</ul>
					</div>
					<div class="method_send">
						<div class="method_send_se">
							<div class="method_item" id="method_domicilio">
								<?php do_action( 'woocommerce_checkout_shipping' ); ?>		
							</div>
							<div class="method_item" id="method_tienda">
								<div class="mensajeRed">*Recuerda llevar tu DNI en físico y tu PDF o captura de pantalla de tu compra.</div>
								<div class="data_concesionario">
									<div class="data_item">
										<strong>Nombre del concesionario</strong>
										<p>Grupo Lauzher</p>
									</div>
									<div class="data_item">
										<strong>Horario de tienda</strong>
										<p>L a V : 9:00 a.m. - 6:00 p.m. - S : 9:00 a.m. - 1:00 p.m.</p>
									</div>
									<div class="data_item">
										<strong>Direccion</strong>
										<p>Jr. Enrique Barron 885</p>
									</div>
									<div class="data_item">
										<strong>Referencia</strong>
										<p>Altura de la cuadra 6 de Av. Alejandro Tirad</p>
									</div>
									<div class="data_item">
										<strong>Persona encargada de la entrega</strong>
										<p>Leda Sifuente</p>
									</div>
									<div class="data_item">
										<strong>Cargo</strong>
										<p>Jefa de tienda</p>
									</div>
								</div>
								<div class="checkoutTitle">
									<h3>
										<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Lo quiero el
									</h3>
									<div class="calendarJs">
										
									</div>
								</div>
								<div class="checkoutTitle">
									<h3>
										<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Horario único
									</h3>
									<div class="horarioJ">
										Lunes a viernes de 9 a.m. a 6 p.m.
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php do_action( 'woocommerce_checkout_after_customer_details' ); ?>
		<?php endif; ?>
		<?php do_action( 'woocommerce_checkout_before_order_review_heading' ); ?>
		<div class="flex-item">
			<div class="boxFlex">
				<div class="checkoutTitle">
					<h3>
						<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Mi pedido
					</h3>
				</div>			
				<?php do_action( 'woocommerce_checkout_before_order_review' ); ?>
				<div id="order_review" class="woocommerce-checkout-review-order">
					<?php do_action( 'woocommerce_checkout_order_review' ); ?>
				</div>
			</div>
			<?php do_action( 'woocommerce_checkout_after_order_review' ); ?>
		</div>
	</div>
</form>

<?php do_action( 'woocommerce_after_checkout_form', $checkout ); ?>
<script type="text/javascript">
	jQuery('header').addClass('header-notactive');
</script>