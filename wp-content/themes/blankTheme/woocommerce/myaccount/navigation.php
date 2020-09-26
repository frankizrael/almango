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
			<a href="<?php echo site_url(); ?>/preguntas-frecuentes">
				<img src="<?php echo get_template_directory_uri(); ?>/img/interface.png">
				Centro de ayuda
			</a>
			<a href="javascript:void(0)" onclick="$crisp.push(['do', 'chat:open'])">
				<img src="<?php echo get_template_directory_uri(); ?>/img/communications.png">
				Contactar a Excelencia al cliente
			</a>
		</div>
		<div class="closessesion">
			<a href="javascript:void(0)" class="modalOpen" data="#closeSesion">
				Cerrar sesión
			</a>
		</div>
	</div>	

<div class="myModal" id="closeSesion">
	<div class="modalContent">
		<div class="close_modal"></div>
		<h3 class="rightH3">¡Para!</h3>
		<div class="decoration">
			<div class="motitoT">
					<svg xmlns="http://www.w3.org/2000/svg" width="109" height="63" viewBox="0 0 109 63"><defs><style>.a{fill:#707487;}.b{fill:#5b5d6e;}.c{fill:#e4eaf8;}.d{fill:#d8dce5;}.e{fill:#ff5050;}.f{fill:#f24646;}</style></defs><g transform="translate(0 -102.262)"><path class="a" d="M368.33,277.783c0,7.833,6.6,14.182,14.736,14.182s14.736-6.35,14.736-14.182a13.693,13.693,0,0,0-1.687-6.588h0a15.008,15.008,0,0,0-26.1,0h0A13.7,13.7,0,0,0,368.33,277.783Zm7.368,0a7.373,7.373,0,1,1,7.368,7.091A7.255,7.255,0,0,1,375.7,277.783Z" transform="translate(-289.916 -128.281)"/><path class="b" d="M372.606,277.782a14.368,14.368,0,0,1,12.6-14.032,15.93,15.93,0,0,0-2.138-.15,14.83,14.83,0,0,0-13.049,7.594h0a13.693,13.693,0,0,0-1.687,6.588c0,7.833,6.6,14.182,14.736,14.182a15.42,15.42,0,0,0,2.138-.15A14.371,14.371,0,0,1,372.606,277.782Z" transform="translate(-289.915 -128.28)"/><path class="a" d="M7.575,277.783c0,7.833,6.6,14.182,14.736,14.182s14.736-6.35,14.736-14.182a13.693,13.693,0,0,0-1.687-6.588h0a15.008,15.008,0,0,0-26.1,0h0A13.693,13.693,0,0,0,7.575,277.783Zm7.368,0a7.237,7.237,0,0,1,7.368-7.091,7.1,7.1,0,1,1,0,14.182A7.234,7.234,0,0,1,14.943,277.783Z" transform="translate(-5.962 -128.281)"/><path class="b" d="M11.851,277.782a14.368,14.368,0,0,1,12.6-14.032,16.033,16.033,0,0,0-2.138-.15A14.47,14.47,0,0,0,7.574,277.782c0,7.833,6.6,14.182,14.736,14.182a15.42,15.42,0,0,0,2.138-.15A14.37,14.37,0,0,1,11.851,277.782Z" transform="translate(-5.962 -128.28)"/><g transform="translate(7.26 122.721)"><path class="c" d="M77.488,298.252l17.027-6.293a1.126,1.126,0,0,1,.39-.07h8.275a23.435,23.435,0,0,0-2.867,8.386H77.878a1.067,1.067,0,0,1-1.087-1.046A1.048,1.048,0,0,1,77.488,298.252Z" transform="translate(-67.703 -273.493)"/><path class="c" d="M34.681,206.667l9.349-4.558L50.044,206l-14.71,2.568A1.012,1.012,0,0,1,34.681,206.667Z" transform="translate(-34.101 -202.109)"/></g><g transform="translate(7.26 122.721)"><path class="d" d="M81.069,299.23a1.048,1.048,0,0,1,.7-.977l17.027-6.293a1.127,1.127,0,0,1,.39-.07H94.906a1.121,1.121,0,0,0-.39.07l-17.027,6.293a1.048,1.048,0,0,0-.7.977,1.067,1.067,0,0,0,1.087,1.046h4.277A1.068,1.068,0,0,1,81.069,299.23Z" transform="translate(-67.703 -273.494)"/><path class="d" d="M38.957,206.667l6.91-3.369-1.838-1.189-9.349,4.558a1.012,1.012,0,0,0,.653,1.9l3.157-.551A.974.974,0,0,1,38.957,206.667Z" transform="translate(-34.101 -202.109)"/></g><path class="e" d="M223.209,160.41c-5.4,3.144-13.108,5.121-19.9,8.6l-13.4-6.51.41-.781a21.808,21.808,0,0,1,19.347-11.429h0a17.431,17.431,0,0,1,14.165,7.143l1.233,1.714A15.075,15.075,0,0,1,223.209,160.41Z" transform="translate(-149.477 -38.189)"/><path class="f" d="M195.146,162.348a.859.859,0,0,1-.4-1.175h0a21.542,21.542,0,0,1,13.586-10.678,21.751,21.751,0,0,0-18.014,11.387l-.41.781,13.4,6.51c.977-.5,1.972-.969,2.977-1.415Z" transform="translate(-149.477 -38.35)"/><path class="a" d="M113.042,198.094h-3.529a13.412,13.412,0,0,1-8.337-2.888l-9,3.471,23.28,15.057h0a28.348,28.348,0,0,1,10.927-9.012Z" transform="translate(-72.553 -73.9)"/><g transform="translate(19.623 121.306)"><path class="a" d="M113.042,198.094h-3.529a13.412,13.412,0,0,1-8.337-2.888l-9,3.471,23.28,15.057h0a28.348,28.348,0,0,1,10.927-9.012Z" transform="translate(-92.176 -195.206)"/></g><path class="b" d="M94.9,207.022l-2.723,1.05,23.28,15.057h0a21.854,21.854,0,0,1,1.44-1.88Z" transform="translate(-72.553 -83.295)"/><path class="e" d="M65.751,177.037l0,0a12.886,12.886,0,0,1-1.925-1.8,9.02,9.02,0,0,0-6.82-3.074H48.255a1.275,1.275,0,0,0-.743,2.345l9.268,5.994Z" transform="translate(-36.932 -55.574)"/><path class="f" d="M51.85,174.5a1.275,1.275,0,0,1,.743-2.345H48.255a1.275,1.275,0,0,0-.743,2.345l9.268,5.994,2.717-1.048Z" transform="translate(-36.932 -55.573)"/><path class="e" d="M238.98,122.162A48.867,48.867,0,0,0,221.5,109.484a.964.964,0,0,0-1.1.229.866.866,0,0,0-.111,1.061c2.586,4.241,5.648,12.1-2.905,17.08-11.615,6.762-33.786,8.1-34.84,30.5a1.681,1.681,0,0,0,1.712,1.731h28.116a1.67,1.67,0,0,0,1.17-.469,1.544,1.544,0,0,0,.477-1.13c-.04-4.7,1.4-20.5,21.655-26.291a1.4,1.4,0,0,0,.941-1.89,2,2,0,0,1,1.069-2.639A3.481,3.481,0,0,0,238.98,122.162Z" transform="translate(-143.684 -5.677)"/><path class="f" d="M186.825,158.355c1.055-22.4,23.225-23.737,34.84-30.5,8.409-4.9,5.591-12.575,3.036-16.863-1.02-.527-2.085-1.032-3.2-1.508a.964.964,0,0,0-1.1.229.866.866,0,0,0-.111,1.061c2.586,4.241,5.648,12.1-2.905,17.08-11.615,6.762-33.786,8.1-34.84,30.5a1.681,1.681,0,0,0,1.712,1.731h4.277A1.68,1.68,0,0,1,186.825,158.355Z" transform="translate(-143.684 -5.677)"/><path class="c" d="M246.218,223.586A63.358,63.358,0,0,0,233.7,229.6l21.387,13.141a25.36,25.36,0,0,1,5.4-10.494Z" transform="translate(-183.951 -96.465)"/><path class="d" d="M247.9,224.607l-1.682-1.02A63.351,63.351,0,0,0,233.7,229.6l2.317,1.424A47.764,47.764,0,0,1,247.9,224.607Z" transform="translate(-183.951 -96.466)"/><path d="M107.8,151.645a1.61,1.61,0,0,0-1.958,1.1,13.057,13.057,0,0,1-12.7,9.428A12.907,12.907,0,0,1,80.01,149.537a12.519,12.519,0,0,1,5.854-10.513c.637,1.181,1.293,2.4,1.926,3.588a8.526,8.526,0,0,0-3.62,6.926h0a8.978,8.978,0,0,0,17.943,0h0c0-5.709-5.7-9.89-11.449-8.3-.637-1.195-1.3-2.42-1.935-3.605a13.531,13.531,0,0,1,4.412-.736,13.179,13.179,0,0,1,11.629,6.768,1.515,1.515,0,0,0,.138.21,16.378,16.378,0,0,1,.935,2.451,1.611,1.611,0,0,0,1.959,1.1,1.539,1.539,0,0,0,1.144-1.885,17.1,17.1,0,0,0-1.36-3.357,16.4,16.4,0,0,0-14.444-8.374,16.809,16.809,0,0,0-5.9,1.067c-.869-1.6-1.628-2.989-2.148-3.939a35.8,35.8,0,0,1,7.339-2.955,2.875,2.875,0,0,0,1.929-3.9.535.535,0,0,1,.286-.706,4.944,4.944,0,0,0,1.83-7.822,50.422,50.422,0,0,0-18.034-13.081,2.447,2.447,0,0,0-3.175,3.41c2.316,3.8,3.992,8.787.543,12.718a18.974,18.974,0,0,0-13.392-7.882,1.594,1.594,0,0,0-1.783,1.349,1.557,1.557,0,0,0,1.4,1.716,15.778,15.778,0,0,1,11.337,6.855c-4.579,2.907-12.746,5.124-19.532,8.464l-.022.01-11.17-5.55a20.018,20.018,0,0,1,12.5-9.267,1.54,1.54,0,0,0,1.151-1.881,1.611,1.611,0,0,0-1.955-1.107A23.169,23.169,0,0,0,39.5,122.686H36.952A11.671,11.671,0,0,1,28.12,118.7a10.62,10.62,0,0,0-8.052-3.63H11.314a2.908,2.908,0,0,0-2.808,2,2.757,2.757,0,0,0,1.17,3.169l3.911,2.53-6.482,3.162h0a2.5,2.5,0,0,0-1.32,3.082,2.65,2.65,0,0,0,2.97,1.716l13.65-2.257,17.209,11.13H34.453a2.769,2.769,0,0,0-.965.172l-3.4,1.258a16.461,16.461,0,0,0-13.744-7.227C7.33,133.811,0,140.865,0,149.536s7.33,15.726,16.339,15.726A16.137,16.137,0,0,0,32.6,151.08h4.817q-.072.771-.11,1.564a3.1,3.1,0,0,0,.9,2.32,3.339,3.339,0,0,0,2.357.97H68.684a3.238,3.238,0,0,0,2.271-.91,3,3,0,0,0,.927-2.193,24.377,24.377,0,0,1,10.5-20.219c.507.926,1.2,2.206,2,3.663A15.6,15.6,0,0,0,76.8,149.536c0,8.671,7.33,15.726,16.339,15.726a16.247,16.247,0,0,0,15.806-11.733A1.539,1.539,0,0,0,107.8,151.645Zm-14.661-7.656a5.552,5.552,0,1,1-5.764,5.547,5.444,5.444,0,0,1,1.9-4.114c1.083,2.06,1.97,3.8,2.391,4.73a1.607,1.607,0,0,0,1.472.928,1.651,1.651,0,0,0,.639-.129,1.522,1.522,0,0,0,.831-2.031c-.442-.978-1.349-2.755-2.448-4.85A6,6,0,0,1,93.141,143.989Zm-23.023-.176L52.776,133.195a70.055,70.055,0,0,1,9.387-4.282l11.921,7.3A26.5,26.5,0,0,0,70.118,143.813Zm-30.027-18.04,10.38,5.157a28.518,28.518,0,0,0-7.985,6.815L23.252,125.3l5.322-2.053a15.067,15.067,0,0,0,8.378,2.521h3.14Zm-27.884-7.611h7.86a7.371,7.371,0,0,1,5.588,2.519h0q.12.139.245.275l-5.871,2.264Zm-.38,8.932,4.811-2.347,1.91,1.235Zm5.6,23.987h4.448a5.746,5.746,0,0,1-5.535,4,5.552,5.552,0,1,1,0-11.1,5.919,5.919,0,0,1,3.209.943l-3.087,1.141h0a2.609,2.609,0,0,0-1.726,2.418A2.645,2.645,0,0,0,17.427,151.08Zm-1.087,11.1a12.648,12.648,0,1,1,0-25.277,13.262,13.262,0,0,1,10.672,5.275l-4.08,1.508a9.137,9.137,0,0,0-6.592-2.779,8.641,8.641,0,1,0,0,17.27,8.9,8.9,0,0,0,8.828-7.091h4.207A12.987,12.987,0,0,1,16.339,162.175Zm14.736-14.182H20.213l2.777-1.026h0l.809-.3,10.75-3.973h4.965a25.272,25.272,0,0,0-1.651,5.3H31.075Zm9.492,4.854a.048.048,0,0,1-.038-.016.058.058,0,0,1-.018-.047c.377-8.009,3.6-13.584,9.344-17.719l19.431,11.9a27.778,27.778,0,0,0-.6,5.885ZM76.128,133.8l-10.295-6.3c7.945-3.064,15.281-6.031,15.128-14.272a16.917,16.917,0,0,0-1.913-7.062,47.271,47.271,0,0,1,14.97,11.38,1.872,1.872,0,0,1,.424,1.675,1.963,1.963,0,0,1-1.138,1.353,3.569,3.569,0,0,0-1.987,4.506C84.33,127.11,79.484,130.284,76.128,133.8Z" transform="translate(0 0)"/></g></svg>
			</div>
			<div class="semaforo">
				<svg xmlns="http://www.w3.org/2000/svg" width="25.934" height="107" viewBox="0 0 25.934 107"><defs><style>.semaforo_a{fill:#5a5a5a;}.semaforo_b{fill:#444;}.semaforo_c{fill:#68ca44;}.semaforo_d{fill:#fac600;}.semaforo_e{fill:#fb2b3a;}.semaforo_f{fill:#4fc123;}.semaforo_g{fill:#e0ae10;}.semaforo_h{fill:#e41f2d;}.semaforo_i{fill:#acacac;}.semaforo_j{fill:#9c9c9c;}</style></defs><g transform="translate(-194.115)"><path class="a" d="M221.585,57.843H204.44a2.818,2.818,0,0,1-2.822-2.815V10.319A2.818,2.818,0,0,1,204.44,7.5h17.145a2.818,2.818,0,0,1,2.822,2.815V55.028a2.818,2.818,0,0,1-2.822,2.815Z" transform="translate(-5.931 -5.936)"/><path class="b" d="M286.115,10.318V55.028a2.816,2.816,0,0,1-2.822,2.814h-3.61a2.816,2.816,0,0,0,2.822-2.814V10.318A2.818,2.818,0,0,0,279.683,7.5h3.61a2.818,2.818,0,0,1,2.822,2.814Z" transform="translate(-67.639 -5.936)"/><ellipse class="c" cx="5.458" cy="5.444" rx="5.458" ry="5.444" transform="translate(201.624 36.324)"/><ellipse class="d" cx="5.458" cy="5.444" rx="5.458" ry="5.444" transform="translate(201.624 21.294)"/><ellipse class="e" cx="5.458" cy="5.444" rx="5.458" ry="5.444" transform="translate(201.624 6.264)"/><path class="f" d="M245.5,179.8a5.46,5.46,0,0,1-9.686,3.442,5.44,5.44,0,0,0,5.47-8.74A5.44,5.44,0,0,1,245.5,179.8Z" transform="translate(-32.966 -138.035)"/><path class="g" d="M245.5,107.884a5.46,5.46,0,0,1-9.686,3.442,5.44,5.44,0,0,0,5.47-8.74A5.44,5.44,0,0,1,245.5,107.884Z" transform="translate(-32.966 -81.146)"/><path class="h" d="M245.5,35.965a5.46,5.46,0,0,1-9.686,3.442,5.44,5.44,0,0,0,5.47-8.74A5.44,5.44,0,0,1,245.5,35.965Z" transform="translate(-32.966 -24.257)"/><path class="i" d="M241.756,248.376h5.969v45.6h-5.969Z" transform="translate(-37.659 -196.469)"/><path class="j" d="M256,248.376h2.984v45.6H256Z" transform="translate(-48.918 -196.469)"/><path class="a" d="M214.172,466.551h14.869a1.68,1.68,0,0,1,1.682,1.678v6.252H212.49v-6.252A1.68,1.68,0,0,1,214.172,466.551Z" transform="translate(-14.525 -369.049)"/><path d="M215.655,0H198.509a4.394,4.394,0,0,0-4.394,4.383V24.959a1.572,1.572,0,0,0,3.145,0V4.383a1.249,1.249,0,0,1,1.25-1.246h17.145a1.249,1.249,0,0,1,1.25,1.246V49.092a1.249,1.249,0,0,1-1.25,1.246H198.509a1.249,1.249,0,0,1-1.25-1.246V32.182a1.572,1.572,0,0,0-3.145,0v16.91a4.394,4.394,0,0,0,4.394,4.383h4.016V95.934h-2.878a3.254,3.254,0,0,0-3.254,3.246v6.252A1.57,1.57,0,0,0,197.965,107H216.2a1.57,1.57,0,0,0,1.572-1.568V99.18a3.254,3.254,0,0,0-3.254-3.246h-2.878V78.54a1.572,1.572,0,0,0-3.145,0V95.934H205.67V53.475h2.824V71.2a1.572,1.572,0,0,0,3.145,0V53.475h4.016a4.394,4.394,0,0,0,4.394-4.383V4.383A4.394,4.394,0,0,0,215.655,0Zm-1.028,99.18v4.684H199.537V99.18a.11.11,0,0,1,.11-.11h14.869A.11.11,0,0,1,214.626,99.18Z"/><path d="M229.478,36.492a7.012,7.012,0,1,0-7.03-7.012A7.029,7.029,0,0,0,229.478,36.492Zm0-10.888a3.876,3.876,0,1,1-3.886,3.875A3.885,3.885,0,0,1,229.478,25.6Z" transform="translate(-22.396 -17.773)"/><path d="M229.478,108.411a7.012,7.012,0,1,0-7.03-7.012A7.029,7.029,0,0,0,229.478,108.411Zm0-10.888a3.876,3.876,0,1,1-3.886,3.876A3.885,3.885,0,0,1,229.478,97.523Z" transform="translate(-22.396 -74.662)"/><path d="M229.478,180.331a7.012,7.012,0,1,0-7.03-7.012A7.029,7.029,0,0,0,229.478,180.331Zm0-10.888a3.876,3.876,0,1,1-3.886,3.876A3.885,3.885,0,0,1,229.478,169.443Z" transform="translate(-22.396 -131.551)"/></g></svg>
			</div>
		</div>
		<div class="changePassReview">
			<p>¿Estas seguro que deseas cerrar tu sesión ?</p>
			<a href="<?php echo wp_logout_url( home_url().'/my-account/' ); ?>" class="btn">SI</a>
		</div>
	</div>
</div>
<?php do_action( 'woocommerce_after_account_navigation' ); ?>
<script type="text/javascript">
	jQuery('header').addClass('header-notactive');
	var urlajax = '<?php echo site_url(); ?>/wp-admin/admin-ajax.php';
</script>
