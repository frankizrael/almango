<?php
/**
 * My Account Dashboard
 *
 * Shows the first intro screen on the account dashboard.
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/dashboard.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see         https://docs.woocommerce.com/document/template-structure/
 * @package     WooCommerce/Templates
 * @version     2.6.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
$user = wp_get_current_user();
?>
<div class="centered-text">
	<p>
		¡Hola <?php echo esc_attr( $user->first_name ); ?>! 
	</p>
	<p><?php
		printf(
			__( 'Este es el administrador de tu cuenta. Aquí podrás ver tus pedidos, actualizar tus <a href="%1$s">direcciones</a>, ver tus <a href="%2$s">comprobantes</a>, ver tus motos elegidas, tus cupones y mas. Gracias por formar parte de esta familiar en Almango.pe .', 'woocommerce' ),
			esc_url( wc_get_endpoint_url( 'edit-address' ) ),
			esc_url( wc_get_endpoint_url( 'orders' ) )
		);
	?></p>	
</div>
<div class=""></div>
<?php
	/**
	 * My Account dashboard.
	 *
	 * @since 2.6.0
	 */
	do_action( 'woocommerce_account_dashboard' );

	/**
	 * Deprecated woocommerce_before_my_account action.
	 *
	 * @deprecated 2.6.0
	 */
	do_action( 'woocommerce_before_my_account' );

	/**
	 * Deprecated woocommerce_after_my_account action.
	 *
	 * @deprecated 2.6.0
	 */
	do_action( 'woocommerce_after_my_account' );

/* Omit closing PHP tag at the end of PHP files to avoid "headers already sent" issues. */
