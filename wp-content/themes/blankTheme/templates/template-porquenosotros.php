<?php /* Template Name: porquenosotros */
set_query_var('ENTRY', 'porquenosotros');
get_header();
?>
<section class="porque_nosotros">
	<div class="x-container">
		<div class="columnas">
			<div class="columna_center">
				<h1><?php echo get_field('titulo') ?></h1>
				<p><?php echo get_field('texto') ?></p>
			</div>	
			<div class="col-youtube">
				<img src="<?php echo get_field('img_adorni') ?>" alt="" class="adorno-izq">
				<?php echo get_field('url_youtube') ?>
				<img src="<?php echo get_field('img_adornd') ?>" alt="" class="adorno-der">
			</div>	
			<div class="hashtag">
				<p><?php echo get_field('hashtag') ?> </p>
			</div>
			<div class="descuento">
				<div class="ticketizq">
					<img class="blueticket" src="<?php echo get_field('img_ticketb') ?>" alt="">
					<img class="redticket" src="<?php echo get_field('img_tickety') ?>" alt="">
					<img class="orangeticket" src="<?php echo get_field('img_ticketro') ?>" alt="">
				</div>
				<div class="texto_descuento">
					<h2><?php echo get_field('titulo_descuento') ?></h2>
					<h3><?php echo get_field('text_ticketro') ?></h3>
				</div>
				<div class="ticketder">
					<img class="blueticket" src="<?php echo get_field('img_ticketb') ?>" alt="">
					<img class="redticket" src="<?php echo get_field('img_tickety') ?>" alt="">
					<img class="orangeticket" src="<?php echo get_field('img_ticketro') ?>" alt="">
				</div>
			</div>	
		</div>
	</div>
	
</section>
<?php get_footer();

