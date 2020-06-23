<?php

// Register Custom Post Type
function register_cpt_banner() {
	$labels = array(
		'name'                  => _x('Banners', 'Post Type General Name', 'intralot'),
		'singular_name'         => _x('Banner', 'Post Type Singular Name', 'intralot'),
		'menu_name'             => __('Banners', 'intralot'),
		'name_admin_bar'        => __('Banners', 'intralot'),
		'all_items'             => __('Todos los banners', 'intralot'),
		'add_new_item'          => __('Añadir banner', 'intralot'),
		'search_items'          => __('Buscar banner', 'intralot'),
	);
	$args = array(
		'label'                 => __('Banner', 'intralot'),
		'description'           => __('Banner de juegos', 'intralot'),
		'labels'                => $labels,
		'supports'              => array('title', 'editor', 'thumbnail'),
		'taxonomies'            => array('game'),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'menu_icon'             => 'dashicons-feedback',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'rewrite'               => false,
		'capability_type'       => 'post',
		'show_in_rest'          => false,
	);
	register_post_type('banner', $args);
}

add_action('init', 'register_cpt_banner', 0);