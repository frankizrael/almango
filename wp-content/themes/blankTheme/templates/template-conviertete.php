<?php /* Template Name: conviertete */
set_query_var('ENTRY', 'conviertete');
get_header();
?>
<section class="anuncia">
	<img class="back_image" src="<?php echo get_field('back_image') ?>" alt="">
	<div class="x-container">

		<div class="columnas">
			<div class="columna_izq">
				
			</div>	
			<div class="columna_der">
				<h1><?php echo get_field('titulo_anuncia') ?></h1>
				<h2><?php echo get_field('subtitulo_anuncia') ?></h2>
				<p class="movil_text1"><?php echo get_field('parrafo_socio') ?></p>
				<p class="movil_text2"><?php echo get_field('parrafo') ?></p>
				<div class="contacto_empresa back_contactos">
					<?php echo do_shortcode('[contact-form-7 id="748" title="Solicitud (Empresa)"]'); ?>
				</div>
				
			</div>

		</div>
	</div>
</section>
<style>
	section.anuncia .x-container .columnas .columna_der .back_contactos {
	    background: #282828;
	}
	#correo:before {
	    position: relative;
	    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/mensaje.png');
	    content: '';
	    width: 22px;
	    height: 22px;
	    background-size: contain;
	    display: inline-block;
	    top: 6px;
	    left: 0;
	}
	input {
	    text-align: center;
	    padding: 10px 0px;
	}
	label:before {
	    width: 22px !important;
	    height: 22px !important;
	    margin-right: 5px !important;
	}
	label {
	    width: 100% !important;
	}
	section.anuncia .x-container .columnas .columna_der p {
	    margin-top: 20px;
	    margin-bottom: 10px;
	    font-size: 14px;
	}
	section.anuncia .x-container .columnas .columna_der .back_contactos p {
	    font-size: 10px;
	}
	section.anuncia .x-container .columnas .columna_der .back_contactos {
	    margin-top: 30px;
	}
</style>
<?php get_footer();

