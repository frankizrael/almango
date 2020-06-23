<?php
$term = get_query_var('GAME');
$banner = get_posts(array(
	'post_type' => 'banner',
	'posts_per_page' => 1,
	'order' => 'DESC',
	'orderby' => 'date',
	'tax_query' => array(
		array(
			'taxonomy' => 'game',
			'field' => 'id',
			'terms' => $term->term_id
		)
	)
));
if (count($banner) > 0):
	$banner = $banner[0];
	$button = get_field('banner_button', $banner->ID);
	switch ($term->slug):
		case 'tinka': ?>
        <?php if (!get_field('banner_background', $banner->ID)) {?>
		<div class="banner container-fluid <?php echo $term->slug ?>">
			<div class="row align-items-center">
				<div class="col-4 col-md-2 ">
					<img src="<?php echo get_field('banner_logo', $banner->ID)['url'] ?>" alt="<?php echo get_field('banner_logo', $banner->ID)['alt'] ?>" class="banner-logo">
				</div>
				<div class="col-7 col-md-4 text-right text-md-left">
					<div class="banner-text"><?php echo get_field('banner_text', $banner->ID) ?></div>
					<div class="banner-amount"><?php echo get_field('banner_amount', $banner->ID) ?></div>
				</div>
				<div class="col-md-4 offset-md-2 text-center text-md-right mt-2 mt-md-0">
					<div class="banner-date"><?php echo get_field('banner_date', $banner->ID) ?></div>
                    <div class="banner-btn-a"><a href="<?php echo $button['button_link'] ?>" class="btn btn-block" style="background-color: <?php echo $button['button_color'] ?>"><?php echo $button['button_text'] ?></a></div>
				</div>
			</div>
        </div>
        <?php } else { ?>
            <div class="banner_background">
                <img src="<?php echo get_field('banner_background', $banner->ID); ?>" style="width: 100%;height: auto;">
            </div>
        <?php } ?>
		<?php break;
        case 'kabala': ?>
        <?php if (!get_field('banner_background', $banner->ID)) {?>
        <div class="banner container-fluid <?php echo $term->slug ?>">
            <div class="row align-items-center">
                <div class="col-5 col-md-2">
                    <img src="<?php echo get_field('banner_logo', $banner->ID)['url'] ?>" alt="<?php echo get_field('banner_logo', $banner->ID)['alt'] ?>" class="banner-logo">
                </div>
                <div class="col-md-1 text-center d-none d-md-block">
                    <div class="banner-text"><?php echo get_field('banner_text', $banner->ID) ?></div>
                </div>
                <div class="col-7 col-md-4 text-right text-md-left">
                    <div class="banner-text d-block d-md-none"><?php echo get_field('banner_text', $banner->ID) ?></div>
                    <div class="banner-amount"><?php echo get_field('banner_amount', $banner->ID) ?></div>
                </div>
                <div class="col-md-4 offset-md-1 text-center text-md-right my-3 my-md-0">
                    <div class="banner-date"><?php echo get_field('banner_date', $banner->ID) ?></div>
                    <div class="banner-btn-a"><a href="<?php echo $button['button_link'] ?>" class="btn btn-block" style="background-color: <?php echo $button['button_color'] ?>"><?php echo $button['button_text'] ?></a></div>
                </div>
            </div>
        </div>
        <?php } else { ?>
            <div class="img_background">
                <img src="<?php echo get_field('banner_background', $banner->ID); ?>" style="width: 100%;height: auto;">
            </div>
        <?php } ?>
        <?php break;
		case 'gana-diario': ?>
        <?php if (!get_field('banner_background', $banner->ID)) {?>
        <div class="banner container-fluid <?php echo $term->slug ?>">
            <div class="row align-items-center">
                <div class="col-5 col-md-2">
                    <img src="<?php echo get_field('banner_logo', $banner->ID)['url'] ?>" alt="<?php echo get_field('banner_logo', $banner->ID)['alt'] ?>" class="banner-logo">
                </div>
                <div class="col-md-1 text-center d-none d-md-block">
                    <div class="banner-text text-white"><?php echo get_field('banner_text', $banner->ID) ?></div>
                </div>
                <div class="col-7 col-md-4 text-right text-md-left">
                    <div class="banner-text text-white d-block d-md-none"><?php echo get_field('banner_text', $banner->ID) ?></div>
                    <div class="banner-amount text-white"><?php echo get_field('banner_amount', $banner->ID) ?></div>
                </div>
                <div class="col-md-4 offset-md-1 text-center text-md-right my-3 my-md-0">
                    <div class="banner-date"><?php echo get_field('banner_date', $banner->ID) ?></div>
                    <div class="banner-btn-a"><a href="<?php echo $button['button_link'] ?>" class="btn btn-block" style="background-color: <?php echo $button['button_color'] ?>"><?php echo $button['button_text'] ?></a></div>
                </div>
            </div>
        </div>
        <?php } else { ?>
            <div class="img_background">
                <img src="<?php echo get_field('banner_background', $banner->ID); ?>" style="width: 100%;height: auto;">
            </div>
        <?php } ?>
        <?php break;
		case 'ganagol': ?>
        <?php if (!get_field('banner_background', $banner->ID)) {?>
        <div class="banner container-fluid <?php echo $term->slug ?>">
            <div class="row align-items-center">
                <div class="col-5 col-md-2">
                    <img src="<?php echo get_field('banner_logo', $banner->ID)['url'] ?>" alt="<?php echo get_field('banner_logo', $banner->ID)['alt'] ?>" class="banner-logo">
                </div>
                <div class="col-md-2 text-center d-none d-md-block">
                    <div class="banner-text text-white"><?php echo get_field('banner_text', $banner->ID) ?></div>
                </div>
                <div class="col-7 col-md-3 text-right text-md-left">
                    <div class="banner-text text-white d-block d-md-none"><?php echo get_field('banner_text', $banner->ID) ?></div>
                    <div class="banner-amount text-white"><?php echo get_field('banner_amount', $banner->ID) ?></div>
                </div>
                <div class="col-md-4 offset-md-1 text-center text-md-right my-3 my-md-0">
                    <div class="banner-date"><?php echo get_field('banner_date', $banner->ID) ?></div>
                    <div class="banner-btn-a"><a href="<?php echo $button['button_link'] ?>" class="btn btn-block" style="background-color: <?php echo $button['button_color'] ?>"><?php echo $button['button_text'] ?></a></div>
                </div>
            </div>
        </div>
        <?php } else { ?>
            <div class="img_background">
                <img src="<?php echo get_field('banner_background', $banner->ID); ?>" style="width: 100%;height: auto;"> 
            </div>
        <?php } ?>
        <?php break;
        case 'intralot': ?>
        <?php if (!get_field('banner_background', $banner->ID)) {?>
        <div class="banner container-fluid <?php echo $term->slug ?>">
            <div class="row align-items-center">
                <div class="col-5 col-md-2">
                    <img src="<?php echo get_field('banner_logo', $banner->ID)['url'] ?>" alt="<?php echo get_field('banner_logo', $banner->ID)['alt'] ?>" class="banner-logo">
                </div>
                <div class="col-md-2 text-center d-none d-md-block">
                    <div class="banner-text text-white"><?php echo get_field('banner_text', $banner->ID) ?></div>
                </div>
                <div class="col-7 col-md-3 text-right text-md-left">
                    <div class="banner-text text-white d-block d-md-none"><?php echo get_field('banner_text', $banner->ID) ?></div>
                    <div class="banner-amount text-white"><?php echo get_field('banner_amount', $banner->ID) ?></div>
                </div>
                <div class="col-md-4 offset-md-1 text-center text-md-right my-3 my-md-0">
                    <div class="banner-date"><?php echo get_field('banner_date', $banner->ID) ?></div>
                    <div class="banner-btn-a"><a href="<?php echo $button['button_link'] ?>" class="btn btn-block" style="background-color: <?php echo $button['button_color'] ?>"><?php echo $button['button_text'] ?></a></div>
                </div>
            </div>
        </div>
        <?php } else { ?>
            <div class="img_background">
                <img src="<?php echo get_field('banner_background', $banner->ID); ?>" style="width: 100%;height: auto;">
            </div>
        <?php } ?>
        <?php break;
	endswitch;
endif;