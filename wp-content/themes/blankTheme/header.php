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
        <div class="flex align-items-center mobileOrder">
            <div class="flex__item left_logo">
                <div class="mobileItemCorp" style="display:none;">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/bars.png">
                </div>
                <a href="<?php echo site_url(); ?>">
                    <img src="<?php the_field('logo','options'); ?>" class="logoDesktop">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/logotipo.png" style="display:none;" class="mobileLogo">
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
                        <?php
                            if (is_user_logged_in()){
                                $user_id = get_current_user_id();
                                $notify = get_field('notify','user_'.$user_id);
                                if ($notify) {
                                ?>
                            <div class="notify">
                                <a href="<?php echo site_url(); ?>/my-account?extend=notifiy">
                                    <img src="<?php echo get_template_directory_uri(); ?>/img/campana_1.png">
                                </a>
                                <span>
                                    <?php echo count($notify); ?>
                                </span>
                            </div>
                                <?php
                                }
                            }
                        ?>
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
<div class="mobileMenu">
    <div class="ContentmobileMenu" style="background: transparent linear-gradient(180deg, #4B5AFC 0%, #00AFE9 100%) 0% 0% no-repeat padding-box;">
        <div class="topMobileMenu">
            <div class="closeMobileMenu"></div>
            <div class="mobile-container">
                <div class="userName">
                        <?php
                            $userimg = get_template_directory_uri().'/img/user.png';
                            if (is_user_logged_in()) {
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
                        ?>                        
                        <a href="<?php echo site_url(); ?>/my-account/">
                            <i>
                                <img src="<?php echo $userimg;?>">
                            </i>
                        </a>
                        <h3><?php echo esc_attr( $user->first_name ); ?> <?php echo esc_attr( $user->last_name ); ?></h3>
                        <p><?php echo esc_attr( $user->user_email ); ?></p>
                        <div class="searchShortCode">
                            <?php echo do_shortcode('[wcas-search-form]'); ?>
                        </div>                        
                        <div class="descuento">
                            <?php
                                $descuentos = get_field('descuentos','user_'.$user_id);
                                if ($descuentos) {
                                    foreach ($descuentos as $desc) {
                                        ?>
                                <a href="<?php echo site_url(); ?>/my-account?extend=descuentos">
                                    <img src="<?php echo get_field('imagen_pr',$desc['id']); ?>">
                                </a>
                                        <?php
                                    }
                                }
                            ?>
                        </div>
                        <?php
                        } else {
                                ?>                        
                        <a href="<?php echo site_url(); ?>/my-account/">                   
                            <i>
                                <img src="<?php echo $userimg;?>">
                            </i>
                        </a>   
                        <div class="searchShortCode">
                            <?php echo do_shortcode('[wcas-search-form]'); ?>
                        </div>  
                                <?php
                            }
                        ?>
                </div>
                <div class="menuSimple">
                    <?php
                        wp_nav_menu( array(
                            'menu' => 'header-menu'
                        ) );
                    ?>
                </div>
                <?php
                    if (is_user_logged_in()){
                      ?>
                <div class="closeSesion">
                    <a href="<?php echo wp_logout_url( home_url().'/my-account/' ); ?>" class="btnLink">Cerrar sesión</a> 
                </div>   
                      <?php
                    } 
                ?>
            </div>
        </div>
    </div>
</div>