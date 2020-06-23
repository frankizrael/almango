<?php

// Register Custom Post Type
function register_cpt_last_results() {
	$labels = array(
		'name'                  => _x('Últimos resultados', 'Post Type General Name', 'intralot'),
		'singular_name'         => _x('Último resultado', 'Post Type Singular Name', 'intralot'),
		'menu_name'             => __('Últimos resultados', 'intralot'),
		'name_admin_bar'        => __('Último resultado', 'intralot'),
		'all_items'             => __('Todos los últimos resultados', 'intralot'),
		'add_new_item'          => __('Añadir último resultado', 'intralot'),
		'search_items'          => __('Buscar último resultado', 'intralot'),
	);
	/*$rewrite = array(
		'slug'                  => 'resultado',
		'with_front'            => true,
		'pages'                 => true,
		'feeds'                 => false,
	);*/
	$args = array(
		'label'                 => __('Último resultado', 'intralot'),
		'description'           => __('Últimos resultados de los juegos', 'intralot'),
		'labels'                => $labels,
		'supports'              => array('title', 'editor', 'thumbnail'),
		'taxonomies'            => array('game'),
		'hierarchical'          => false,
		'public'                => false,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'menu_icon'             => 'dashicons-calendar',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => false,
		'can_export'            => true,
		'has_archive'           => false,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'rewrite'               => false,
		'capability_type'       => 'post',
		'show_in_rest'          => false,
	);
	register_post_type('last_results', $args);
}

add_action('init', 'register_cpt_last_results', 0);