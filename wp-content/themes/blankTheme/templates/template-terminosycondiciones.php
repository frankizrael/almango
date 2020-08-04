<?php /* Template Name: informacionlegal */
set_query_var('ENTRY', 'informacionlegal');
get_header();
$titulo = get_the_title();
    while (have_posts()) : the_post();
        $contenido = apply_filters('the_content', get_the_content());
        $imagen = get_post_thumbnail_id();
    endwhile;
    wp_reset_query();

?>
<section id="terminos-y-condiciones " class="informacionlegal patch_a2 patch_a2_hentry">
	<div class="x-container">
		<?php echo $contenido; ?>
	</div>
</section>
<?php get_footer();

