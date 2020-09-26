<?php /* Template Name: preguntasfrecuentes */
set_query_var('ENTRY', 'preguntasfrecuentes');
get_header();
?>
<section class="preguntas_frecuentes">
	<img src="<?php echo get_field('back_imagen') ?>" alt="" class="back_imagen">
	<div class="columnas">
		<h1><?php echo get_field('titulo_text') ?></h1>
		<p><?php echo get_field('parrafo_titulo') ?></p>
		<img class="isotipo" src="<?php echo get_field('img_isotipo') ?>" alt="">
		<p><?php echo get_field('text_logo') ?></p>
		<label for="" style="display: none">
			<input placeholder="Escribe tu consulta" type="text"><img src="<?php echo get_template_directory_uri(); ?>/img/lupa.png" alt="">
		</label>
		<div class="ss">
			<?php echo do_shortcode('[wpdreams_ajaxsearchlite]'); ?>
		</div>
		<div class="consultas">
			<?php
			$consultas = get_field('consultas');
			if ($consultas){
				foreach($consultas as $ban) {
					?>
					<div class="item_consultas">
						<a href="<?php echo $ban['link_consulta']; ?>">
							<img src="<?php echo $ban['img_consulta']; ?>" alt="">
							<h3><?php echo $ban['titulo_consulta']; ?></h3>
						</a>
					</div>
					<?php  
				}
			}
			?>
			<div class="item_consultas">
				
			</div>
		</div>
	</div>
</section>
<style>
	div.asl_m .probox .proinput input::placeholder {
	    color: #000 !important;
	}
	div#ajaxsearchliteres1 {
	    margin-top: -10px;
	}
	div.asl_r .results .item .asl_content h3 a {
	    color: black !important;
	}
	.asl_image {
	    display: none;
	}
	.ss {
	    max-width: 910px;
	    margin: auto;
	    margin-top: 20px;
	}
	.ss .asl_w {
	    border: none !important;
	}
	.ss .asl_w .probox {
	    border: none !important;
	    border-radius: 0px !important;
	    text-align: center;
	    background: #cccccce8 0% 0% no-repeat padding-box !important;
	    width: 100%;
	    color: #000000;
	    font-size: 18px;
	    box-sizing: border-box;
	    height: auto !important;
	}
	.ss .asl_w .probox input {
	    font-family: 'ralewayregular' !important;
	    text-align: center;
	    font-size: 18px !important;
	}
	.ss .asl_w .probox input::placeholder {
		font-family: 'ralewayregular' !important;
	    text-align: center;
	    font-size: 18px !important;
	    color: black;	
	}
	div.asl_m .proinput input.orig {
	    border-bottom: solid 1px black !important;
	}
	.ss .innericon { position: relative; }
	.ss .innericon:before {
		content: '';
		background-image: url('<?php echo get_template_directory_uri(); ?>/img/lupa.png');
		position: absolute;
	    width: 100%;
	    height: 100%;
	    background-size: cover;
	    background-position: center;
	    left: 0px;
	}
	.ss .innericon svg {
	    display: none !important;
	}
	div.asl_w .probox .promagnifier {
	    border: none !important;
	    box-shadow: none;
	}
	section.preguntas_frecuentes .columnas .consultas .item_consultas a {
	    display: block;
	    text-align: center;
	    color: black;
	    width: 100%;
	}
	section.preguntas_frecuentes {
		width: 100%;
		overflow: hidden;
		padding-top: 100px;
	}
	section.preguntas_frecuentes img.back_imagen {
		width: 101%;
		position: absolute;
		z-index: -1;
	}
	section.preguntas_frecuentes .columnas h1 {
		color: white;
		font-size: 40px;
		font-family: 'Raleway';
		text-align: center;
		margin-top: 80px;
	}
	section.preguntas_frecuentes .columnas p {
		color: white;
		text-align: center;
		margin-top: 30px;
	}
	section.preguntas_frecuentes .columnas img.isotipo {
		margin: 30px auto 17px;
		display: block;
	}
	section.preguntas_frecuentes .columnas label {
	    display: flex;
	    align-items: center;
	    margin: auto;
	    margin-top: 35px;
	    max-width: 910px;
	    background: #cccccce8 0% 0% no-repeat padding-box;
	    padding: 6px 10px;
	    box-sizing: border-box;
	}
	section.preguntas_frecuentes .columnas label input {
	    margin: 0 auto;
	    text-align: center;
	    background: transparent;
	    border: unset;
	    border-bottom: 1px solid #000000;
	    width: 100%;
	    box-sizing: border-box;
	    color: #000000;
	    font-size: 18px;
	    padding: 2px 0px;
	}
	section.preguntas_frecuentes .columnas label {
	    position: relative;
	}
	section.preguntas_frecuentes .columnas label img {
	    position: absolute;
	    width: 24px;
	    height: 24px;
	    right: 12px;
	    top: 5px;
	}
	section.preguntas_frecuentes .columnas label input::placeholder{
		color: #000000;
	}
	section.preguntas_frecuentes .columnas .consultas {
		margin: 0 auto;
		margin-top: 30px;
		width: max-content;
		display: grid;
		justify-content: space-between;
		grid-template-columns: repeat(5,158px);
		grid-gap: 30px;
		grid-template-rows: 77px 77px;
	}
	section.preguntas_frecuentes .columnas .consultas .item_consultas:nth-child(1) {
		background: white;
		grid-column: 1/3;
	}
	section.preguntas_frecuentes .columnas .consultas .item_consultas {
		background: transparent linear-gradient(180deg, #FBFBFB 0%, #ECECEC 100%) 0% 0% no-repeat padding-box;
		box-shadow: 0px 3px 3px #000000B3;
		border-radius: 15px;
		opacity: 1;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
	section.preguntas_frecuentes .columnas .consultas .item_consultas  h3 {
		font-size: 12px;
	}
</style>
<?php get_footer();

