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
	//echo esc_html( apply_filters( 'woocommerce_checkout_must_be_logged_in_message', __( 'You must be logged in to checkout.', 'woocommerce' ) ) );
	$location = site_url().'/my-account/';
	header('Location: '.$location);
	return;
}

$user = wp_get_current_user();
$user_id = get_current_user_id();

$user_telefono = get_user_meta( $user_id, 'billing_phone', true );
$user_correo = get_user_meta( $user_id, 'billing_email', true );

?>


<form name="checkout" method="post" class="checkout woocommerce-checkout" action="<?php echo esc_url( wc_get_checkout_url() ); ?>" enctype="multipart/form-data">
	<div class="flex-content flex">
		<?php if ( $checkout->get_checkout_fields() ) : ?>
			<?php do_action( 'woocommerce_checkout_before_customer_details' ); ?>
			<div class="flex-item">
				<div class="boxFlex">
					<div class="checkoutTitle">
						<h3>
							<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Confirma tus datos personales
						</h3>
					</div>
					<div class="simple-verifydata">
						<h4>
							<img src="<?php echo get_template_directory_uri(); ?>/img/user_1.png"> Datos personales
						</h4>
						<div class="editData">
							<a href="javascript:void(0)" class="edit">
								Editar datos <img src="<?php echo get_template_directory_uri(); ?>/img/pen.png">	
							</a>
						</div>
						<div class="datos">
							<ul>
								<li>
									DNI: <?php echo $user->display_name; ?>
								</li>
								<li>
									Teléfono: <?php echo $user_telefono; ?>
								</li>
								<li>
									Correo: <?php echo $user_correo; ?>
								</li>
							</ul>
						</div>
						<div class="solitarfactura">
							<a href="javascript:void(0)" class="solFactura">Solicitar Factura</a>
						</div>
						<div class="facturaFields" <?php if(!get_field('ruc','user_'.$user_id)) { ?> style="display: none;" <?php } ?>>
							<div class="factura_flex">
								<div class="factura30">
									<label>RUC</label>
									<input type="number" name="add_ruc" id="add_ruc" placeholder="Ingresa tu RUC" <?php if(get_field('ruc','user_'.$user_id)) { ?> value="<?php echo get_field('ruc','user_'.$user_id); ?>" <?php } ?>>
								</div>
								<div class="factura30">
									<label>Razón Social</label>
									<input type="text" name="razon_social" id="razon_social" placeholder="Ingresa tu Razón social" <?php if(get_field('razon_social','user_'.$user_id)) { ?> value="<?php echo get_field('razon_social','user_'.$user_id); ?>" <?php } ?>>
								</div>
								<div class="factura30">
									<a href="javascript:void(0)" class="addFacture" id-use="<?php echo $user_id; ?>">Agregar Factura</a>
								</div>
								<p class="validation" id="valID"></p>
							</div>
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
								<div class="data_dom">
									<?php do_action( 'woocommerce_checkout_shipping' ); ?>										
								</div>
								<div class="checkoutTitle calendarDiv">
									<h3>
										<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Lo quiero el
									</h3>
									<div class="calendarJs">
										<label>Ingresa una fecha</label>
										<input type="text" name="calendarDomicilio" id="calendarDomicilio" placeholder="Fecha ..." autocomplete="calendardomicilio">
									</div>
								</div>	
								<div class="checkoutTitle horarioDiv">
									<h3>
										<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Horario único
									</h3>
									<p>Lunes a viernes de 9 a.m. a 6 p.m.</p>
								</div>	
							</div>
							<div class="method_item" id="method_tienda">
								<div class="mensajeRed">*Recuerda llevar tu DNI en físico y tu PDF o captura de pantalla de tu compra.</div>
								<div class="data_concesionario">
									<?php
										$arraycats = array();
										$concesionario = get_field('concesionarios','options');
										foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
											$_product = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
											$product_id = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );
											if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_checkout_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
												
											$cat = get_the_terms($product_id,'product_cat', array( 'order' => 'DESC'));
											if ($cat) {				
												foreach ($cat as $ta) {						
													if ($ta->parent == 67) {										
													//if ($ta->parent == 24) {
														array_push($arraycats, $ta->term_id);
													}
												}
											}
											}
										}			
										$newarraycats = array_unique($arraycats);
									?>
									<?php
										if ($newarraycats) {
											foreach ($newarraycats as $a_id) {					
												foreach ($concesionario as $con) {
													if ($con['marca'] == $a_id) {
												?>
												<div class="data_concesionario__item">
													<div class="data_item">
														<strong>Nombre del concesionario</strong>
														<p><?php echo $con['nombre']; ?></p>
													</div>
													<div class="data_item">
														<strong>Horario de tienda</strong>
														<p><?php echo $con['horario']; ?></p>
													</div>
													<div class="data_item">
														<strong>Direccion</strong>
														<p><?php echo $con['direccion']; ?></p>
													</div>
													<div class="data_item">
														<strong>Referencia</strong>
														<p><?php echo $con['referencia']; ?></p>
													</div>
													<div class="data_item">
														<strong>Persona encargada de la entrega</strong>
														<p><?php echo $con['encargado']; ?></p>
													</div>
													<div class="data_item">
														<strong>Cargo</strong>
														<p><?php echo $con['cargo']; ?></p>
													</div>												
												</div>
												<?php												
													}
												}	
											}
										}
									?>
								</div>
								<div class="checkoutTitle calendarDiv">
									<h3>
										<img src="<?php echo get_template_directory_uri(); ?>/img/check.png">Lo quiero el
									</h3>
									<div class="calendarJs">
										<input type="text" name="calendarDomicilio" id="calendarDomicilio2" placeholder="Fecha ..." autocomplete="calendardomicilio" >
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
	var urlajax = '<?php echo site_url(); ?>/wp-admin/admin-ajax.php';
</script>