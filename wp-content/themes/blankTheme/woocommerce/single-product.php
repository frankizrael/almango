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
$myid = get_the_ID();
get_header( 'shop' ); ?>
<section class="init fullheight" style="background-image: url(<?php echo get_field('imagen_background'); ?>);">
	<div class="fullheight posRelative">		
		<div class="tags_ponted">
			<div class="x-container">
				<div class="tagsC">
					<div class="myTag">
						<a href="<?php echo site_url(); ?>/shop">
							#Tienda
						</a>
					</div>
					<?php
						$cat = get_the_terms($myid,'product_cat', array( 'order' => 'DESC'));
						if ($cat) {				
							foreach ($cat as $ta) {		
								if ($ta->term_id != 15 && $ta->term_id != 67){						
							?>
							<div class="myTag">
								<a href="<?php echo get_category_link($ta->term_id); ?>" data-id="<?php echo $ta->term_id; ?>">
									#<?php echo $ta->name; ?>
								</a>
							</div>
							<?php
									}
								}
							}
						?>		
					<?php 
						$tags = get_the_terms($myid,'product_tag');
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
			</div>
		</div>
		<div class="presents">
			<div class="x-container">
				<div class="presents__content">
				<?php
					$presents = get_field('presents',$myid);
					$transition = 0;
					if ($presents) {
						foreach ($presents as $pp) {
					?>
				<div class="item_presnts" style="transition-delay: 0.<?php echo $transition; ?>s; ">
					<img src="<?php echo $pp['imagen']; ?>">
					<p><?php echo $pp['text']; ?></p>
				</div>
					<?php
					$transition = $transition + 2;
						}
					}
				?>
				</div>
			</div>
		</div>
		<div class="barent">
				<?php
				$cat = get_the_terms($myid,'product_cat', array( 'order' => 'DESC'));
				if ($cat) {				
					foreach ($cat as $ta) {								
						$idmarca = $ta->term_id;
						$thumbnail_id = wp_get_attachment_url(get_term_meta( $idmarca, 'thumbnail_id', true ));	
						if ($thumbnail_id) {
							if ($ta->parent == 67) {										
							?>
							<div class="imagen_cat">
								<img src="<?php echo $thumbnail_id; ?>">
							</div>
							<?php
							}						
						}
					}
				}
				?>
				<div class="title_barent">
					<h1><?php echo get_the_title($myid); ?></h1>
					<p><?php the_field('modelo',$myid); ?></p>
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
							if (get_field('descuento', get_the_ID() )) {
						?>
						<div class="desct">
							<span><?php the_field('descuento', get_the_ID() ); ?></span> DSCTO
						</div>
						<?php
							}
						?>
                		<div class="prices_html__price">
							<?php
								$product = wc_get_product( get_the_ID() );
								echo $product->get_price_html();
							?>
						</div>
						<div class="prices_html__mPrice">
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
					</div>
					<div class="buttonAdd">
						<?php
							$id = get_the_ID();						
							echo do_shortcode("[ajax_add_to_cart id='$id' text='Comprar']");
						?>
					</div>
					<p>TIPO DE CAMBIO DEL DÍA S/. <?php echo get_field('tipo_cambio','options'); ?></p>
				</div>
		</div>
	</div>
	<?php
		if(get_field('video_init')){
			?>
	<video autoplay muted loop id="myVideoInit">
	  <source src="<?php the_field('video_init'); ?>" type="video/mp4">
	</video>
			<?php
		}
	?>
