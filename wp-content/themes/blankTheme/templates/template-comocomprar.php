<?php /* Template Name: comocomprar */
set_query_var('ENTRY', 'comocomprar');
get_header();
$idhome = get_option( 'page_on_front' );
?>
<section class="porque_nosotros">
	<div class="x-container">
		<div class="columnas">
			<div class="columna_center">
				<h1>¿<?php echo get_field('titulo') ?><strong class="azul"><?php echo get_field('text_azul') ?></strong>.<strong class="naranja"><?php echo get_field('text_naranja') ?></strong>?</h1>
				<p><?php echo get_field('texto') ?></p>
			</div>	
			<div class="col-youtube">
				<img src="<?php echo get_field('img_adorni') ?>" alt="" class="adorno-izq">
				<iframe width="420" height="315"
				src="<?php echo get_field('url_youtube') ?>">
				</iframe>
			</div>	
			<div class="mas_dudas">
				<h2 class="preguntas">
					<?php  echo get_field('pregunta_dudas')?>
				</h2>
				<p><?php  echo get_field('respuesta_duda')?></p>
				<img src="<?php  echo get_field('img_duda')?>" alt="">
				<a style="color: black" href="<?php  echo get_field('link_preguntasfrecuentes')?>">
					<p class="preguntas_frecuentes">
						<?php  echo get_field('texto_final')?>
					</p>
				</a>
				
			</div>
		</div>
	</div>	
</section>
<style>
	.mas_dudas .preguntas_frecuentes {
	    color: black;
	    font-weight: 700;
	}
	.mas_dudas img {
	    background: #FBF645 0% 0% no-repeat padding-box;
	    padding: 10px;
	    border-radius: 10px;
	    margin-top: 30px;
	    display: inline-block;
	}
	.mas_dudas {
	    margin-bottom: 40px;
	}
	.mas_dudas h2 {
	    font-size: 40px;
	    margin-bottom: 10px;
	}
	.columna_center h1 {
	    font-size: 40px;
	    margin-bottom: 15px;
	}
	section.porque_nosotros {
	    width: 100%;
	    min-height: 100vh;
	}
	.col-youtube img.adorno-izq {
	    width: 100%;
	}	
	.columnas {
	    padding-top: 130px;
	}
	h1,p,h2{
		text-align: center;
	}
	section.porque_nosotros  iframe {
	    position: absolute;
	    top: 30%;
	    left: calc(50% + 5px);
	    transform: translateX(-50%);
	    width: 820px;
	    height: 520px;
	}
	section.porque_nosotros .mas_dudas {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin-top: 15px;
	}
	section.porque_nosotros .mas_dudas img{
	    margin-top: 15px;
	}
	p.preguntas_frecuentes {
	    width: min-content;
	    margin-top: 15px;
	}

</style>
<?php get_footer();

