<?php
/**
 * Edit address form
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/form-edit-address.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.6.0
 */

defined( 'ABSPATH' ) || exit;

$page_title = ( 'billing' === $load_address ) ? esc_html__( 'Mis direcciones', 'woocommerce' ) : esc_html__( 'Mi facturación', 'woocommerce' );


$user_id = get_current_user_id();
do_action( 'woocommerce_before_edit_account_address_form' ); ?>

<?php if ( ! $load_address ) : ?>
	<?php wc_get_template( 'myaccount/my-address.php' ); ?>
<?php else : ?>
		<p>Aquí puedes editar tus direcciones de envío.</p>
	<div class="newflex">
		<div class="new_left">
			<form method="post">
				<h3><?php echo apply_filters( 'woocommerce_my_account_edit_address_title', $page_title, $load_address ); ?></h3><?php // @codingStandardsIgnoreLine ?>
				</p>
				<div class="woocommerce-address-fields">
					<?php do_action( "woocommerce_before_edit_address_form_{$load_address}" ); ?>
					<div class="woocommerce-address-fields__field-wrapper">		
						<?php
							if ($load_address === 'shipping') {
								?>

						<div class="form-row">
							<label>RUC</label>
							<input type="number" name="ruc" id="ruc" placeholder="Ingresa tu RUC" <?php if(get_field('ruc','user_'.$user_id)) { ?> value="<?php echo get_field('ruc','user_'.$user_id); ?>" <?php } ?>>
							<p class="validation" id="valID"></p>
						</div>
						<div class="form-row">
							<label>Razón Social</label>
							<input type="text" name="razon_social" id="razon_social" placeholder="Ingresa tu Razón social" <?php if(get_field('razon_social','user_'.$user_id)) { ?> value="<?php echo get_field('razon_social','user_'.$user_id); ?>" <?php } ?>>
						</div>
								<?php
							}
						?>
						<?php
						foreach ( $address as $key => $field ) {
							woocommerce_form_field( $key, $field, wc_get_post_data_by_key( $key, $field['value'] ) );
						}
						?>
					</div>
					<?php do_action( "woocommerce_after_edit_address_form_{$load_address}" ); ?>
					<p>
						<button type="submit" class="button" name="save_address" value="<?php esc_attr_e( 'Save address', 'woocommerce' ); ?>"><?php esc_html_e( 'Guardar dirección', 'woocommerce' ); ?></button>
						<?php wp_nonce_field( 'woocommerce-edit_address', 'woocommerce-edit-address-nonce' ); ?>
						<input type="hidden" name="action" value="edit_address" />
					</p>
				</div>
			</form>
		</div>
		<div class="new_right">
			<h3>Mis Direcciones Guardadas</h3>
		</div>
	</div>

<?php endif; ?>

<script type="text/javascript">
	<?php
		if ($load_address === 'shipping') {
			?>
			jQuery('.myaccount-navigation .link_list').eq(2).find('a').addClass('active');
			<?php
		} else {
			?>
			jQuery('.myaccount-navigation .link_list').eq(1).find('a').addClass('active');
			<?php
		}		
	?>
</script>


<?php do_action( 'woocommerce_after_edit_account_address_form' ); ?>
