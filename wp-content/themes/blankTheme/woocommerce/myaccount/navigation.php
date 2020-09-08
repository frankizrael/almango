<?php
/**
 * My Account navigation
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/navigation.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 2.6.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}
$user = wp_get_current_user();
$user_id = get_current_user_id();
do_action( 'woocommerce_before_account_navigation' );
?>
<nav class="myaccount-navigation">
	<div class="flex">
		<div class="image-people">
			<?php
				$imagenPerfil = get_field('imagen_perfil','user_'.get_current_user_id());
				if ($imagenPerfil) {
			?>
					<img src="<?php echo $imagenPerfil; ?>" id="perfilImg">
			<?php
				} else {
					?>
				<img src="<?php echo get_template_directory_uri(); ?>/img/isotipo-personaje.png" id="perfilImg">
					<?php
				}
			?>
			<div class="editImage">
				<input type="file" id="editFile" data="<?php echo $user_id; ?>">
				<img src="<?php echo get_template_directory_uri(); ?>/img/lapiz.png">
			</div>
		</div>
		<ul class="flex">
			<li class="link_list">
				<a href="<?php echo site_url(); ?>/my-account/edit-account/">
					<img src="<?php echo get_template_directory_uri(); ?>/img/avatar.png">
					Mis datos personales
				</a>
			</li>
			<li class="link_list">
				<a href="<?php echo site_url(); ?>/my-account/edit-address/billing/">
					<img src="<?php echo get_template_directory_uri(); ?>/img/home.png">
					Mis Direcciones
				</a>
			</li>
			<li class="link_list">
				<a href="<?php echo site_url(); ?>/my-account/edit-address/shipping/">
					<img src="<?php echo get_template_directory_uri(); ?>/img/file-storage.png">
					Mis Direcciones de Facturaciones
				</a>
			</li>
			<li class="link_list">
				<a href="<?php echo site_url(); ?>/my-account/orders/">
					<img src="<?php echo get_template_directory_uri(); ?>/img/shopping-bags.png">
					Mis pedidos
				</a>
			</li>
			<li class="link_list">
				<a href="<?php echo site_url(); ?>/my-account/downloads/">
					<img src="<?php echo get_template_directory_uri(); ?>/img/business.png">
					Mis comprobantes
				</a>
			</li>		
		</ul>	
	</div>
</nav>

<div class="flex-account">
	<div class="flex-sidebar">
		<div class="names">
			<h3><?php echo esc_attr( $user->first_name ); ?> <?php echo esc_attr( $user->last_name ); ?></h3>
			<p><?php echo esc_attr( $user->user_email ); ?></p>
		</div>
		<div class="lines-advance">
			<div class="flex flex-advnce">
				<div class="line <?php if(get_field('valid_mail','user_'.$user_id)) { echo 'emailValid'; } ?>">
					<i></i>
				</div>
				<div class="number">
					<?php if(get_field('valid_mail','user_'.$user_id)) { echo '100%'; } else { echo '50%'; } ?>
				</div>
			</div>
			<div class="simple-mss"><a href="<?php echo site_url(); ?>/my-account/edit-account/">Completa tu perfil</a></div>
		</div>
		<div class="lists flex">
			<div class="lists-it">
				<a href="<?php echo site_url(); ?>/my-account?extend=favorite">
					<div class="img">
						<img src="<?php echo get_template_directory_uri(); ?>/img/heart.png">
					</div>
					<div class="text">
						Mis elegidas
					</div>
				</a>
			</div>
			<div class="lists-it">
				<a href="<?php echo site_url(); ?>/my-account?extend=versus">
					<div class="img">
						<img src="<?php echo get_template_directory_uri(); ?>/img/versus.png">
					</div>
					<div class="text">
						Mis versus
					</div>
				</a>
			</div>
			<div class="lists-it">
				<a href="<?php echo site_url(); ?>/my-account?extend=descuentos">
					<div class="img">
						<img src="<?php echo get_template_directory_uri(); ?>/img/commerce.png">
					</div>
					<div class="text">
						Mis cupones
					</div>
				</a>
			</div>
			<div class="lists-it">
				<a href="<?php echo site_url(); ?>/my-account?extend=notifiy">
					<div class="img">
						<img src="<?php echo get_template_directory_uri(); ?>/img/bell.png">
					</div>
					<div class="text">
						Mis notificaciones
					</div>
				</a>
			</div>
		</div>
		<div class="onlist-s">
			<a href="javascript:void(0)">
				<img src="<?php echo get_template_directory_uri(); ?>/img/interface.png">
				Centro de ayuda
			</a>
			<a href="javascript:void(0)">
				<img src="<?php echo get_template_directory_uri(); ?>/img/communications.png">
				Contactar a Excelencia al cliente
			</a>
		</div>
		<div class="closessesion">
			<a href="<?php echo wp_logout_url( home_url().'/my-account/' ); ?>">
				Cerrar sesión
			</a>
		</div>
	</div>	
<?php do_action( 'woocommerce_after_account_navigation' ); ?>
<script type="text/javascript">
	jQuery('header').addClass('header-notactive');
	var urlajax = '<?php echo site_url(); ?>/wp-admin/admin-ajax.php';
</script>