</section>
<div class="header_fixed" id="header_2">
	<div class="x-container">
		<div class="flex-head flex">
			<div class="title-fl">
				<p class="title-principal"><?php the_title(); ?></h1>
				<p class="title-model"><?php the_field('modelo'); ?></p>
			</div>
			<div class="content-fl">
				<div class="flex inde-flex">
					<div class="inde-center">
						<?php
							$product = wc_get_product( get_the_ID() );
							echo $product->get_price_html();
						?>
					</div>
					<div class="inde-right">
						<div class="butt">
							<?php
								$id = get_the_ID();						
								echo do_shortcode("[ajax_add_to_cart id='$id' text='Comprar']");
							?>	
						</div>
						<p>TIPO DE CAMBIO DEL DÍA S/. <?php echo get_field('tipo_cambio','options'); ?></p>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<section id="singlebanner" class="banner" style="background-image: url(<?php echo get_field('imagen_parallax'); ?>);">	
	<?php
		if(get_field('video_inicial')){
			?>
		<video autoplay muted loop id="video_inicial">
		  <source src="<?php echo get_field('video_inicial'); ?>" type="video/mp4">
		</video>
			<?php
		}
	?>
</section>
<section class="presures_b" id="presures">
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
			<div class="ventaja_img" id="ventaja_imagen_<?php echo $a;?>">
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
			<div class="colores_back">
				<?php
					$colores = get_field('colores');
					if ($colores) {
						$a=0;
						foreach ($colores as $ce) {
					?>
					<span style="background:<?php echo $ce['background']; ?>" id="span_<?php echo $a; ?>"></span>
				<?php
						$a++;
						}
					}
				?>
			</div>
			<?php
				$colores = get_field('colores');
				if ($colores) {
					$a=0;
					foreach ($colores as $ce) {
				?>
				<div style="display: none;" class="colores_item" id="colors_img_<?php echo $a;?>">
					<div class="colores_desc_item">
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
				<div class="colors_step" data="#colors_img_<?php echo $a;?>" data-span="<?php echo $a;?>">
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
<section class="section-snith" id="first_tab">
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
				<img src="<?php echo $pe['imagen']; ?>" class="img_core">
				<?php
					}
				?>
				<div class="text_som">
					<div class="x-container">
						<div class="flex">
							<h3><?php echo $pe['title']; ?></h3>
							<div class="rel">
								<?php 
									foreach ($pe['list'] as $li) {
										?>
								<div class="rel_li <?php echo $li['estilo'];?>">
									<h4><?php echo $li['title']; ?></h4>
									<div class="real_h4">
										<p class="<?php if($li['efect_number']) { echo 'effectnumber'; } ?>" data="<?php echo $li['content']; ?>"><?php echo $li['content']; ?></p>
										<span><?php echo $li['atrib_content']; ?></span>
									</div>
								</div>
										<?php
									}
								?>
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
	<?php
		if(get_field('video_inicial_2')){
			?>
		<video autoplay muted loop id="video_inicial_2">
		  <source src="<?php echo get_field('video_inicial_2'); ?>" type="video/mp4">
		</video>
			<?php
		}
	?>
</section>
<section class="section-snith" id="second_tab">
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
									<div class="bb__item <?php if($li['title_sup']){ echo 'title_sup'; } ?>">
										<h5><?php echo $li['title']; ?></h5>
										<div class="desc">
											<span class="number <?php if($li['efect_number']) { echo 'effectnumber'; } ?>" data="<?php echo $li['number']; ?>"><?php echo $li['number']; ?></span>
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
<section class="dim-presta" id="dimensiones">
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
								<div class="svg_flex">
									<div class="svg_a">
										<h5>
											<span class="number"><?php the_field('number_box_1'); ?></span>
											<span class="text"><?php the_field('text_box_1'); ?></span>
										</h5>
										<p><?php the_field('desc_box_1'); ?></p>
									</div>
									<div class="svg_b">
										<svg id="Grupo_679" data-name="Grupo 679" xmlns="http://www.w3.org/2000/svg" width="62" height="167" viewBox="0 0 62 167">
											  <line id="Línea_39" data-name="Línea 39" y2="167" transform="translate(24)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_44" data-name="Línea 44" x1="39" transform="translate(23 1)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_45" data-name="Línea 45" x1="39" transform="translate(23 166)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_46" data-name="Línea 46" x1="39" transform="translate(0 29)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_47" data-name="Línea 47" x1="39" transform="translate(1 149)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_48" data-name="Línea 48" x1="39" transform="translate(1 77)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_49" data-name="Línea 49" x1="39" transform="translate(1 101)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_50" data-name="Línea 50" x1="39" transform="translate(1 125)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_51" data-name="Línea 51" x1="39" transform="translate(1 53)" fill="none" stroke="#001a23" stroke-width="3"/>
											  <line id="Línea_52" data-name="Línea 52" x1="22" transform="translate(13 159)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_53" data-name="Línea 53" x1="22" transform="translate(12 141)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_55" data-name="Línea 55" x1="22" transform="translate(12 134)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_56" data-name="Línea 56" x1="22" transform="translate(12 118)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_57" data-name="Línea 57" x1="22" transform="translate(12 110)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_58" data-name="Línea 58" x1="22" transform="translate(12 93)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_59" data-name="Línea 59" x1="22" transform="translate(12 86)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_60" data-name="Línea 60" x1="22" transform="translate(12 69)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_61" data-name="Línea 61" x1="22" transform="translate(12 61)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_62" data-name="Línea 62" x1="22" transform="translate(12 45)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_63" data-name="Línea 63" x1="22" transform="translate(12 37)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_64" data-name="Línea 64" x1="22" transform="translate(13 21)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_65" data-name="Línea 65" x1="22" transform="translate(13 13)" fill="none" stroke="#001a23" stroke-width="2"/>
											  <line id="Línea_54" data-name="Línea 54" x1="22" transform="translate(13 159)" fill="none" stroke="#001a23" stroke-width="2"/>
										</svg>
									</div>
								</div>
							</div>
						</div>
						<div class="flex__table ">
							<div class="imagen_moto">
								<img src="<?php the_field('imagen_moto_left'); ?>">
							</div>
							<div class="box box__2">
								<div class="svg_flex">
									<div class="svg_b">
										<svg xmlns="http://www.w3.org/2000/svg" width="253" height="61" viewBox="0 0 253 61">
											  <g id="Grupo_698" data-name="Grupo 698" transform="translate(-0.307 62) rotate(-90)">
											    <line id="Línea_39" data-name="Línea 39" y2="253" transform="translate(24 0.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_44" data-name="Línea 44" x1="39" transform="translate(23 1.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_45" data-name="Línea 45" x1="39" transform="translate(23 252.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_237" data-name="Línea 237" x1="39" transform="translate(1 221.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_239" data-name="Línea 239" x1="39" transform="translate(1 245.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_234" data-name="Línea 234" x1="39" transform="translate(1 197.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_231" data-name="Línea 231" x1="39" transform="translate(1 173.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_228" data-name="Línea 228" x1="39" transform="translate(1 149.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_48" data-name="Línea 48" x1="39" transform="translate(1 77.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_49" data-name="Línea 49" x1="39" transform="translate(1 101.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_50" data-name="Línea 50" x1="39" transform="translate(1 125.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_51" data-name="Línea 51" x1="39" transform="translate(1 53.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_66" data-name="Línea 66" x1="39" transform="translate(2 29.307)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_53" data-name="Línea 53" x1="22" transform="translate(13 133.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_227" data-name="Línea 227" x1="22" transform="translate(13 141.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_229" data-name="Línea 229" x1="22" transform="translate(13 157.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_230" data-name="Línea 230" x1="22" transform="translate(13 165.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_233" data-name="Línea 233" x1="22" transform="translate(13 189.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_235" data-name="Línea 235" x1="22" transform="translate(13 205.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_236" data-name="Línea 236" x1="22" transform="translate(13 213.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_238" data-name="Línea 238" x1="22" transform="translate(13 229.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_232" data-name="Línea 232" x1="22" transform="translate(13 181.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_56" data-name="Línea 56" x1="22" transform="translate(13 117.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_57" data-name="Línea 57" x1="22" transform="translate(13 109.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_58" data-name="Línea 58" x1="22" transform="translate(13 93.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_59" data-name="Línea 59" x1="22" transform="translate(13 85.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_60" data-name="Línea 60" x1="22" transform="translate(13 69.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_61" data-name="Línea 61" x1="22" transform="translate(13 61.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_62" data-name="Línea 62" x1="22" transform="translate(13 45.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_63" data-name="Línea 63" x1="22" transform="translate(13 37.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_64" data-name="Línea 64" x1="22" transform="translate(13 21.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_65" data-name="Línea 65" x1="22" transform="translate(13 13.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_54" data-name="Línea 54" x1="22" transform="translate(13 237.307)" fill="none" stroke="#001a23" stroke-width="2"/>
											  </g>
										</svg>
									</div>
									<div class="svg_a">
										<h5>
											<span class="number"><?php the_field('number_box_2'); ?></span>
											<span class="text"><?php the_field('text_box_2'); ?></span>
										</h5>
										<p><?php the_field('desc_box_2'); ?></p>										
									</div>
								</div>
							</div>
							<div class="box box__3">
								<div class="svg_flex">
									<div class="svg_b">		
										<svg xmlns="http://www.w3.org/2000/svg" width="371.786" height="117.065" viewBox="0 0 371.786 117.065">
										  <g id="Grupo_700" data-name="Grupo 700" transform="translate(-405.177 -7020)">
										    <g id="Grupo_699" data-name="Grupo 699" transform="translate(419 7140) rotate(-90)">
										      <line id="Línea_39" data-name="Línea 39" y2="370" transform="translate(46.5 -13.016)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_44" data-name="Línea 44" x1="75.484" transform="translate(44.516 -12.823)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_45" data-name="Línea 45" x1="75.484" transform="translate(44.516 356.963)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_46" data-name="Línea 46" x1="75.484" transform="translate(6 85.37)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_245" data-name="Línea 245" x1="75.484" transform="translate(7 41.37)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_242" data-name="Línea 242" x1="75.484" transform="translate(9 2.37)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_47" data-name="Línea 47" x1="75.484" transform="translate(3.935 291.06)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_247" data-name="Línea 247" x1="75.484" transform="translate(2.935 333.06)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_48" data-name="Línea 48" x1="75.484" transform="translate(4.935 157.999)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_49" data-name="Línea 49" x1="75.484" transform="translate(4.935 197.618)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_50" data-name="Línea 50" x1="75.484" transform="translate(4.935 244.236)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_51" data-name="Línea 51" x1="75.484" transform="translate(5.935 124.381)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_52" data-name="Línea 52" x1="42.581" transform="translate(25.161 317.415)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_53" data-name="Línea 53" x1="42.581" transform="translate(25.226 275.576)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_55" data-name="Línea 55" x1="42.581" transform="translate(25.226 260.027)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_56" data-name="Línea 56" x1="42.581" transform="translate(25.226 228.639)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_57" data-name="Línea 57" x1="42.581" transform="translate(25.226 213.1)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_58" data-name="Línea 58" x1="42.581" transform="translate(26.226 182.078)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_59" data-name="Línea 59" x1="42.581" transform="translate(26.226 169.481)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_60" data-name="Línea 60" x1="42.581" transform="translate(26.226 146.46)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_61" data-name="Línea 61" x1="42.581" transform="translate(26.226 135.92)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_62" data-name="Línea 62" x1="42.581" transform="translate(25.226 98.841)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <path id="Trazado_1573" data-name="Trazado 1573" d="M0,0" transform="translate(23.226 72.302)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_64" data-name="Línea 64" x1="42.581" transform="translate(25.161 67.886)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_65" data-name="Línea 65" x1="42.581" transform="translate(25.161 54.403)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_246" data-name="Línea 246" x1="42.581" transform="translate(25.161 112.403)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_244" data-name="Línea 244" x1="42.581" transform="translate(25.161 28.403)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_243" data-name="Línea 243" x1="42.581" transform="translate(25.161 15.403)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_54" data-name="Línea 54" x1="42.581" transform="translate(25.161 303.415)" fill="none" stroke="#001a23" stroke-width="2"/>
										    </g>
										  </g>
										</svg>								
									</div>
									<div class="svg_a">
										<h5>
											<span class="number"><?php the_field('number_box_3'); ?></span>
											<span class="text"><?php the_field('text_box_3'); ?></span>
										</h5>
										<p><?php the_field('desc_box_3'); ?></p>										
									</div>
								</div>
							</div>
						</div>
						<div class="flex__table">
							<div class="box box__4">
								<div class="svg_flex">
									<div class="svg_a">
										<svg xmlns="http://www.w3.org/2000/svg" width="32" height="40.779" viewBox="0 0 32 40.779">
											  <g id="Grupo_701" data-name="Grupo 701" transform="translate(33 40.475) rotate(180)">
											    <path id="Trazado_1570" data-name="Trazado 1570" d="M0,0V40.621" transform="translate(13 -0.146)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_44" data-name="Línea 44" x1="20" transform="translate(13 0.696)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <path id="Trazado_1572" data-name="Trazado 1572" d="M20,0H0" transform="translate(13 38.927)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_48" data-name="Línea 48" x1="20" transform="translate(1 24.696)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_49" data-name="Línea 49" x1="20" transform="translate(1 11.696)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_50" data-name="Línea 50" x1="20" transform="translate(1 30.696)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_51" data-name="Línea 51" x1="20" transform="translate(1 17.696)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_66" data-name="Línea 66" x1="20" transform="translate(2 3.696)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_56" data-name="Línea 56" x1="11" transform="translate(7 34.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_57" data-name="Línea 57" x1="11" transform="translate(7 32.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_58" data-name="Línea 58" x1="11" transform="translate(7 28.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_59" data-name="Línea 59" x1="11" transform="translate(7 26.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_60" data-name="Línea 60" x1="11" transform="translate(7 22.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_61" data-name="Línea 61" x1="11" transform="translate(7 20.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_240" data-name="Línea 240" x1="11" transform="translate(7 15.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_62" data-name="Línea 62" x1="11" transform="translate(7 13.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_65" data-name="Línea 65" x1="12" transform="translate(7 8.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											    <line id="Línea_241" data-name="Línea 241" x1="12" transform="translate(7 6.696)" fill="none" stroke="#001a23" stroke-width="1"/>
											  </g>
										</svg>
									</div>
									<div class="svg_b">
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
				</div>
			</div>
			<div class="flex__table flex__a">
				<div class="flex_content">
					<div class="flex">
						<div class="flex__table">
							<div class="box box__5">
								<div class="svg_flex">
									<div class="svg_a">
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="71" height="71" viewBox="0 0 71 71">
											  <image id="angulo_2_" data-name="angulo (2)" width="71" height="71" xlink:href="data:image/png;base64,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"/>
											</svg>
									</div>
									<div class="svg_b">
										<h5>
											<span class="number"><?php the_field('number_box_5'); ?></span>
											<span class="text"><?php the_field('text_box_5'); ?></span>
										</h5>
										<p><?php the_field('desc_box_5'); ?></p>
									</div>
								</div>
							</div>
						</div>
						<div class="flex__table">
							<div class="imagen_moto">
								<img src="<?php the_field('imagen_moto_center'); ?>">
							</div>
							<div class="box box__6">
								<div class="svg_flex">
									<div class="svg_a">
										<svg xmlns="http://www.w3.org/2000/svg" width="141" height="61" viewBox="0 0 141 61">
											  <g id="Grupo_702" data-name="Grupo 702" transform="translate(0 62) rotate(-90)">
											    <line id="Línea_39" data-name="Línea 39" y2="141" transform="translate(24)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_44" data-name="Línea 44" x1="39" transform="translate(23 1)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_45" data-name="Línea 45" x1="39" transform="translate(23 140)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_47" data-name="Línea 47" x1="39" transform="translate(1 123)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_48" data-name="Línea 48" x1="39" transform="translate(1 65)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_49" data-name="Línea 49" x1="39" transform="translate(1 85)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_50" data-name="Línea 50" x1="39" transform="translate(1 106)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_51" data-name="Línea 51" x1="39" transform="translate(1 45)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_66" data-name="Línea 66" x1="39" transform="translate(2 26)" fill="none" stroke="#001a23" stroke-width="3"/>
											    <line id="Línea_52" data-name="Línea 52" x1="22" transform="translate(13 133)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_53" data-name="Línea 53" x1="22" transform="translate(12 115)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_56" data-name="Línea 56" x1="22" transform="translate(12 100)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_57" data-name="Línea 57" x1="22" transform="translate(12 93)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_58" data-name="Línea 58" x1="22" transform="translate(12 79)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_59" data-name="Línea 59" x1="22" transform="translate(12 73)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_60" data-name="Línea 60" x1="22" transform="translate(12 58)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_61" data-name="Línea 61" x1="22" transform="translate(12 52)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_62" data-name="Línea 62" x1="22" transform="translate(12 38)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_63" data-name="Línea 63" x1="22" transform="translate(12 31)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_64" data-name="Línea 64" x1="22" transform="translate(13 21)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_65" data-name="Línea 65" x1="22" transform="translate(13 13)" fill="none" stroke="#001a23" stroke-width="2"/>
											    <line id="Línea_54" data-name="Línea 54" x1="22" transform="translate(13 133)" fill="none" stroke="#001a23" stroke-width="2"/>
											  </g>
										</svg>
									</div>
									<div class="svg_b">
										<h5>
											<span class="number"><?php the_field('number_box_6'); ?></span>
											<span class="text"><?php the_field('text_box_6'); ?></span>
										</h5>
										<p><?php the_field('desc_box_6'); ?></p>										
									</div>
								</div>
							</div>
						</div>
						<div class="flex__table">
							<div class="box box__7">
								<div class="svg_flex">
									<div class="svg_a">
										<svg xmlns="http://www.w3.org/2000/svg" width="82.607" height="309.094" viewBox="0 0 82.607 309.094">
										  <g id="Grupo_703" data-name="Grupo 703" transform="translate(-7020.931 672.521) rotate(-90)">
										    <g id="Grupo_699" data-name="Grupo 699" transform="translate(419 7103.538) rotate(-90)">
										      <line id="Línea_39" data-name="Línea 39" x1="1" y2="309" transform="translate(30.167 -55.486)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <path id="Trazado_1699" data-name="Trazado 1699" d="M51.359-.388h-52.9" transform="translate(31.248 -53.685)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <path id="Trazado_1698" data-name="Trazado 1698" d="M51.36-.289l-51.928,0" transform="translate(29.248 252.31)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_46" data-name="Línea 46" x1="51.29" transform="translate(0 38.139)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_292" data-name="Línea 292" x1="51.29" transform="translate(0 6.139)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_295" data-name="Línea 295" x1="51.29" transform="translate(0 -26.861)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_47" data-name="Línea 47" x1="51.29" transform="translate(1.315 195.953)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_290" data-name="Línea 290" x1="51.29" transform="translate(1.315 229.953)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_48" data-name="Línea 48" x1="51.29" transform="translate(1.315 101.264)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_49" data-name="Línea 49" x1="51.29" transform="translate(1.315 132.827)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_50" data-name="Línea 50" x1="51.29" transform="translate(1.315 164.39)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_51" data-name="Línea 51" x1="51.29" transform="translate(1.315 69.701)" fill="none" stroke="#001a23" stroke-width="3"/>
										      <line id="Línea_52" data-name="Línea 52" x1="28.933" transform="translate(17.097 209.104)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_53" data-name="Línea 53" x1="28.933" transform="translate(15.781 185.432)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_55" data-name="Línea 55" x1="28.933" transform="translate(15.781 176.226)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_56" data-name="Línea 56" x1="28.933" transform="translate(15.781 155.184)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_57" data-name="Línea 57" x1="28.933" transform="translate(15.781 144.663)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_58" data-name="Línea 58" x1="28.933" transform="translate(15.781 122.306)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_59" data-name="Línea 59" x1="28.933" transform="translate(15.781 113.101)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_60" data-name="Línea 60" x1="28.933" transform="translate(15.781 90.743)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_61" data-name="Línea 61" x1="28.933" transform="translate(15.781 80.222)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_62" data-name="Línea 62" x1="28.933" transform="translate(15.781 59.181)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_63" data-name="Línea 63" x1="28.933" transform="translate(15.781 48.66)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_64" data-name="Línea 64" x1="28.933" transform="translate(17.097 27.618)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_65" data-name="Línea 65" x1="28.933" transform="translate(17.097 17.097)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_293" data-name="Línea 293" x1="28.933" transform="translate(17.097 -4.903)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_294" data-name="Línea 294" x1="28.933" transform="translate(17.097 -15.903)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_296" data-name="Línea 296" x1="28.933" transform="translate(17.097 -37.903)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_54" data-name="Línea 54" x1="28.933" transform="translate(17.097 209.104)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_289" data-name="Línea 289" x1="28.933" transform="translate(17.097 218.104)" fill="none" stroke="#001a23" stroke-width="2"/>
										      <line id="Línea_291" data-name="Línea 291" x1="28.933" transform="translate(17.097 239.104)" fill="none" stroke="#001a23" stroke-width="2"/>
										    </g>
										  </g>
										</svg>
									</div>
									<div class="svg_b">
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
					<p class="numb-s effectnumber" data="<?php the_field('atrib_number_1'); ?>"><?php the_field('atrib_number_1'); ?></p>
					<p class="img-s"><img src="<?php the_field('atrib_imagen_1'); ?>"></p>
				</div>
				<div class="item_f flex">
					<p class="init-s"><?php the_field('atrib_text_2'); ?></p>
					<p class="numb-s effectnumber" data="<?php the_field('atrib_number_2'); ?>"><?php the_field('atrib_number_2'); ?></p>
					<p class="img-s"><img src="<?php the_field('atrib_imagen_2'); ?>"></p>
				</div>
				<div class="item_f flex">
					<p class="init-s"><?php the_field('atrib_text_3'); ?></p>
					<p class="numb-s effectnumber" data="<?php the_field('atrib_number_3'); ?>"><?php the_field('atrib_number_3'); ?></p>
					<p class="img-s"><img src="<?php the_field('atrib_imagen_3'); ?>"></p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="section-snith" id="there_tab">
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
											<span class="number <?php if($li['number_effect']) { echo 'effectnumber'; } ?>" data="<?php echo $li['number']; ?>"><?php echo $li['number']; ?></span>
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
<section class="banner" style="background-image: url(<?php echo get_field('imagen_parallax_3'); ?>);" id="videoBanner">	
	<?php
		if(get_field('banner-video')){
			?>
	<div class="video" id="videoInside">
		<video muted loop id="bannerVideo">
		  <source src="<?php echo get_field('banner-video'); ?>" type="video/mp4">
		</video>
	</div>
	<div id="video_content" class="middle"></div>
			<?php
		}
	?>
</section>
<section class="mirame" id="mirame">
	<div class="x-container">
		<div class="mirame-title">
			<h2><?php the_field('mirame_title'); ?></h2>
			<p><?php the_field('mirame_subtitle'); ?></p>
		</div>		
	</div>
	<div class="allgrid">
		<?php
			$lit = get_field('grid');
			if ($lit){
				foreach ($lit as $li) {
					?>
		<div class="list_grid">
			<img src="<?php echo $li['list']; ?>">
		</div>
					<?php
				}
			}
		?>
	</div>
</section>
<?php get_footer( 'shop' );