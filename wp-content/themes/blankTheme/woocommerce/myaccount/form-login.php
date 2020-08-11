<?php
/**
 * Login Form
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/form-login.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.6.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

do_action( 'woocommerce_before_customer_login_form' ); ?>
<section class="loginApp" style="background-image: url(<?php echo get_template_directory_uri(); ?>/src/assets/img/fondo_login.png);">
	<?php if ( 'yes' === get_option( 'woocommerce_enable_myaccount_registration' ) ) : ?>
	<div class="closLum" id="customer_login">
		<div class="tabs_ind">
			<div class="tab_in active" data="#tab_user">Iniciar Sesión</div>
			<div class="tab_in" data="#tab_crear">Crear cuenta</div>
		</div>
		<div class="tabs_content">
			<div class="closLum__login closLum__content active" id="tab_user" >
			<?php endif; ?>
				<div class="title_welcome">
					<h2>Bienvenido a <span class="morado">Almango</span><span class="naranja">.pe</span></h2>
					<p>Inicia Sesión para continuar.</p>
				</div>
				<form class="woocommerce-form woocommerce-form-login login" method="post">

					<?php do_action( 'woocommerce_login_form_start' ); ?>

					<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput">
						<label>
							<img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">
							DNI
						</label>
						<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="username" id="username" autocomplete="username" value="<?php echo ( ! empty( $_POST['username'] ) ) ? esc_attr( wp_unslash( $_POST['username'] ) ) : ''; ?>" placeholder="<?php esc_html_e( 'Ingresa tu DNI', 'woocommerce' ); ?>"/>
					</div>
					<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput">
						<label>
							<img src="<?php echo get_template_directory_uri(); ?>/img/lock.png">
							CONTRASEÑA
						</label>
						<input class="woocommerce-Input woocommerce-Input--text input-text" type="password" name="password" id="password" autocomplete="current-password" placeholder="<?php esc_html_e( 'Ingresa tu contraseña', 'woocommerce' ); ?>" />
					</div>

					<?php do_action( 'woocommerce_login_form' ); ?>
					<div class="woocommerce__remenber">
						<label class="woocommerce-form__label woocommerce-form__label-for-checkbox woocommerce-form-login__rememberme">
							<input class="woocommerce-form__input woocommerce-form__input-checkbox" name="rememberme" type="checkbox" id="rememberme" value="forever" /> <span><?php esc_html_e( 'Recuérdame', 'woocommerce' ); ?></span>
						</label>
					</div>
					<div class="woocommerce__button">				
						<?php wp_nonce_field( 'woocommerce-login', 'woocommerce-login-nonce' ); ?>
						<button type="submit" class="woocommerce-button button woocommerce-form-login__submit" name="login" value="<?php esc_attr_e( 'Log in', 'woocommerce' ); ?>"><?php esc_html_e( 'Iniciar sesión', 'woocommerce' ); ?></button>
					</div>
					<div class="woocommerce__lostpass">
						<a href="<?php echo esc_url( wp_lostpassword_url() ); ?>"><?php esc_html_e( '¿Olvidaste tu contraseña?', 'woocommerce' ); ?></a>
						<div class="trigger_crear">Crear mi cuenta</div>
					</div>
					<div class="whyAccount">
						<h2>¿Porque tener mi cuenta?</h2>
						<ul>
							<li><img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">¡Descuentos para tu engreida!</li>
							<li><img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">¡Promociones únicas para ti!</li>
							<li><img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">¡Enviamos tu compra a donde te encuentres!</li>
							<li><img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">¡Asesoramiento 5 estrellas!</li>
							<li><img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">¡Y mucho mas.</li>
						</ul>
					</div>

					<?php do_action( 'woocommerce_login_form_end' ); ?>

				</form>
			<?php if ( 'yes' === get_option( 'woocommerce_enable_myaccount_registration' ) ) : ?>

			</div>
			<div class="closLum__register closLum__content" id="tab_crear">
				<div class="title_welcome">
					<h2>Crea tu cuenta</h2>
					<p>Empieza tu pasión con nosotros</p>
				</div>

				<form method="post" class="woocommerce-form woocommerce-form-register register registerOrderJs" <?php do_action( 'woocommerce_register_form_tag' ); ?> >

					<?php do_action( 'woocommerce_register_form_start' ); ?>

					<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput register_5" data="email">
						<label>
							<img src="<?php echo get_template_directory_uri(); ?>/img/correo_r.png">
							CORREO
						</label>
						<input type="email" class="woocommerce-Input woocommerce-Input--text input-text" name="email" id="reg_email" autocomplete="email" value="<?php echo ( ! empty( $_POST['email'] ) ) ? esc_attr( wp_unslash( $_POST['email'] ) ) : ''; ?>" placeholder="<?php esc_html_e( 'Ingresa tu correo', 'woocommerce' ); ?>"/>
					</div>

					<?php if ( 'no' === get_option( 'woocommerce_registration_generate_username' ) ) : ?>
						<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput" data="dni">
							<label>
								<img src="<?php echo get_template_directory_uri(); ?>/img/dni.png">
								DOCUMENTO
							</label>
							<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="username" id="reg_username" autocomplete="username" value="<?php echo ( ! empty( $_POST['username'] ) ) ? esc_attr( wp_unslash( $_POST['username'] ) ) : ''; ?>" placeholder="<?php esc_html_e( 'Usuario', 'woocommerce' ); ?>"/>
						</div>
					<?php endif; ?>


					<?php if ( 'no' === get_option( 'woocommerce_registration_generate_password' ) ) : ?>

						<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput" data="password">
							<label>
								<img src="<?php echo get_template_directory_uri(); ?>/img/lock.png">
								CONTRASEÑA
							</label>
							<input type="password" class="woocommerce-Input woocommerce-Input--text input-text" name="password" id="reg_password" autocomplete="new-password" placeholder="<?php esc_html_e( 'Ingresa tu contraseña', 'woocommerce' ); ?>" />
						</div>

					<?php else : ?>

						<p><?php esc_html_e( 'A password will be sent to your email address.', 'woocommerce' ); ?></p>

					<?php endif; ?>

					<?php do_action( 'woocommerce_register_form' ); ?>

					<div class="woocommerce-FormRow form-row">
						<p class="checkin checkOne">He leído y estoy de acuerdo con los <a href="#">Términos y condiciones de Uso</a> y <a href="#">la Política de Privacidad</a>.</p>
						<p class="checkin checkTwo">Acepto que <a href="<?php echo site_url(); ?>">Almango.pe</a> me envie promociones, descuentos y cupones.</p>
						<?php wp_nonce_field( 'woocommerce-register', 'woocommerce-register-nonce' ); ?>
						<div class="woocommerce__button">
						<button type="submit" class=" button disable" name="register" id="registerButton" value="<?php esc_attr_e( 'Register', 'woocommerce' ); ?>"><?php esc_html_e( 'REGISTRARME', 'woocommerce' ); ?></button>
						</div>
						<p class="about_sh">
							¡YA TENGO MI CUENTA! <a href="#" class="backtabuser">INICIA SESIÓN</a>
						</p>
					</div>
					<?php do_action( 'woocommerce_register_form_end' ); ?>

				</form>

			</div>
		</div>
	</div>
	<?php endif; ?>
	
</section>



<?php do_action( 'woocommerce_after_customer_login_form' ); ?>

<script type="text/javascript">
	jQuery('.top-background').hide();
</script>