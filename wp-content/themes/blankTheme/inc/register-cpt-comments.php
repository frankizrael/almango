<?php

// Register Custom Post Type
function register_cpt_comments_matches() {
	$labels = array(
		'name'                  => _x('Comentarios de partidos', 'Post Type General Name', 'intralot'),
		'singular_name'         => _x('Comentarios de partido', 'Post Type Singular Name', 'intralot'),
		'menu_name'             => __('Comentarios de partidos', 'intralot'),
		'name_admin_bar'        => __('Comentarios de partidos', 'intralot'),
		'all_items'             => __('Todos los comentarios', 'intralot'),
		'add_new_item'          => __('Añadir comentario de partido', 'intralot'),
		'search_items'          => __('Buscar comentario de partido', 'intralot'),
	);
	$rewrite = array(
		'slug'                  => 'comentarios-partidos',
		'with_front'            => true,
		'pages'                 => true,
		'feeds'                 => false,
	);
	$args = array(
		'label'                 => __('Comentarios de partidos', 'intralot'),
		'description'           => __('Comentarios de partidos', 'intralot'),
		'labels'                => $labels,
		'supports'              => array('title', 'editor', 'thumbnail', 'excerpt'),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'menu_icon'             => 'dashicons-rss',
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
	register_post_type('comments-matches', $args);
}

add_action('init', 'register_cpt_comments_matches', 0);
