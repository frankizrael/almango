<?php
/**
 * Lost password form
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/form-lost-password.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.5.2
 */

defined( 'ABSPATH' ) || exit;

do_action( 'woocommerce_before_lost_password_form' );
?>
<div class="fullHeight contentLost" style="background: url(<?php echo get_template_directory_uri(); ?>/img/7971.png);">
	<h3>¡Ayuda! Olvide mi contraseña</h3>
	<form method="post" class="woocommerce-ResetPassword lost_reset_password">
		<h2>Olvide mi contraseña</h2>
		<p>Por favor ingresar tu numero de DNI</p>
		<p class="woocommerce-form-row woocommerce-form-row--first form-row form-row-first">
			<label for="user_login"><img src="<?php echo get_template_directory_uri(); ?>/img/dni.png"><?php esc_html_e( 'DNI', 'woocommerce' ); ?></label>
			<input class="woocommerce-Input woocommerce-Input--text input-text" type="text" name="user_login" id="user_login" autocomplete="username" placeholder="Ingresa tu DNI" />
		</p>
		<div class="clear"></div>
		<?php do_action( 'woocommerce_lostpassword_form' ); ?>
		<p class="woocommerce-form-row form-row">
			<input type="hidden" name="wc_reset_password" value="true" />
			<button type="submit" class="woocommerce-Button button" value="<?php esc_attr_e( 'RECUPERAR CUENTA', 'woocommerce' ); ?>"><?php esc_html_e( 'Reset password', 'woocommerce' ); ?></button>
		</p>
		<?php wp_nonce_field( 'lost_password', 'woocommerce-lost-password-nonce' ); ?>
	</form>
</div>

<script type="text/javascript">
	jQuery('.top-background').hide();
</script>
<?php
do_action( 'woocommerce_after_lost_password_form' );
