<?php /* Template Name: brands */
set_query_var('ENTRY', 'brands');
get_header();
echo $marcaTitle = get_the_title();
?>
<section class="init fullheight" style="background-image: url(<?php echo get_the_post_thumbnail_url(); ?>);">
	<div class="fullheight flex alignBottom posRelative">		
		<div class="content-x">
			<div class="x-container posRelative">
				<div class="title-x">
					<h1 data="<?php echo $marcaTitle; ?>"><?php echo $marcaTitle; ?></h1>
				</div>
				<div class="flex align-items-center justify-content-between">
					<div class="flex__table">
						<div class="content-r">
							<div class="flex align-items-center">
								<div class="imagen">
									<?php
										$thumbnail_id = wp_get_attachment_url(get_term_meta( get_field('marca')[0], 'thumbnail_id', true ));
									?>
									<img src="<?php echo $thumbnail_id; ?>">
								</div>
								<div class="desc">
									<?php the_field('resumen'); ?>
								</div>
							</div> 
						</div>
					</div>
					<div class="flex__table">
						<div class="slide-min">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<?php
						                $images = get_field('imagesswiper'); 
						                if ($images) {
							                foreach ( $images as $img ) {
							                    ?> 
							                    <div class="swiper-slide">                           
								                    <img src="<?php echo $img['img']; ?>">                            
							                    </div>   
							                    <?php
							                }
							            }
						            ?>
								</div>
					    	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="banner fullheight">
	<div class="swiper-container fullheight">
		<div class="swiper-wrapper">
			<?php
				$motos = get_field('motos');
					if ($motos){
					$a = 1;
						foreach($motos as $moto) {
			?>
				<div class="swiper-slide" data="0<?php echo $a; ?>">
					<div class="fullheight initCore" style="background-image: url('<?php echo get_field('imagen_banner',$moto['id']); ?>');">
						<div class="absPost">
							<div class="x-container">
								<a href="<?php echo get_permalink($moto['id']); ?>">
									<h2><?php echo get_the_title($moto['id']); ?></h2>
									<p>Descúbrela<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/flecha-derecha.png"></p>
								</a>
							</div>
						</div>
					</div>
				</div>
			<?php
					$a++;
					}
				}
			?>
		</div>
		<div class="posAbsolute x-container bottom-banner">
			<div class="swiper-pagination"></div>
		</div>	
	</div>
</section>
<section class="banner-lineal" style="background-image: url(<?php echo get_field('banner-lineal'); ?>);">	
</section>
<div class="allModels">
	<div class="x-container">
		<div class="title-center">
			<h2>CONOCE TODOS LOS MODELOS</h2>
		</div>
		<div class="model-loop posRelative">
			<div class="jsModels modelsChange posAbsolute">
				<p>Ver en vista :</p>
				<div class="icons">
					<div class="icons_item jsCarrusel">
						<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/technology.png">
						<p>Carrusel</p>
					</div>
					<div class="icons_item jsLista">
						<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/interface.png">
						<p>Lista</p>
					</div>
				</div>
			</div>
			<div class="backImagen">
				<img src="<?php echo $thumbnail_id; ?>">
			</div>
			<div class="contentModels">
				<div class="swiper-container ">
					<div class="swiper-wrapper">							
						<?php
							$args = array(
							    'posts_per_page'   => -1,
							    'post_type'        => 'product',
							    'tax_query'             => array(
							        array(
							            'taxonomy'      => 'product_cat',
							            'terms'         => 25,
							            'operator' => 'IN'
							        )
							    )
							);
							$products = new WP_Query($args);
							if( $products->have_posts() ) {
								while ($products->have_posts()) : $products->the_post();
									?>
									<div class="swiper-slide">
										<div class="myloopWooProducts">
											<a href="<?php echo get_permalink(); ?>">
												<div class="decorative"><img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/rock.png"> Motos de la marca</div>
												<div class="myMoto">
													<div class="myMoto__img" style="background: transparent radial-gradient(closest-side at 50% 50%, #EDF2EE 0%, #082630 100%) 0% 0% no-repeat padding-box;">										
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
									</div>
									<?php
								endwhile;
							}
							wp_reset_query();
						?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php get_footer();