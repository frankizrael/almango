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
<li <?php wc_product_class( '', $product ); ?>>
	<?php
		$marcaTitle = 'Honda'
	?>
	<div class="myloopWooProducts">
		<a href="<?php echo get_permalink(); ?>">
			<div class="decorative"><img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/rock.png"> Motos de la marca</div>
			<div class="myMoto">
				<div class="myMoto__img" style="background: transparent radial-gradient(closest-side at 50% 50%, #F9F1E8 0%, #FF9F32 100%) 0% 0% no-repeat padding-box;">										
					<div class="myMoto__title">
						<h4 data="<?php echo $marcaTitle; ?>"><?php echo $marcaTitle; ?></h4>
					</div>
					<img src="<?php echo get_the_post_thumbnail_url(); ?>">
				</div>
				<div class="myMoto__content">
					<div class="myMoto__tags">
						<?php 
							$tags = get_terms( 'product_tag');
							if ($tags) {
								foreach ($tags as $ta) {
									?>
									<div class="myTag">
										<?php echo $ta->name; ?>
									</div>
									<?php		
								}
							}
						?>
					</div>
					<div class="myMoto__title">
						<h3><?php the_title(); ?></h3>
						<p><?php the_field('modelo'); ?></p>
					</div>
					<div class="myMoto_final">
						<div class="flex align-items-center">
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
							<div class="myMoto__price">
								<?php
									$product = wc_get_product( get_the_ID() );
									echo $product->get_price_html();
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</a>
	</div>
</li>
