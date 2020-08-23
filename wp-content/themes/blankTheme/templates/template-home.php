<?php /* Template Name: home */
set_query_var('ENTRY', 'home');
get_header();
?>
<section class="init fullheight">
	<?php
		$videohome = get_field('init_video');
		if ($videohome) {
			?>
			<video autoplay muted preload="metadata" loop id="myVideo" src="<?php the_field('init_video'); ?>" ></video>	
			<?php
		} else {
			?>
			<img src="<?php the_field('init_img'); ?>" id="jsAnim-init-imagen">
			<?php
		}
	?>	
	<div class="ff-container fullheight posRelative flex align-items-center ">
		<div class="init-title">
			<div class="initTitle">				
				<?php 
					$list = get_field('init-title-list');
					if ($list) {
						foreach ($list as $ls) {
							?>
								<div class="content_text">
									<div class="top"><?php echo $ls['text']; ?></div>
									<div class="botto"><?php echo $ls['text_bottom']; ?></div>
								</div>
							<?php		
						}
					}
				?>
			</div>
			<h1><?php the_field('init-subtitle'); ?></h1>
		</div>
		<div class="posAbsolute initButtons">
			<a href="<?php the_field('init-first-botton-link'); ?>" class="btn btn--morado"><?php the_field('init-first-botton-text'); ?></a>
			<a href="<?php the_field('init-second-botton-link'); ?>" class="btn btn--naranja"><?php the_field('init-second-botton-text'); ?></a>
		</div>
	</div>
