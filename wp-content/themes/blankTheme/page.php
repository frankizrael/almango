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
<?php get_footer();