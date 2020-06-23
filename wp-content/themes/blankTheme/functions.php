<?php
/* Theme Support */
add_theme_support('html-5');
add_theme_support('post-thumbnails');
add_theme_support('custom-logo');
add_theme_support('title-tag');
add_theme_support( 'woocommerce' );
add_filter('show_admin_bar', '__return_false');

/* Register custom post types and custom taxonomies */
/*require_once 'inc/register-taxonomy-game.php';*/

/* Bootstrap Nav Walker */
/*require_once 'inc/bootstrap-nav-walker.php';*/

/* Register Widgets */
function my_widgets_init() {

	register_sidebar( array(
		'name'          => __( 'Sidebar', 'twentyseventeen' ),
		'id'            => 'sidebar-1',
		'description'   => __( 'Add widgets here to appear in your sidebar.', 'twentyseventeen' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );	

}
add_action( 'widgets_init', 'my_widgets_init' );

/* Register menus */
function register_my_menus() {
	register_nav_menus(
		array(
			'header-menu' => __('Header Menu'),
            'footer-menu' => __('Footer Menu')
		)
	);
}
add_action('init', 'register_my_menus');

/* Hide posts from menu */
function hide_post_menu() {
	remove_menu_page('edit-comments.php');
}
add_action('admin_menu', 'hide_post_menu');

/* Load assets */
function load_assets($entries) {
	$assets = file_get_contents(get_stylesheet_directory() . '/assets.json');
	$assets = json_decode($assets);
	foreach ( $assets as $chunk => $files ) {
		foreach ($entries as $entry) {
			if ( $chunk == $entry ) {
				foreach ($files as $type => $asset) {
					switch ($type) {
						case 'js':
							wp_enqueue_script($chunk, get_stylesheet_directory_uri() . '/dist/' . $asset, array(), false, true);
							break;
						case 'css':
							wp_enqueue_style($chunk, get_stylesheet_directory_uri() . '/dist/' . $asset);
					}
				}
			}
		}
	}
}


/* Register sidebar */
/*register_sidebar(array(
	'name' => 'Footer',
	'id' => 'footer-sidebar',
	'before_widget' => '<div id="%1$s" class="col-12 col-md mb-3 mb-md-0 widget %2$s">',
	'after_widget'  => '</div>',
));*/

/* Remove prefix */
function remove_archive_prefix($title) {
    return preg_replace('/^\w+: /', '', $title);
}
add_filter('get_the_archive_title', 'remove_archive_prefix');

/* Excerpt size */
function tn_custom_excerpt_length($length) {
	return 20;
}
add_filter('excerpt_length', 'tn_custom_excerpt_length', 999);

/* Reduce terms to names */
function reduce_to_names($term) {
    return $term->name;
}

/* Is Ajax request */
/*function is_ajax() {
    return !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}*/


if( function_exists('acf_add_options_page') ) {
	acf_add_options_page();
}

/*pagination*/
function yarpay_pagination()
{
    global $wp_query;
    $big = 999999999;
    echo '<div class="navigation">';
    echo paginate_links(array(
        'base' => str_replace($big, '%#%', get_pagenum_link($big)),
        'format' => '?paged=%#%',
        'current' => max(1, get_query_var('paged')),
        'total' => $wp_query->max_num_pages,
        'prev_text' => __('<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32.635 32.635" xml:space="preserve"><g><path d="M32.135,16.817H0.5c-0.276,0-0.5-0.224-0.5-0.5s0.224-0.5,0.5-0.5h31.635c0.276,0,0.5,0.224,0.5,0.5 S32.411,16.817,32.135,16.817z"/><path d="M19.598,29.353c-0.128,0-0.256-0.049-0.354-0.146c-0.195-0.195-0.195-0.512,0-0.707l12.184-12.184L19.244,4.136 c-0.195-0.195-0.195-0.512,0-0.707s0.512-0.195,0.707,0l12.537,12.533c0.094,0.094,0.146,0.221,0.146,0.354 s-0.053,0.26-0.146,0.354L19.951,29.206C19.854,29.304,19.726,29.353,19.598,29.353z"/></g></svg>','decorlux'),
        'next_text' => __('<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32.635 32.635" xml:space="preserve"><g><path d="M32.135,16.817H0.5c-0.276,0-0.5-0.224-0.5-0.5s0.224-0.5,0.5-0.5h31.635c0.276,0,0.5,0.224,0.5,0.5 S32.411,16.817,32.135,16.817z"/><path d="M19.598,29.353c-0.128,0-0.256-0.049-0.354-0.146c-0.195-0.195-0.195-0.512,0-0.707l12.184-12.184L19.244,4.136 c-0.195-0.195-0.195-0.512,0-0.707s0.512-0.195,0.707,0l12.537,12.533c0.094,0.094,0.146,0.221,0.146,0.354 s-0.053,0.26-0.146,0.354L19.951,29.206C19.854,29.304,19.726,29.353,19.598,29.353z"/></g></svg>','decorlux'),
        'show_all' => false,
        'end_size' => 1,
        'mid_size' => 1
    ));
    echo '</div>';
}


