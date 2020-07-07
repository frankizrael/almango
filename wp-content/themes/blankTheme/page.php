<?php
set_query_var('ENTRY', 'page');
get_header();
?>
<div class="single-page">
<?php if (have_posts()):
	while (have_posts()):
		the_post();
		the_content();
	endwhile;
endif; ?>
</div>
<style type="text/css">
	.single-page {		
		max-width: 1100px;
		margin: auto;
		margin-top: 120px;
	}
</style>
<?php get_footer();