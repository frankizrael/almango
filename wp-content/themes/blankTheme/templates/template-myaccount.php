<?php
/* Template Name: myaccount */
set_query_var('ENTRY', 'myaccount');
get_header();
?>
<div class="myaccount-page <?php if (is_user_logged_in()){ echo 'full'; } ?>">
	<div class="top-background" style="background-image: url(<?php the_field('background_myaccount','options'); ?>); "></div>
	<div class="core-page">
		<?php if (have_posts()):
			while (have_posts()):
				the_post();
				the_content();
			endwhile;
		endif; ?>
	</div>
</div>
<?php get_footer();