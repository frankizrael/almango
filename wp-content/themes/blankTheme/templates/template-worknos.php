<?php /* Template Name: worknos */
set_query_var('ENTRY', 'worknos');
get_header();
?>
<section class="trabaja_nosotros">
	<div class="contenedor">
		<div class="columnas">
			<div class="columna_center">
				<h1><?php echo get_field('titulo_worknos') ?></h1>
				<p><?php echo get_field('texto_worknos') ?></p>
			</div>
			<div class="col-izq">
				<div class="img_girl">
					<img src="<?php echo get_field('img_girl') ?>" alt="">
					<img class="arrow_img" src="<?php echo get_field('img_arrow') ?>" alt="">
				</div>
				<div class="img_text">
					<img src="<?php echo get_field('img_text') ?>" alt="">
				</div>
				<div class="img_boy">
					<img src="<?php echo get_field('img_boy') ?>" alt="">
					<img class="arrow_img" src="<?php echo get_field('img_arrow_boy') ?>" alt="">
				</div>
			</div>
			<div class="col-der back_contactos">
				<?php echo do_shortcode('[contact-form-7 id="322" title="Envio de Solicitud"]'); ?>
			</div>
		</div>
	</div>
</section>
<style>

#correo:before {
    position: relative;
    background-image: url('https://digitalcook.info/almango/wp-content/uploads/2020/09/mensaje.png');
    content: '';
    width: 25px;
    height: 25px;
    background-size: contain;
    display: inline-block;
    top: 2px;
    left: 0;
}
.wpcf7 span.wpcf7-form-control-wrap.file-cv:before, .wpcf7-form span.wpcf7-form-control-wrap.file-cv:before{
	width: 107px !important;
}
section.trabaja_nosotros .contenedor .columnas .columna_center h1 {
    font-size: 30px;
    margin-bottom: 32px;
    font-family: 'Raleway';
    font-weight: 700 !important;
}
</style>
<?php get_footer();

