
<?php /* Template Name: preguntasfrecuentes */
set_query_var('ENTRY', 'preguntasfrecuentes');
get_header();
?>
<section class="preuntas_frecuentes">
	<img src="<?php echo get_field('back_imagen') ?>" alt="" class="back_imagen">
	<div class="columnas">
		<h1><?php echo get_field('titulo_text') ?></h1>
		<p><?php echo get_field('parrafo_titulo') ?></p>
		<img src="<?php echo get_field('img_isotipo') ?>" alt="">
		<h3><?php echo get_field('text_logo') ?></h3>
		<label for="" >
			<input placeholder="Escribe tu consulta" type="text"><img src="<?php echo get_field('img_lupa') ?>" alt="">
		</label>
		<div class="consultas">
			<?php
			$consultas = get_field('consultas');
			if ($consultas){
				foreach($consultas as $ban) {
					?>
					<div class="item_consultas">
						<img src="<?php echo $ban['img-consulta']; ?>" alt="">
						<h3><?php echo $ban['titulo-consulta']; ?></h3>
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
<?php get_footer();

