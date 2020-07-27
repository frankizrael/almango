<?php /* Template Name: anuncia */
set_query_var('ENTRY', 'anuncia');
get_header();
?>
<section class="anuncia">
	<div class="contenedor">
		<div class="columnas">
			<div class="columna_center">
				<h1><?php echo get_field('titulo_anuncia') ?></h1>
				<p><?php echo get_field('texto_anuncia') ?></p>
				<h2><?php echo get_field('pregunta') ?></h2>
				<p class="text_left"><?php echo get_field('respuesta') ?></p>
			</div>
			
		</div>
		<div class="columnas_grid">
			<div class="column1">
				<img src="<?php echo get_field('img_top') ?>" alt="">
				<img src="<?php echo get_field('img_bot') ?>" alt="">
			</div>
			<div class="column2">
				<div class="item1">
					<img src="<?php echo get_field('img_lupa') ?>" alt="">
					<p><?php echo get_field('texto_lupa') ?></p>
				</div>
				<div class="item2">
					<img src="<?php echo get_field('img_estadistica') ?>" alt="">
					<p><?php echo get_field('texto_estadistica') ?></p>
					<div class="text-colores">
						<p class="morado"><?php echo get_field('text_morado') ?></p>
						<p class="orange"><?php echo get_field('text_orange') ?></p>
						<p><?php echo get_field('text_estadistica2') ?></p>
					</div>
				</div>
				<div class="item3">
					<img src="<?php echo get_field('img_manos') ?>" alt="">
					<p><?php echo get_field('texto_manos') ?></p>
				</div>
			</div>
			<div class="column3">
				<img src="<?php echo get_field('img_alturamax') ?>" alt="">
			</div>
			<div class="column4">
				<img src="<?php echo get_field('img_flex1') ?>" alt="" class="galeria">
				<img src="<?php echo get_field('img_flex2') ?>" alt="" class="galeria">
				<img src="<?php echo get_field('img_flex3') ?>" alt="" class="galeria">
			</div>
		</div>
		<div class="form_empresa back_contactos">
			
			<?php echo do_shortcode('[contact-form-7 id="416" title="Envio de Solicitud (Empresas)"]'); ?>
		</div>
	</div>
</section>
<?php get_footer();

