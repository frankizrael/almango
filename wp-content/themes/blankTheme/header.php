<!doctype html>
<html lang="<?php bloginfo( 'language' ) ?>">
<head>
    <meta charset="<?php bloginfo( 'charset' ) ?>">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	  <?php
        $entry = get_query_var('ENTRY');
        load_assets(['main', $entry]);
        wp_head();
    ?>
</head>
<body <?php body_class(); ?>>
<header>
    <div class="x-container">
        <div class="flex align-items-center">
            <div class="flex__item left_logo">
                <a href="<?php echo site_url(); ?>">
                    <img src="<?php the_field('logo','options'); ?>">
                </a>
            </div>
            <div class="flex__item right_content">
                <div class="flex align-items-center">
                    <div class="flex__table searchItem">
                        <div class="searchShortCode">
                            <?php echo do_shortcode('[wcas-search-form]'); ?>
                        </div>
                    </div>
                    <div class="flex__table menuItem">
                        <?php
                            wp_nav_menu( array(
                                'menu' => 'header-menu'
                            ) );
                        ?>
                    </div>
                    <div class="flex__table iconsItem">
                        <div class="user_min">
                            <a href="<?php echo site_url(); ?>/my-account/">
                                <?php
                                    $userimg = get_template_directory_uri().'/img/user.png';
                                    if (is_user_logged_in()){
                                        $user = wp_get_current_user();
                                        $user_id = get_current_user_id();
                                        $genero = get_field('user_genero','user_'.$user_id);
                                        if ($genero == 'masculino') {
                                            $userimg = get_template_directory_uri().'/img/user_male.png';
                                        }
                                        if ($genero == 'femenimo') {
                                            $userimg = get_template_directory_uri().'/img/user_female.png';
                                        }
                                        if ($genero == 'no-especifico') {
                                            $userimg = get_template_directory_uri().'/img/user_lgtbi.png';
                                        }
                                    }
                                ?>
                                <i>
                                    <img src="<?php echo $userimg;?>">
                                </i>
                            </a>
                        </div>
                        <div class="cart_min">
                            <a href="<?php echo site_url();?>/cart">
                                <?php if(WC()->cart->get_cart_contents_count() > 0): ?>
                                  <mark class="not">
                                  <?php echo WC()->cart->get_cart_contents_count(); ?>
                                  </mark>
                                <?php  endif;?>
                                <i>
                                    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/cart.png">
                                </i>
                            </a>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>