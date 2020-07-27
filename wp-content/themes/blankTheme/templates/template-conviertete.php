<?php /* Template Name: conviertete */
set_query_var('ENTRY', 'conviertete');
get_header();
?>
<section class="anuncia">
	<div class="contenedor">
		<div class="columnas">
			<div class="columna_izq">
				<img src="<?php echo get_field('back_image') ?>" alt="">
			</div>	
			<div class="columna_der">
				<h1><?php echo get_field('titulo_anuncia') ?></h1>
				<h2><?php echo get_field('subtitulo_anuncia') ?></h2>
				<p><?php echo get_field('parrafo_socio') ?></p>
				<p><?php echo get_field('parrafo') ?></p>
				<div class="contacto_empresa back_contactos">
					<?php echo do_shortcode('[contact-form-7 id="416" title="Envio de Solicitud (Empresas)"]'); ?>
				</div>
				
			</div>

		</div>
	</div>
</section>
<?php get_footer();

