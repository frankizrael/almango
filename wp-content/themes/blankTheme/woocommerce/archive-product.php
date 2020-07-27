<?php
set_query_var('ENTRY', 'store');

/**
 * The Template for displaying product archives, including the main shop page which is a post type archive
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/archive-product.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 3.4.0
 */

defined( 'ABSPATH' ) || exit;

get_header( 'shop' );

?>
<section id="core" class="section-core">
	<div class="mycontainer">
		<div class="bredcrumpb">
			<div class="x-container">
				<div class="overBread">
					
				</div>
			</div>
		</div>
		</div>
		<div class="frontCore">
			<div class="x-container">	
				<div class="flex-r">
					<div class="left">
						<aside class="sidebar-no">
							<?php
								get_sidebar('sidebar');
							?>
						</aside>
					</div>
					<div class="right">
						<div class="allproducts">
							<?php
								if ( woocommerce_product_loop() ) {

									/**
									 * Hook: woocommerce_before_shop_loop.
									 *
									 * @hooked woocommerce_output_all_notices - 10
									 * @hooked woocommerce_result_count - 20
									 * @hooked woocommerce_catalog_ordering - 30
									 */
									do_action( 'woocommerce_before_shop_loop' );

									woocommerce_product_loop_start();

									if ( wc_get_loop_prop( 'total' ) ) {
										while ( have_posts() ) {
											the_post();

											/**
											 * Hook: woocommerce_shop_loop.
											 */
											do_action( 'woocommerce_shop_loop' );

											wc_get_template_part( 'content', 'product' );
										}
									}

									woocommerce_product_loop_end();

									/**
									 * Hook: woocommerce_after_shop_loop.
									 *
									 * @hooked woocommerce_pagination - 10
									 */
									do_action( 'woocommerce_after_shop_loop' );
								} else {
									/**
									 * Hook: woocommerce_no_products_found.
									 *
									 * @hooked wc_no_products_found - 10
									 */
									do_action( 'woocommerce_no_products_found' );
								}
								/**
								 * Hook: woocommerce_after_main_content.
								 *
								 * @hooked woocommerce_output_content_wrapper_end - 10 (outputs closing divs for the content)
								 */
								do_action( 'woocommerce_after_main_content' );
							?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
	<?php
        $taxonomyName = "product_cat"; 
        $parent_terms = get_terms( $taxonomyName, array( 'parent' => 15, 'orderby' => 'slug', 'hide_empty' => false ) );
        foreach ( $parent_terms as $pterm ) {
            $thumbnail_id = wp_get_attachment_url(get_term_meta( $pterm->term_id, 'thumbnail_id', true ));
            ?>  
            jQuery('.cat-item-<?php echo $pterm->term_id; ?> a').prepend('<span><img src="<?php echo $thumbnail_id; ?>"></span>');
            <?php
        }
    ?>	
    <?php
        $taxonomyName = "product_cat"; 
        $parent_terms = get_terms( $taxonomyName, array( 'parent' => 24, 'orderby' => 'slug', 'hide_empty' => false ) );
        foreach ( $parent_terms as $pterm ) {
            $thumbnail_id = wp_get_attachment_url(get_term_meta( $pterm->term_id, 'thumbnail_id', true ));
            ?>  
            jQuery('.cat-item-<?php echo $pterm->term_id; ?> a').prepend('<span><img src="<?php echo $thumbnail_id; ?>"></span>');
            <?php
        }
    ?>	

    <?php				
		$pa_posicion = get_terms('pa_posicion');
		if ($pa_posicion) {
			$a = 0;
			foreach ($pa_posicion as $c) {
				$img = get_field('imagen','pa_posicion_'.$c->term_id);				
				?>
				jQuery('#woocommerce_layered_nav-3 li').eq(<?php echo $a;?>).find('a').prepend('<span><img src="<?php echo $img; ?>"></span>');
				<?php		
				$a++;
			}
		}
		?>
    jQuery('.cat-item-15').find('a').eq(0).addClass('titleLink');
    jQuery('.cat-item-24').find('a').eq(0).addClass('titleLink');
</script>



<?php
get_footer( 'shop' );

