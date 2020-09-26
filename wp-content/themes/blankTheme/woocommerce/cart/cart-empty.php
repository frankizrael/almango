<?php
/**
 * Empty cart page
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/cart/cart-empty.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.5.0
 */

defined( 'ABSPATH' ) || exit;

/*
 * @hooked wc_empty_cart_message - 10
 */
do_action( 'woocommerce_cart_is_empty' );
$frontpage_id = get_option( 'page_on_front' );
if ( wc_get_page_id( 'shop' ) > 0 ) : ?>
	<section class="emptyCart">
		<div class="x-container">
			<div class="size-empty">
				<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/shopping-cart.png">
				<h1>¡TU CARRITO DE COMPRAS ESTA VACIO!</h1>
				<p>Tu próxima compañera, a un solo clic</p>
			</div>
		</div>
	</section>
	<section id="destacados">
		<div class="f-container">
			<div class="title titleCenter">
				<h2>LOS MODELOS MÁS TOP</h2>
			</div>
			<div class="my_products_featureds posRelative">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<?php
							$featured = get_field('products_featureds',$frontpage_id);
							if ($featured) {
								foreach ($featured as $fe) {
									?>
								<div class="swiper-slide">  
									<?php
										if ($fe['banner_solid']) {
									?>   
				                    <div class="my_prod heightbanner">
				                    	<a href="<?php echo get_permalink($fe['id']); ?>" class="ident">
					                    	<img src="<?php echo $fe['banner_solid']; ?>">
					                    </a>
				                    </div>    
				                    <?php
				                    	} else {
				                    		?>

				                    <div class="my_prod">
				                    	<a href="<?php echo get_permalink($fe['id']); ?>" class="ident" style="background: <?php echo $fe['background_banner'];?>;">
					                    	<div class="imagen">
						                    	<div class="destacada">
						                    		Destacada
						                    	</div>
					                    		<img src="<?php echo get_the_post_thumbnail_url($fe['id']); ?>">
					                    	</div>
					                    	<div class="text">
					                    		<h3><?php echo get_the_title($fe['id']); ?></h3>
					                    		<p class="brand">
					                    			Susuki
					                    		</p>			                    		
					                    	</div>
					                    	<div class="myprice">
					                    		<?php
					                    			$_my_product = wc_get_product( $fe['id'] );
					                    			echo $_my_product->get_price_html(); 
					                    		?>
					                    	</div>
				                    	</a>
				                    </div>
				                    		<?php
				                    	}
				                    ?>                       
			                    </div> 
									<?php
								}
							}
						?>
					</div>	
		    	</div>	    	
				<div class="swiperHome">
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
	</section>
<?php endif; ?>
