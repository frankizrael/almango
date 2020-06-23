<?php

// Register Custom Post Type
function register_cpt_promotions() {
	$labels = array(
		'name'                  => _x('Promociones', 'Post Type General Name', 'intralot'),
		'singular_name'         => _x('Promoción', 'Post Type Singular Name', 'intralot'),
		'menu_name'             => __('Promociones', 'intralot'),
		'name_admin_bar'        => __('Promoción', 'intralot'),
		'all_items'             => __('Todos las promociones', 'intralot'),
		'add_new_item'          => __('Añadir promoción', 'intralot'),
		'search_items'          => __('Buscar promoción', 'intralot'),
	);
	$rewrite = array(
		'slug'                  => 'promociones',
		'with_front'            => true,
		'pages'                 => true,
		'feeds'                 => false,
	);
	$args = array(
		'label'                 => __('Promoción', 'intralot'),
		'description'           => __('Promociones', 'intralot'),
		'labels'                => $labels,
		'supports'              => array('title', 'editor', 'thumbnail'),
		'taxonomies'            => array('category'),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'menu_icon'             => 'dashicons-star-filled',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'rewrite'               => $rewrite,
		'capability_type'       => 'post',
		'show_in_rest'          => false,
	);
	register_post_type('promotion', $args);
}

add_action('init', 'register_cpt_promotions', 0);