</section>
<section class="banner fullheight_min">
	<div class="swiper-container fullheight_min">
		<div class="swiper-wrapper">
			<?php
				$banner = get_field('banner');
					if ($banner){
					$a = 1;
						foreach($banner as $ban) {
			?>
				<div class="swiper-slide" data="0<?php echo $a; ?>">
					<div class="fullheight_min initCore" style="background-image: url('<?php echo $ban['img']; ?>');">
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
		<div class="seeMore posAbsolute">
			<a href="#estilos" class="linkSlow">Ver más</a>
		</div>		
	</div>
</section>
<section id="estilos" class="sectionpadd">
	<div class="x-container">
		<div class="title rockTitleAnimation">
			<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/rock.png">
			<h2><?php the_field('title_estilos'); ?></h2>
		</div>
		<div class="style_motos posRelative">
			<div class="swiper-container ">
				<div class="swiper-wrapper swiper-button-ss">
					<?php
		                $taxonomyName = "product_cat"; 
		                $parent_terms = get_terms( $taxonomyName, array( 'parent' => 15, 'orderby' => 'slug', 'hide_empty' => false ) );
		                $a = 0;
		                foreach ( $parent_terms as $pterm ) {
		                    $thumbnail_id = wp_get_attachment_url(get_term_meta( $pterm->term_id, 'thumbnail_id', true ));
		                    ?>  
		                    <div class="swiper-slide">                          
			                    <div class="style_motos__moto" style="transition-delay: 0.<?php echo $a; ?>s;">
			                        <a href="<?php echo get_term_link($pterm); ?>">
			                            <img src="<?php echo $thumbnail_id; ?>">
			                            <p><?php echo $pterm->name; ?></p>
			                        </a>    
			                    </div>                            
		                    </div>   
		                    <?php
		                    $a++;
		                }
		            ?>
            	</div>
			</div>
		</div>
	</div>
</section>
<section class="section" id="bannner">
	<div class="x-container">
		<div class="section-a posRelative">
			<div class="swiper-container ">
				<div class="swiper-wrapper">
					<?php
						$banner_publicitario = get_field('banner_publicitario');
							if ($banner_publicitario){
								foreach($banner_publicitario as $ban) {
					?>
						<div class="swiper-slide">
							<img src="<?php echo $ban['img']; ?>">
						</div>
					<?php
							}
						}
					?>
				</div>	
			</div>
			<div class="swiper-button-prev"></div>
	    	<div class="swiper-button-next"></div>	
		</div>
	</div>
</section>
<section id="marcas" class="sectionpadd">
	<div class="x-container">
		<div class="title rockTitleAnimation">
			<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/rock.png">
			<h2><?php the_field('title_marcas'); ?></h2>
		</div>
		<div class="marcas_list posRelative">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<?php
		                $taxonomyName = "product_cat"; 
		                $parent_terms = get_terms( $taxonomyName, array( 'parent' => 67, 'orderby' => 'slug', 'hide_empty' => false ) );
		                $a = 0;
		                foreach ( $parent_terms as $pterm ) {
		                    $thumbnail_id = wp_get_attachment_url(get_term_meta( $pterm->term_id, 'thumbnail_id', true ));
		                    ?> 
		                    <div class="swiper-slide">                           
			                    <div class="marcas_list__item" style="transition-delay: 0.<?php echo $a; ?>s;">
			                        <a href="<?php echo get_field('page',$pterm); ?>">
			                            <img src="<?php echo $thumbnail_id; ?>">
			                        </a>    
			                    </div>                            
		                    </div>   
		                    <?php
		                $a++;
		                }
		            ?>
				</div>
	    	</div>
			<div class="swiper-button-prev"></div>
	    	<div class="swiper-button-next"></div>	
		</div>
	</div>
</section>
<section id="destacados">
	<div class="x-container">
		<div class="title fireTitleAnimation">
			<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/fuego.png">
			<h2><?php the_field('title_destacados'); ?></h2>
		</div>
		<div class="my_products_featureds posRelative">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<?php
						$featured = get_field('products_featureds');
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
			<div class="swiper-button-prev"></div>
    		<div class="swiper-button-next"></div>
		</div>
	</div>
</section>
<section class="bannerMoonM">
	<div class="x-container">
		<div class="section-bannerMoon posRelative">
			<div class="swiper-container ">
				<div class="swiper-wrapper">
					<?php
						$banner_moon = get_field('banner_moon');
							if ($banner_moon){
								foreach($banner_moon as $ban) {
					?>
						<div class="swiper-slide">
							<img src="<?php echo $ban['img']; ?>">
						</div>
					<?php
							}
						}
					?>
				</div>	
			</div>
			<div class="swiper-button-prev"></div>
	    	<div class="swiper-button-next"></div>	
		</div>
	</div>
</section>
<section id="dsct" class="descuentos" style="background: transparent linear-gradient(90deg, #27F4CA 0%, #BD90FF 62%, #960FEF 100%) 0% 0% no-repeat padding-box;">
	<div class="decorative_left">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_0.svg" style="transition-delay: 0s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_1.svg" style="transition-delay: 0.2s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_2.svg" style="transition-delay: 0.4s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_3.svg" style="transition-delay: 0.6s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_4.svg" style="transition-delay: 0.8s;">
	</div>
	<div class="x-container">
		<h2><?php the_field('descuentos_title'); ?></h2>
		<p><?php the_field('descuentos_subtitle'); ?></p>
	</div>
	<div class="decorative_right">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount.svg" style="transition-delay: 1s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount-1.svg" style="transition-delay: 1.2s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount-2.svg" style="transition-delay: 1.4s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount-3.svg" style="transition-delay: 1.6s;">
	</div>
</section>
<section class="prometemos" id="prometemos">
	<div class="x-container">
		<div class="simple-title">
			<h2><?php the_field('prometemos_title'); ?></h2>
		</div>
		<div class="promesas_list">
			<?php
				$promesas = get_field('promesas_list');
				if ($promesas) {
				$a = 0;
					foreach ($promesas as $pro) {
						?>
				<div class="promesas_li" style="transition-delay: 0.<?php echo $a;?>s">
					<img src="<?php echo $pro['imagen']; ?>">
					<h3><?php echo $pro['title']; ?></h3>
					<div><?php echo $pro['text']; ?></div>
				</div>
						<?php
				$a = $a + 2;
					}
				}
			?>
		</div>
	</div>
</section>
<section class="aceptamos" id="aceptamos">
	<div class="x-container">
		<div class="simple-title">
			<h2><?php the_field('aceptamos_title'); ?></h2>
		</div>
		<div class="paymenthds">			
			<img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_1.png" style="transition-delay: 0s;">
			<img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_2.png" style="transition-delay: 0.2s;">
			<img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_3.png" style="transition-delay: 0.4s;">
			<img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_4.png" style="transition-delay: 0.6s;">
			<img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_5.png" style="transition-delay: 0.8s;">
		</div>
	</div>
</section>
<?php get_footer();

