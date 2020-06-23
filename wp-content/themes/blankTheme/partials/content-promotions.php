<div class="list-promotions row pb-3">
	<?php if (have_posts()):
		while (have_posts()): the_post();
			$terms = get_the_terms($post->ID, 'category');
			$terms = array_map('reduce_to_names', $terms); ?>
			<div class="col-md-4 my-3">
				<a class="card" href="<?php the_permalink() ?>">
					<img src="<?php the_post_thumbnail_url('large') ?>" class="card-img-top" alt="<?php the_title() ?>">
					<div class="card-body">
						<div class="card-category"><?php echo join(', ', $terms) ?></div>
						<h4 class="card-title"><?php the_title() ?></h4>
						<div class="card-text"><?php the_excerpt() ?></div>
						<div class="card-link">Ver más 🡒</div>
					</div>
				</a>
			</div>
		<?php endwhile;
	endif; ?>
</div>
<div class="pagination mb-3 d-flex justify-content-center">
	<div class="nav mx-1"><?php next_posts_link('Siguiente'); ?></div>
</div>