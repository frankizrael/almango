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
					<a href="<?php the_field('descargar_ficha'); ?>" download>
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
<section class="banner" style="background-image: url(<?php echo get_field('imagen_parallax'); ?>);">	
</section>
<section class="presures_b">
	<div class="left_title">
		<h2 data="Ventajas">Ventajas</h2>
	</div>
	<div class="center_imagen">		
		<?php
			$ventajas = get_field('ventajas');
			if ($ventajas) {
				$a=0;
				foreach ($ventajas as $ve) {
			?>
			<div style="display: none;" class="ventaja_img" id="ventaja_imagen_<?php echo $a;?>">
				<?php
					if ($ve['video']) {
				?>
				<video autoplay muted loop id="myVideo">
				  <source src="<?php echo $ve['video']; ?>" type="video/mp4">
				</video>
				<?php
					} else {
				?>				
				<img src="<?php echo $ve['imagen']; ?>">
				<?php
					}
				?>
			</div>
			<?php
				$a++;
				}
			}
		?>
	</div>
	<div class="right_imagen">	
		<div class="content_lead">
			<div class="content_lead__title">
			<?php
				if ($ventajas) {
					$a=0;
					foreach ($ventajas as $ve) {
				?>
				<div class="content_lead__title__item" id="ventaja_title_<?php echo $a; ?>">
					<p class="up"><?php echo $ve['uptitle']; ?></p>
					<h3><?php echo $ve['title']; ?></h3>
					<p class="sub"><?php echo $ve['subtitle']; ?></p>
				</div>
				<?php
					$a++;
					}
				}
			?>
			</div>
			<div class="content_lead__tab">
				<ul>
					<?php
						if ($ventajas) {
							$a=0;
							foreach ($ventajas as $ve) {
						?>
						<li data-num="<?php echo $a; ?>" data-imagen="#ventaja_imagen_<?php echo $a; ?>">
							<img src="<?php echo $ve['icon']; ?>">
						</li>
						<?php
							$a++;
							}
						}
					?>
				</ul>
			</div>
			<div class="content_lead__content">
				<?php
					if ($ventajas) {
						$a=0;
						foreach ($ventajas as $ve) {
					?>
					<div id="ventaja_content_<?php echo $a; ?>" class="content_lead__content__item">
						<div class="content">
							<?php echo $ve['content']; ?>
						</div>
					</div>
					<?php
						$a++;
						}
					}
				?>
			</div>
		</div>
	</div>
</section>
<section class="colores_s">
	<div class="x-container x-abs">
		<h2 data="Colores">Colores</h2>
	</div>
	<div class="colores_full">
		<div class="colores_content">
			<?php
				$colores = get_field('colores');
				if ($colores) {
					$a=0;
					foreach ($colores as $ce) {
				?>
				<div style="display: none;" class="colores_item" id="colors_img_<?php echo $a;?>">
					<span style="background:<?php echo $ce['background']; ?>"></span>
					<?php
						if ($ce['360_image']) {
					?>
					<div class="file_360" data="<?php echo $ce['360_image']; ?>" id="imagen_360_<?php echo $a;?>"></div>
					<?php
						} else {
					?>				
					<img src="<?php echo $ce['imagen']; ?>">
					<?php
						}
					?>
				</div>
				<?php
					$a++;
					}
				}
			?>
		</div>
		<div class="colores_tag">
			<?php
				$colores = get_field('colores');
				if ($colores) {
					$a=0;
					foreach ($colores as $ce) {
				?>
				<div class="colors_step" data="#colors_img_<?php echo $a;?>">
					<span style="background: <?php echo $ce['color']; ?>"></span>
					<p><?php echo $ce['text']; ?></p>
				</div>
				<?php
					$a++;
					}
				}
			?>
		</div>
	</div>
