<?php
set_query_var('ENTRY', 'page');
get_header();
?>
<div class="single-page">
	<div class="x-container">
		<?php if (have_posts()):
			while (have_posts()):
				the_post();
				the_content();
			endwhile;
		endif; ?>
	</div>
</div>
<?php get_footer();