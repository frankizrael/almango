<?php
/**
 * Edit account form
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/form-edit-account.php.
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

defined( 'ABSPATH' ) || exit;

$user_id = get_current_user_id();
do_action( 'woocommerce_before_edit_account_form' ); ?>
<p>Aquí puedes editar tus datos personales y preferencias.</p>
<div class="editAccount">	
	<form class="woocommerce-EditAccountForm edit-account" action="" method="post" <?php do_action( 'woocommerce_edit_account_form_tag' ); ?> >
			<?php do_action( 'woocommerce_edit_account_form_start' ); ?>
		<div class="left_edit">
			<div class="title_edit">
				<h2>Información básica</h2>
			</div>	
			<div class="woocommerce-form-row col_50">
				<label for="account_first_name"><?php esc_html_e( 'Nombres', 'woocommerce' ); ?>&nbsp;<span class="required">*</span></label>
				<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_first_name" id="account_first_name" autocomplete="given-name" value="<?php echo esc_attr( $user->first_name ); ?>" />
			</div>
			<div class="woocommerce-form-row col_50">
				<label for="account_last_name"><?php esc_html_e( 'Apellidos', 'woocommerce' ); ?>&nbsp;<span class="required">*</span></label>
				<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_last_name" id="account_last_name" autocomplete="family-name" value="<?php echo esc_attr( $user->last_name ); ?>" />
			</div>

			<div class="woocommerce-form-row col_50">
				<label for="account_display_name"><?php esc_html_e( 'DNI', 'woocommerce' ); ?>&nbsp;<span class="required">*</span></label>
				<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="account_display_name" id="account_display_name" value="<?php echo esc_attr( $user->display_name ); ?>" />
				<p class="printValidation" id="validDNI"></p> 
			</div>
			<div class="woocommerce-form-row col_50">
				<label for="user_genero"><?php esc_html_e( 'Genero', 'woocommerce' ); ?></label>
				<select name="user_genero" id="user_genero">
	                <option value="masculino">Masculino</option>
	                <option value="femenimo">Femenino</option>
	                <option value="no-especifico">No especifica</option>
	            </select>
	            <script type="text/javascript">
	            	jQuery('#user_genero').val('<?php echo get_field('user_genero','user_'.$user_id);?>');
	            </script>
			</div>

			<div class="woocommerce-form-row col_50">
				<label for="account_birthday"><?php esc_html_e( 'Cumpleaños', 'woocommerce' ); ?></label>
				<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="user_birthdate" id="user_birthdate" value="<?php echo get_field('user_birthdate','user_'.$user_id);?>" /> 
			</div>
			<div class="woocommerce-form-row col_50">
				<label for="account_birthday"><?php esc_html_e( 'Celular', 'woocommerce' ); ?></label>
				<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="billing_phone" id="billing_phone" value="<?php echo get_user_meta( $user_id, 'billing_phone', true ) ?>" /> 
			</div>


			<div class="woocommerce-form-row col_100 woocommerce__email__valid">
				<label for="account_email"><?php esc_html_e( 'Correo electrónico', 'woocommerce' ); ?>&nbsp;<span class="required">*</span></label>
				<input type="email" class="woocommerce-Input woocommerce-Input--email input-text" name="account_email" id="account_email" autocomplete="email" value="<?php echo esc_attr( $user->user_email ); ?>" />
				<span class="validationMail <?php if(get_field('valid_mail','user_'.$user_id)) { echo 'emailValid'; } ?>"><?php if(get_field('valid_mail','user_'.$user_id)) { echo 'Correo verificado'; } else { echo 'Correo no verificado'; } ?></span>
			</div>

			<div class="woocommerce-form-row col_100 onlyread">
				<label for="account_email"><?php esc_html_e( 'Contraseña actual', 'woocommerce' ); ?>&nbsp;<span class="required">*</span></label>
				<div class="similarInput">***********</div>
				<div class="buttons_core">
					<a href="javascript:void(0)" class="modalOpen" data="#passChange">
						Cambiar contraseña
					</a>
				</div>
			</div>
			<div class="myModal" id="passChange">
				<div class="modalContent">
					<div class="close_modal"></div>
					<h2>Cambio de contraseña</h2>
					<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
						<label for="password_current"><img src="<?php echo get_template_directory_uri(); ?>/img/lock.png"><?php esc_html_e( 'Contraseña actual', 'woocommerce' ); ?></label>
						<input type="password" class="woocommerce-Input woocommerce-Input--password input-text" name="password_current" id="password_current" autocomplete="off" />
					</div>
					<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
						<label for="password_1"><img src="<?php echo get_template_directory_uri(); ?>/img/lock.png"><?php esc_html_e( 'Nuevo Password', 'woocommerce' ); ?></label>
						<input type="password" class="woocommerce-Input woocommerce-Input--password input-text" name="password_1" id="password_1" autocomplete="off" />
					</div>
					<div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
						<label for="password_2"><img src="<?php echo get_template_directory_uri(); ?>/img/lock.png"><?php esc_html_e( 'Confirmar nuevo Password', 'woocommerce' ); ?></label>
						<input type="password" class="woocommerce-Input woocommerce-Input--password input-text" name="password_2" id="password_2" autocomplete="off" />
					</div>
					<div class="changePassReview">
						<a href="javascript:void(0)" class="changePass btn">GUARDAR</a>
					</div>
				</div>
			</div>
			<?php do_action( 'woocommerce_edit_account_form' ); ?>
		</div>
		<div class="right_edit">
			<div class="title_edit">
				<h2>Preferencias</h2>
			</div>
			<div class="woocommerce-form-row col_100">
				<label for="estilos_preferidos"><?php esc_html_e( 'Estilos de motos preferidas', 'woocommerce' ); ?></label>
				<select id="allstles">
					<option disabled selected>Elige un estilo</option>
					<?php
					    $taxonomy = 'product_cat';
						$terms = get_terms($taxonomy);
						if ( $terms && !is_wp_error( $terms ) ) :							
						?>
				        <?php foreach ( $terms as $term ) { 
				        	//if ($term->parent != 24 && $term->term_id != 15 && $term->name != 'addon' && $term->term_id != 24) {
				        	if ($term->parent != 67 && $term->term_id != 15 && $term->name != 'addon' && $term->term_id != 67) {
				        ?>
				            <option value="<?php echo sanitize_title($term->name); ?>" data="<?php echo $term->name; ?>"><?php echo $term->name; ?></option>
				        <?php 
				        	}
				    	} ?>
						<?php endif;
					?>
				</select>
				<div class="select_style">					
				</div>
				<input type="hidden" name="estilos_preferidos" id="estilos_preferidos" value="<?php echo get_field('estilos_preferidos','user_'.$user_id);?>" /> 
			</div>
			<div class="woocommerce-form-row col_100">
				<label for="tienes_moto"><?php esc_html_e( '¿Tienes moto?', 'woocommerce' ); ?></label>
				<select name="tienes_moto" id="tienes_moto">
	                <option value="si">Si</option>
	                <option value="no">No</option>
	                <option value="quiero_una">Quiero una</option>
	            </select>
	            <script type="text/javascript">
	            	jQuery('#tienes_moto').val('<?php echo get_field('tienes_moto','user_'.$user_id);?>');
	            </script>
			</div>
			<div class="woocommerce-form-row col_100">
				<label for="redes_sociales"><?php esc_html_e( '¿Cuáles es tu red social favorita?', 'woocommerce' ); ?></label>
				<select name="redes_sociales" id="redes_sociales">
	                <option value="facebook">Facebook</option>
	                <option value="twitter">Twitter</option>
	                <option value="instagram">Instagram</option>
	            </select>
	            <script type="text/javascript">
	            	jQuery('#redes_sociales').val('<?php echo get_field('redes_sociales','user_'.$user_id);?>');
	            </script>
			</div>
			
		</div>	
		<div class="send_info">
			<?php wp_nonce_field( 'save_account_details', 'save-account-details-nonce' ); ?>
			<button type="submit" class="woocommerce-Button button" name="save_account_details" value="<?php esc_attr_e( 'Save changes', 'woocommerce' ); ?>"><?php esc_html_e( 'Guardar', 'woocommerce' ); ?></button>
				<input type="hidden" name="action" value="save_account_details" />
		</div>

			<?php do_action( 'woocommerce_edit_account_form_end' ); ?>
	</form>
	
</div>


<?php do_action( 'woocommerce_after_edit_account_form' ); ?>
