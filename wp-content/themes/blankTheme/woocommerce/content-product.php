<?php
/**
 * The template for displaying product content within loops
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/content-product.php.
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

defined( 'ABSPATH' ) || exit;

global $product;

// Ensure visibility.
if ( empty( $product ) || ! $product->is_visible() ) {
	return;
}
?>
<li data="<?php echo $search_product; ?>" class="loop_single_prod">
	<?php
		$myid = get_the_ID();	
		$term_obj_list = get_the_terms( $myid , 'product_cat' );
		$terms_name = array();	
		$listerm;
		$a = 0;
		foreach ($term_obj_list as $tt) {
			array_push($terms_name,$tt->name);			
			if ($a == 0) {
				$listerm = $tt->name;
			} else {
				$listerm = $listerm.', '.$tt->name;
			}
			$a++;
		}
		$marcaTitle = $terms_name[2];	
	?>
	<div class="myloopWooProducts">
		<a href="<?php echo get_permalink(); ?>">
			<?php
				if(is_featured_product($myid) == 0) {					
				$background_side = 'background: transparent radial-gradient(closest-side at 50% 50%, #F9F1E8 0%, #FF9F32 100%) 0% 0% no-repeat padding-box;';
			?>
			<div class="decorative"><img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/rock.png"> Motos de la marca</div>
			<?php
				} else {
				$background_side = 'background: transparent radial-gradient(closest-side at 50% 50%, #4B5AFC 0%, #000000 100%) 0% 0% no-repeat padding-box;';
					?>
			<div class="decorative animationdecoration"><img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/fuego.png"><b>Motos Hot</b></div>
					<?php
				}
			?>
			<div class="myMoto">
				<div class="myMoto__img" style="<?php echo $background_side; ?>">										
					<div class="myMoto__title">
						<h4 data="<?php echo $marcaTitle; ?>"><?php echo $marcaTitle; ?></h4>
					</div>
					<img src="<?php echo get_the_post_thumbnail_url(); ?>">
				</div>
				<div class="myMoto__content">
					<?php
						if (get_field('descuento',$myid)) {
					?>
					<div class="desct">
						<span><?php the_field('descuento',$myid); ?></span> DSCTO
					</div>
					<?php
						}
					?>
					<div class="myMoto__tags">
						<?php 
							$tags = get_terms( 'product_tag');
							if ($tags) {
								foreach ($tags as $ta) {
									?>
									<div class="myTag">
										<a href="<?php echo get_category_link($ta->term_id); ?>">
											<?php echo $ta->name; ?>
										</a>
									</div>
									<?php		
								}
							}
						?>
					</div>
					<div class="myMoto__title">
						<h3><?php echo get_the_title($myid); ?></h3>
						<p><?php the_field('modelo',$myid); ?></p>
					</div>				
					<div class="myMoto_final">
						<div class="myMoto__price">
							<?php
								$product = wc_get_product( get_the_ID() );
								echo $product->get_price_html();
							?>
						</div>
						<div class="myMoto__mPrice">
							<span class="pp">Otro medio de pago</span>
							<span class="bb">
								<?php
									$porcentaje = get_field('porcentaje_conversion','options');
									$price = $product->get_price();
									$price_new = $porcentaje*$price;
									echo get_woocommerce_currency_symbol();
									echo asDollars($price_new);
								?>
							</span>
						</div>
						<div class="myMoto__colors">
							<?php				
								$colors = get_terms( 'pa_color');
								if ($colors) {
									foreach ($colors as $c) {
										?>
										<div class="color">
											<?php $background =  
											get_field('color','pa_color_'.$c->term_id); ?>
											<span style="background: <?php echo $background;?>"></span>
										</div>
										<?php		
									}
								}
							?>
						</div>
					</div>
				</div>
			</div>
		</a>
	</div>
</li>
