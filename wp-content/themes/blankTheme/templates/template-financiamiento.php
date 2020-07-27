<?php /* Template Name: financiamiento */
set_query_var('ENTRY', 'financiamiento');
get_header();
?>
<section class="man_comment">
	<div class="contenedor">
		<div class="columnas">
			<img src="<?php echo get_field('img_man') ?> " alt="">
			<div class="columna_center">
				<p><?php echo get_field('text_comment') ?> </p>
				<img src="<?php echo get_field('img_comment') ?> " alt="">
			</div>			
		</div>
	</div>
</section>
<?php get_footer();