</section>
<section class="section-snith">
	<div class="section-snith__core">
		<?php
			$parts = get_field('parts');
			if ($parts) {
				$a=0;
				foreach ($parts as $pe) {
			?>
			<div style="display: none;" class="snit_image" id="parts<?php echo $a;?>">
				<?php
					if ($pe['video']) {
				?>
				<video autoplay muted loop id="myVideo">
				  <source src="<?php echo $pe['video']; ?>" type="video/mp4">
				</video>
				<?php
					} else {
				?>				
				<img src="<?php echo $pe['imagen']; ?>">
				<?php
					}
				?>
				<div class="text_som">
					<div class="x-container">
						<div class="flex">
							<h3><?php echo $pe['title']; ?></h3>
							<div class="rel">
								<?php echo $pe['list']; ?>
							</div>
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
	<div class="section-snith__tab">
		<ul>
		<?php
			$parts = get_field('parts');
			if ($parts) {
				$a=0;
				foreach ($parts as $pe) {
			?>
			<li data="#parts<?php echo $a;?>" class="part_js">
				<img src="<?php echo $pe['icon']; ?>">
			</li>
			<?php
				$a++;
				}
			}
		?>
		</ul>
	</div>
</section>
<section class="banner" style="background-image: url(<?php echo get_field('imagen_parallax_2'); ?>);">	
</section>
<section class="section-snith">
	<div class="section-snith__core">
		<?php
			$parts = get_field('trans');
			if ($parts) {
				$a=0;
				foreach ($parts as $pe) {
			?>
			<div style="display: none;" class="trans_image" id="trans<?php echo $a;?>">
				<?php
					if ($pe['video']) {
				?>
				<video autoplay muted loop id="myVideo">
				  <source src="<?php echo $pe['video']; ?>" type="video/mp4">
				</video>
				<?php
					} else {
				?>				
				<img src="<?php echo $pe['imagen']; ?>">
				<?php
					}
				?>
				<div class="text_som">
					<div class="x-container">
						<div class="flex flex-bot">
							<h3><?php echo $pe['title']; ?></h3>
							<div class="descapit">
								<div class="tt">
									<?php echo $pe['subtitle']; ?>
								</div>
								<div class="bb">
									<?php
										$list = $pe['list'];
										if ($list) {
											foreach ($list as $li) {
									?>
									<div class="bb__item">
										<h5><?php echo $li['title']; ?></h5>
										<div class="desc">
											<span class="number"><?php echo $li['number']; ?></span>
											<?php if ($li['atrib'] ){ ?>
											<span class="atrib"><?php echo $li['atrib']; ?></span>
										<?php } ?>
										</div>
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
			<?php
				$a++;
				}
			}
		?>
	</div>
	<div class="section-snith__tab">
		<ul>
		<?php
			$parts = get_field('trans');
			if ($parts) {
				$a=0;
				foreach ($parts as $pe) {
			?>
			<li data="#trans<?php echo $a;?>" class="trans_js">
				<img src="<?php echo $pe['icon']; ?>">
			</li>
			<?php
				$a++;
				}
			}
		?>
		</ul>
	</div>
</section>
<section class="dim-presta">
	<div class="x-container">
		<div class="self-title">
			<h2><?php the_field('title_dimensiones'); ?></h2>
		</div>
		<div class="flex motos_may_img">
			<div class="flex__table">
				<div class="flex_content">
					<div class="flex">
						<div class="flex__table">
							<div class="box box__1">
								<h5>
									<span class="number"><?php the_field('number_box_1'); ?></span>
									<span class="text"><?php the_field('text_box_1'); ?></span>
								</h5>
								<p><?php the_field('desc_box_1'); ?></p>
							</div>
						</div>
						<div class="flex__table ">
							<div class="imagen_moto">
								<img src="<?php the_field('imagen_moto_left'); ?>">
							</div>
							<div class="box box__2">
								<h5>
									<span class="number"><?php the_field('number_box_2'); ?></span>
									<span class="text"><?php the_field('text_box_2'); ?></span>
								</h5>
								<p><?php the_field('desc_box_2'); ?></p>
							</div>
							<div class="box box__3">
								<h5>
									<span class="number"><?php the_field('number_box_3'); ?></span>
									<span class="text"><?php the_field('text_box_3'); ?></span>
								</h5>
								<p><?php the_field('desc_box_3'); ?></p>
							</div>
						</div>
						<div class="flex__table">
							<div class="box box__4">
								<h5>
									<span class="number"><?php the_field('number_box_4'); ?></span>
									<span class="text"><?php the_field('text_box_4'); ?></span>
								</h5>
								<p><?php the_field('desc_box_4'); ?></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="flex__table flex__a">
				<div class="flex_content">
					<div class="flex">
						<div class="flex__table">
							<div class="box box__5">
								<h5>
									<span class="number"><?php the_field('number_box_5'); ?></span>
									<span class="text"><?php the_field('text_box_5'); ?></span>
								</h5>
								<p><?php the_field('desc_box_5'); ?></p>
							</div>
						</div>
						<div class="flex__table">
							<div class="imagen_moto">
								<img src="<?php the_field('imagen_moto_center'); ?>">
							</div>
							<div class="box box__6">
								<h5>
									<span class="number"><?php the_field('number_box_6'); ?></span>
									<span class="text"><?php the_field('text_box_6'); ?></span>
								</h5>
								<p><?php the_field('desc_box_6'); ?></p>
							</div>
						</div>
						<div class="flex__table">
							<div class="box box__7">
								<h5>
									<span class="number"><?php the_field('number_box_7'); ?></span>
									<span class="text"><?php the_field('text_box_7'); ?></span>
								</h5>
								<p><?php the_field('desc_box_7'); ?></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="flex__table">
				<div class="flex_content">
					<div class="positionmanejo">
						<img src="<?php the_field('position_moto'); ?>">
						<h3><?php the_field('position_moto_title'); ?></h3>
						<p><?php the_field('position_moto_desc'); ?></p>
					</div>
				</div>
			</div>
		</div>
		<div class="refiend">
			<div class="flex justify-content-between">
				<div class="item_f flex">
					<p class="init-s"><?php the_field('atrib_text_1'); ?></p>
					<p class="numb-s"><?php the_field('atrib_number_1'); ?></p>
					<p class="img-s"><img src="<?php the_field('atrib_imagen_1'); ?>"></p>
				</div>
				<div class="item_f flex">
					<p class="init-s"><?php the_field('atrib_text_2'); ?></p>
					<p class="numb-s"><?php the_field('atrib_number_2'); ?></p>
					<p class="img-s"><img src="<?php the_field('atrib_imagen_2'); ?>"></p>
				</div>
				<div class="item_f flex">
					<p class="init-s"><?php the_field('atrib_text_3'); ?></p>
					<p class="numb-s"><?php the_field('atrib_number_3'); ?></p>
					<p class="img-s"><img src="<?php the_field('atrib_imagen_3'); ?>"></p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="section-snith">
	<div class="section-snith__core">
		<?php
			$fren = get_field('fren');
			if ($fren) {
				$a=0;
				foreach ($fren as $fre) {
			?>
			<div style="display: none;" class="fren_image" id="fren<?php echo $a;?>">
				<?php
					if ($fre['video']) {
				?>
				<video autoplay muted loop id="myVideo">
				  <source src="<?php echo $fre['video']; ?>" type="video/mp4">
				</video>
				<?php
					} else {
				?>				
				<img src="<?php echo $fre['imagen']; ?>">
				<?php
					}
				?>
				<div class="text_som">
					<div class="x-container">
						<div class="flex flex-bot">
							<h3><?php echo $fre['title']; ?></h3>
							<div class="frens">
								<div class="bb">
									<?php
										$list = $fre['list'];
										if ($list) {
											foreach ($list as $li) {
									?>
									<div class="bb__item addPowe">
										<h5><?php echo $li['title']; ?></h5>
										<div class="desc">
											<span class="number"><?php echo $li['number']; ?></span>
											<?php if ($li['atrib'] ){ ?>
											<span class="atrib"><?php echo $li['atrib']; ?></span>
											<?php } ?>
										</div>
										<div class="p">
											<?php echo $li['text']; ?>
										</div>
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
			<?php
				$a++;
				}
			}
		?>
	</div>
	<div class="section-snith__tab">
		<ul>
		<?php
			$fren = get_field('fren');
			if ($fren) {
				$a=0;
				foreach ($fren as $fe) {
			?>
			<li data="#fren<?php echo $a;?>" class="fren_js">
				<img src="<?php echo $fe['icon']; ?>">
			</li>
			<?php
				$a++;
				}
			}
		?>
		</ul>
	</div>
</section>
<section class="descargar_ficha">
	<div class="maxdescargas">
		<a href="<?php the_field('descargar_ficha'); ?>" download>
			<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/pdf.png">
		</a>
		<p>DESCARGA TU FICHA TÉCNICA DETALLADA</p>
	</div>
</section>
<section class="banner" style="background-image: url(<?php echo get_field('imagen_parallax_3'); ?>);">	
</section>
<section class="mirame">
	<div class="x-container">
		<div class="mirame-title">
			<h2><?php the_field('mirame_title'); ?></h2>
			<p><?php the_field('mirame_subtitle'); ?></p>
		</div>		
	</div>
	<div class="allgrid">
		<?php the_field('grid_shortcode');?>
	</div>
</section>
<?php get_footer( 'shop' );