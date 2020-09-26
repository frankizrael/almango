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
		<?php
			$publicity = get_field('publicity','options');
			if ($publicity) {
				?>
			<div class="bredcrumpb">
				<div class="x-container">
					<div class="overBread">
						<a href="<?php echo $publicity; ?>"><?php echo get_field('publicity_text','options'); ?></a>
					</div>
				</div>
			</div>	
				<?php
			}
		?>
	</div>
		<div class="frontCore">
			<div class="x-container">	
				<div class="flex-r">
					<div class="left">
						<aside class="sidebar-no">
							<?php
								get_sidebar('sidebar');
							?>
							<?php
								echo do_shortcode('[searchandfilter id="488"]');
							?>
							<!-- trall and-->
							<div class="colorFilters">
								<h4>COLORES</h4>
								<ul id="colorsN"></ul>
							</div>
						</aside>
					</div>
					<div class="right">
						<div class="allproducts" id="products_all">
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
										$search_product = 0;
										$aux = 0;
										$banners_pub = get_field('banners_publicidad','options');
										while ( have_posts() ) {
											the_post();

											/**
											 * Hook: woocommerce_shop_loop.
											 */
											do_action( 'woocommerce_shop_loop' );

											wc_get_template_part( 'content', 'product' );

											if ($search_product == 15) {
												$aux = 1;
												?>
												<li class="flex-banner-prod" style="background-image: url('<?php echo $banners_pub[0]["img"]; ?>');">													
												</li>
												<?php
											} else {
												if ($search_product > 15) {
													$valor_aux = 4*$aux+15;
													if ($search_product == $valor_aux) {
														?>
														<li class="flex-banner-prod" style="background-image: url('<?php echo $banners_pub[$aux]["img"]; ?>');">
														</li>
														<?php
														$aux++;
													}													
												}
											}

											$search_product++;
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
        $parent_terms = get_terms( $taxonomyName, array( 'parent' => 67, 'orderby' => 'slug', 'hide_empty' => false ) );
        foreach ( $parent_terms as $pterm ) {
            $thumbnail_id = wp_get_attachment_url(get_term_meta( $pterm->term_id, 'thumbnail_id', true ));
            ?>  
            jQuery('.cat-item-<?php echo $pterm->term_id; ?> a').prepend('<span><img src="<?php echo $thumbnail_id; ?>"></span>');
            <?php
        }
    ?>	

    <?php				
		$pa_posicion = get_field('pa_posicion_img','options');
	?>
	let arrayPosition = <?php echo json_encode($pa_posicion); ?>;
	for (let t=0; t<arrayPosition.length; t++){
		let jLabel = jQuery('.sf-field-post-meta-position_moto_desc li');
		for (let i=0;i<jLabel.length;i++){
			if (arrayPosition[t].text == jLabel.eq(i).find('label').text() ) {
				jLabel.eq(i).find('label').prepend('<span><img src="'+arrayPosition[t].img+'"></span>');
			}
		} 		
	}

	<?php				
		$pa_aros = get_field('pa_aros','options');
	?>
	let arrayAros = <?php echo json_encode($pa_aros); ?>;
	for (let t=0; t<arrayAros.length; t++){
		let jLabel = jQuery('.sf-field-post-meta-fren_2_list_2_number li');
		for (let i=0;i<jLabel.length;i++){
			if (arrayAros[t].text == jLabel.eq(i).find('label').text() ) {
				jLabel.eq(i).find('label').prepend('<span><img src="'+arrayAros[t].img+'"></span>');
			}
		} 		
	}

	<?php				
		$pa_alimentacion = get_field('pa_alimentacion','options');
	?>
	let arrayAlimentacion = <?php echo json_encode($pa_alimentacion); ?>;
	for (let t=0; t<arrayAlimentacion.length; t++){
		let jLabel = jQuery('.sf-field-post-meta-pdf_sistema_de_combustible li');
		for (let i=0;i<jLabel.length;i++){
			if (arrayAlimentacion[t].text == jLabel.eq(i).find('label').text() ) {
				jLabel.eq(i).find('label').prepend('<span><img src="'+arrayAlimentacion[t].img+'"></span>');
			}
		} 		
	}
	
	<?php				
		$pa_refrigeracion = get_field('pa_refrigeracion','options');
	?>
	let arrayRefrigeracion = <?php echo json_encode($pa_refrigeracion); ?>;
	for (let t=0; t<arrayRefrigeracion.length; t++){
		let jLabel = jQuery('.sf-field-post-meta-pdf_refrigeracion li');
		for (let i=0;i<jLabel.length;i++){
			if (arrayRefrigeracion[t].text == jLabel.eq(i).find('label').text() ) {
				jLabel.eq(i).find('label').prepend('<span><img src="'+arrayRefrigeracion[t].img+'"></span>');
			}
		} 		
	}


	jQuery('.sf-range-min').closest('label').addClass('inputMin');
	jQuery('.sf-range-max').closest('label').addClass('inputMax');

	jQuery('.cat-item-15').find('a').eq(0).addClass('titleLink');
    jQuery('.cat-item-67').find('a').eq(0).addClass('titleLink');

    //chose fun colors
    let jLi = jQuery('.searchandfilter ul li');
	for (let i=0;i<jLi.length;i++) {
	  let fieldName = jLi.eq(i).attr('data-sf-field-name');
	  if (fieldName != undefined) {
	  	if (fieldName.split('sfm_colores').length > 1) {
		  	jLi.eq(i).addClass('opaaa');
		  	let Linput = jLi.eq(i).find('input');
		  	for (let i=0;i<Linput.length;i++) {	  		
		  		let id = Linput.eq(i).attr('id');
		  		let value = Linput.eq(i).attr('value');
		  		let template = '<li data="#'+id+'"><div style="background:'+value+';"></div></li>';
	    		jQuery('#colorsN').append(template);
		  	}
		  }
	  }
	}

	jQuery('#colorsN li').on('click',function(){
		let id = jQuery(this).attr('data');
		jQuery(id).click();
	});

</script>



<?php
get_footer( 'shop' );

