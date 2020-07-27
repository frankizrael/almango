<?php /* Template Name: nosotros */
set_query_var('ENTRY', 'nosotros');
get_header();
?>
<section class="quienes_somos">
	<div class="contenedor">
		<div class="columnas">
			<div class="columna_center">
				<h1><?php echo get_field('titulo_nosotros') ?></h1>
				<p><?php echo get_field('texto_nosotros') ?></p>
			</div>
			<div class="columna_center_equipo">
				<div class="titulo_equipo">
					<h2><?php echo get_field('titulo_equipo') ?></h2>
					<img src="<?php echo get_field('img_logo') ?>" alt="">
				</div>
				<div class="grid_equipo">
					<div class="fernando">
						<img src="<?php echo get_field('img_fernando') ?>" alt="">
						<p><?php echo get_field('nombre_fernando') ?> </p>
					</div>
					<div class="element_equipo">
						<div class="melissa">
						<img src="<?php echo get_field('img_melissa') ?>" alt="">
						<p><?php echo get_field('nombre_melissa') ?> </p>
						</div>
						<div class="luciano">
							<img src="<?php echo get_field('img_luciano') ?>" alt="">
							<p><?php echo get_field('nombre_luciano') ?> </p>
						</div>
					</div>
					
					<div class="pedro">
						<img src="<?php echo get_field('img_pedro') ?>" alt="">
						<p><?php echo get_field('nombre_pedro') ?> </p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div class="hashtag">
		<p><?php echo get_field('hashtag') ?> </p>
	</div>
</section>
<?php get_footer();

