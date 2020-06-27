<?php
set_query_var('ENTRY', 'store');
/**
 * The Template for displaying all single products
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/single-product.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see 	    https://docs.woocommerce.com/document/template-structure/
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

get_header( 'shop' ); ?>

<section class="init fullheight" style="background-image: url(<?php echo get_field('imagen_background'); ?>);">
	<div class="fullheight posRelative">		
		<div class="tags_ponted">
			<div class="x-container">
				<div class="tagsC">
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
			</div>
		</div>
		<div class="presents">
			<div class="x-container">
				<div class="presents__content">
				<?php
					$presents = get_field('presents');
					if ($presents) {
						foreach ($presents as $pp) {
					?>
				<div class="item_presnts">
					<img src="<?php echo $pp['imagen']; ?>">
					<p><?php echo $pp['text']; ?></p>
				</div>
					<?php
						}
					}
				?>
				</div>
			</div>
		</div>
		<div class="barent">
			<?php
				$cat = get_terms( 'product_cat');
				if ($tags) {
					foreach ($tags as $ta) {
						?>
						<div class="imagen_cat">
							<?php 
								$thumbnail_id = wp_get_attachment_url(get_term_meta( 25, 'thumbnail_id', true ));						
							?>
							<img src="<?php echo $thumbnail_id; ?>">
						</div>
						<?php
						}
					}
				?>
				<div class="title_barent">
					<h1><?php the_title(); ?></h1>
					<p><?php the_field('modelo'); ?></p>
				</div>
				<div class="functss">
					<a href="javascript:void(0)">
						<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/compare.png">
						<p>Compara</p>
					</a>
					<a href="javascript:void(0)">
						<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/heart.png">
						<p>Me gusta</p>
					</a>
					<a href="javascript:void(0)">
						<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/pdf.png">
						<p>Descargas</p>
					</a>
				</div>
				<div class="resumen_s">
					<?php the_field('resumen'); ?>
				</div>
				<div class="prices">
					<div class="prices_html">
						<?php
                			$_my_product = wc_get_product( get_the_ID() );
                			echo $_my_product->get_price_html(); 
                		?>
					</div>
					<p>TIPO DE CAMBIO DEL DÍA S/. 3.41</p>
				</div>
				<div class="buttonAdd">
					<?php
						$id = get_the_ID();						
						echo do_shortcode("[ajax_add_to_cart id='$id' text='Comprar']");
					?>
				</div>
		</div>
	</div>
</section>


<?php get_footer( 'shop' );

/* Omit closing PHP tag at the end of PHP files to avoid "headers already sent" issues. */
