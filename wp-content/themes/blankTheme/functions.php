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

    register_sidebar( array(
        'name'          => __( 'comparador', 'twentyseventeen' ),
        'id'            => 'compare',
        'description'   => __( 'Add widgets here to appear in your sidebar.', 'twentyseventeen' ),
        'before_widget' => '<section id="%1$s" class="widget-compare %2$s">',
        'after_widget'  => '</section>',
        'before_title'  => '<h2 class="widget-compare-title">',
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


// Register Custom Post Type
function register_cupones_descuentos() {
    $labels = array(
        'name'                  => _x('Cupones de descuento', 'Post Type General Name', 'miloficios'),
        'singular_name'         => _x('Cupón de descuento', 'Post Type Singular Name', 'miloficios'),
        'menu_name'             => __('Cupones de descuento', 'miloficios'),
        'name_admin_bar'        => __('descuentos', 'miloficios'),
        'all_items'             => __('Todos los cupones', 'miloficios'),
        'add_new_item'          => __('Añadir cupón', 'miloficios'),
        'search_items'          => __('Buscar cupón', 'miloficios'),
    );
    $rewrite = array(
        'slug'                  => 'descuentos',
        'with_front'            => true,
        'pages'                 => true,
        'feeds'                 => false,
    );
    $args = array(
        'label'                 => __('descuento', 'miloficios'),
        'description'           => __('descuentos', 'miloficios'),
        'labels'                => $labels,
        'supports'              => array('title'),
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
    register_post_type('descuentos', $args);
}

add_action('init', 'register_cupones_descuentos', 0);


if( ! function_exists('custom_ajax_add_to_cart_button') && class_exists('WooCommerce') ) {
    function custom_ajax_add_to_cart_button( $atts ) {
        // Shortcode attributes
        $atts = shortcode_atts( array(
            'id' => '0', // Product ID
            'qty' => '1', // Product quantity
            'text' => '', // Text of the button
            'class' => '', // Additional classes
        ), $atts, 'ajax_add_to_cart' );

        if( esc_attr( $atts['id'] ) == 0 ) return; // Exit when no Product ID

        if( get_post_type( esc_attr( $atts['id'] ) ) != 'product' ) return; // Exit if not a Product

        $product = wc_get_product( esc_attr( $atts['id'] ) );

        if ( ! $product ) return; // Exit when if not a valid Product

        $classes = implode( ' ', array_filter( array(
            'button',
            'product_type_' . $product->get_type(),
            $product->is_purchasable() && $product->is_in_stock() ? 'add_to_cart_button' : '',
            $product->supports( 'ajax_add_to_cart' ) ? 'ajax_add_to_cart' : '',
        ) ) ).' '.$atts['class'];

        $add_to_cart_button = sprintf( '<a rel="nofollow" href="%s" %s %s %s class="%s">%s</a>',
            esc_url( $product->add_to_cart_url() ),
            'data-quantity="' . esc_attr( $atts['qty'] ) .'"',
            'data-product_id="' . esc_attr( $atts['id'] ) .'"',
            'data-product_sku="' . esc_attr( $product->get_sku() ) .'"',
            esc_attr( isset( $classes ) ? $classes : 'button' ),
            esc_html( empty( esc_attr( $atts['text'] ) ) ? $product->add_to_cart_text() : esc_attr( $atts['text'] ) )
        );

        return $add_to_cart_button;
    }
    add_shortcode('ajax_add_to_cart', 'custom_ajax_add_to_cart_button');
}

function is_featured_product($id){  
    $featureproducts = array();
    $args = array(
        'post_type' => 'product',
        'posts_per_page' => -1,
        'tax_query' => array(
                array(
                    'taxonomy' => 'product_visibility',
                    'field'    => 'name',
                    'terms'    => 'featured',
                ),
            ),
        );
    $loop = new WP_Query( $args );
    if ( $loop->have_posts() ) {
        while ( $loop->have_posts() ) : $loop->the_post();            
           array_push($featureproducts, get_the_ID());
        endwhile;
    } else {
        $featureproducts = 'No products found';
    }
    if (in_array($id,$featureproducts)){
        return 1;
    } else {
        return 0;
    }
}


function asDollars($value) {
return number_format($value, 0);
}


function wooc_extra_register_fields() {?>

        <div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput register_5" data="nombres">
            <label>
                <img src="<?php echo get_template_directory_uri(); ?>/img/avatar_r.png">
                Nombres
            </label>
            <input type="text" class="input-text" name="billing_first_name" id="reg_billing_first_name" value="<?php if ( ! empty( $_POST['billing_first_name'] ) ) esc_attr_e( $_POST['billing_first_name'] ); ?>" placeholder="Ingresa tus nombres"/>
        </div>
        <div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput register_5" data="apellidos">
            <label>
                <img src="<?php echo get_template_directory_uri(); ?>/img/avatar_r.png">
                Apellidos
            </label>
            <input type="text" class="input-text" name="billing_last_name" id="reg_billing_last_name" value="<?php if ( ! empty( $_POST['billing_last_name'] ) ) esc_attr_e( $_POST['billing_last_name'] ); ?>" placeholder="Ingresa tus apellidos"/>
        </div>
        <!-- especiales e inutiles init -->
        <div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput register_5" data="genero">
            <label>
                <img src="<?php echo get_template_directory_uri(); ?>/img/genero.png">
                GENERO
            </label>
            <select name="user_genero">
                <option value="masculino">Masculino</option>
                <option value="femenimo">Femenino</option>
                <option value="no-especifico">LGTBQ+</option>
            </select>
        </div>
        <div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput register_5" data="cumple">
            <label>
                <img src="<?php echo get_template_directory_uri(); ?>/img/cake.png">
                CUMPLEAÑOS
            </label>
            <input type="text" class="input-text" name="user_birthdate" id="user_birthdate" value="<?php esc_attr_e( $_POST['user_birthdate'] ); ?>" placeholder="Ingresa tu cumpleaños"/>
        </div>
        <!-- especiales e inutiles end -->
        <div class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide flexInput register_5" data="celular">
            <label>
                <img src="<?php echo get_template_directory_uri(); ?>/img/mobile-phone.png">
                CELULAR
            </label>
            <input type="text" class="input-text" name="billing_phone" id="reg_billing_phone" value="<?php esc_attr_e( $_POST['billing_phone'] ); ?>" placeholder="Ingresa tu teléfono"/>
        </div>

        

       <?php
 }
add_action( 'woocommerce_register_form_start', 'wooc_extra_register_fields' );
function wooc_validate_extra_register_fields( $username, $email, $validation_errors ) {
    if ( isset( $_POST['billing_first_name'] ) && empty( $_POST['billing_first_name'] ) ) {
             $validation_errors->add( 'billing_first_name_error', __( '<strong>Error</strong>: Los nombres son necesarios', 'woocommerce' ) );
    }
    if ( isset( $_POST['billing_last_name'] ) && empty( $_POST['billing_last_name'] ) ) {
             $validation_errors->add( 'billing_last_name_error', __( '<strong>Error</strong>: Los apellidos son necesarios.', 'woocommerce' ) );
    }
    if ( isset( $_POST['billing_phone'] ) && empty( $_POST['billing_phone'] ) ) {
        $validation_errors->add( 'billing_phone_error', __( '<strong>Error</strong>: El celular es necesario.', 'woocommerce' ) );
    }
    if ( isset( $_POST['user_birthdate'] ) && empty( $_POST['user_birthdate'] ) ) {
        $validation_errors->add( 'user_birthdate_error', __( '<strong>Error</strong>: Increiblemente necesitamos su cumpleaños.', 'woocommerce' ) );
    }
     if ( isset( $_POST['tipo_documento'] ) && empty( $_POST['user_birthdate'] ) ) {
        $validation_errors->add( 'tipo_documento_error', __( '<strong>Error</strong>: Necesitamos tu tipo de documento.', 'woocommerce' ) );
    }
    return $validation_errors;
}
add_action( 'woocommerce_register_post', 'wooc_validate_extra_register_fields', 10, 3 );

function wooc_save_extra_register_fields( $customer_id ) {
    if ( isset( $_POST['billing_phone'] ) ) {
        update_user_meta( $customer_id, 'billing_phone', sanitize_text_field( $_POST['billing_phone'] ) );
    }
    if ( isset( $_POST['billing_first_name'] ) ) {
        //First name field which is by default
        update_user_meta( $customer_id, 'first_name', sanitize_text_field( $_POST['billing_first_name'] ) );
        // First name field which is used in WooCommerce
        update_user_meta( $customer_id, 'billing_first_name', sanitize_text_field( $_POST['billing_first_name'] ) );
    }
    if ( isset( $_POST['billing_last_name'] ) ) {
        // Last name field which is by default
        update_user_meta( $customer_id, 'last_name', sanitize_text_field( $_POST['billing_last_name'] ) );
        // Last name field which is used in WooCommerce
        update_user_meta( $customer_id, 'billing_last_name', sanitize_text_field( $_POST['billing_last_name'] ) );
    }
    if ( isset( $_POST['user_genero'] ) ) {
        update_field( 'user_genero', $_POST['user_genero'], 'user_'.$customer_id );
    }
    if ( isset( $_POST['user_birthdate'] ) ) {
        update_field( 'user_birthdate', $_POST['user_birthdate'], 'user_'.$customer_id );
    }
    if ( isset( $_POST['tipo_documento'] ) ) {
        update_field( 'tipo_documento', $_POST['tipo_documento'], 'user_'.$customer_id );
    }
}
add_action( 'woocommerce_created_customer', 'wooc_save_extra_register_fields' );


function save_new_paramaters( $user_id ) {
    // For Favorite color
    if( isset( $_POST['user_genero'] ) ) {        
        update_field( 'user_genero', $_POST['user_genero'], 'user_'.$user_id );
    }
    if( isset( $_POST['user_birthdate'] ) ) {        
        update_field( 'user_birthdate', $_POST['user_birthdate'], 'user_'.$user_id );
    }
    if( isset( $_POST['estilos_preferidos'] ) ) {        
        update_field( 'estilos_preferidos', $_POST['estilos_preferidos'], 'user_'.$user_id );
    }
    if( isset( $_POST['tienes_moto'] ) ) {        
        update_field( 'tienes_moto', $_POST['tienes_moto'], 'user_'.$user_id );
    }
    if( isset( $_POST['redes_sociales'] ) ) {        
        update_field( 'redes_sociales', $_POST['redes_sociales'], 'user_'.$user_id );
    }
    if ( isset( $_POST['billing_phone'] ) ) {
        update_user_meta( $user_id, 'billing_phone', sanitize_text_field( $_POST['billing_phone'] ) );
    }    
}
add_action( 'woocommerce_save_account_details', 'save_new_paramaters', 12, 1 );


// define the woocommerce_customer_save_address callback 
function action_woocommerce_customer_save_address( $user_id, $load_address ) { 
    if ($load_address === 'shipping') {
        if( isset( $_POST['ruc'] ) ) {        
            update_field( 'ruc', $_POST['ruc'], 'user_'.$user_id );
        }
        if( isset( $_POST['razon_social'] ) ) {        
            update_field( 'razon_social', $_POST['razon_social'], 'user_'.$user_id );
        }
    }
    if ($load_address === 'billing') {
        $tipo = $_POST['billing_tipo_direccion'];
        $address_1 = $_POST['billing_address_1'];
        $lote = $_POST['billing_address_lote'];
        $dpto = $_POST['billing_address_dpto'];
        $urbanizacion = $_POST['billing_urbanizacion'];
        $provincia = $_POST['billing_provincia'];
        $state = $_POST['billing_state'];
        $city = $_POST['billing_city'];
        $address_2 = $_POST['billing_address_2'];

        $value = '<h4 
                data-title="'.$tipo.'" 
                data-direction="'.$address_1.'" 
                data-reference="'.$address_2.'" 
                data-lote="'.$lote.'" 
                data-dpto="'.$dpto.'" 
                data-urb="'.$urbanizacion.'" 
                data-dep="'.$state.'" 
                data-prov="'.$provincia.'" 
                data-city="'.$city.'">'.$tipo.'</h4>
                <ul>
                <li>Dirección: '.$address_1.' '.$lote.' '.$dpto.' - '.$urbanizacion.'</li>
                <li>Referencia '.$address_2.'</li>
                <li>Departamento: '.$state.'</li>
                <li>Provincia: '.$provincia.'</li><li>Distrito: '.$city.'</li></ul>';

        if ($tipo == 'casa') {
            update_field( 'direccion_casa', $value, 'user_'.$user_id );
        } 
        if ($tipo == 'trabajo') {
            update_field( 'direccion_trabajo', $value, 'user_'.$user_id );
        } 
        if ($tipo == 'almacen') {
            update_field( 'direccion_almacen', $value, 'user_'.$user_id );
        } 
        if ($tipo == 'otros') {
            update_field( 'direccion_otras', $value, 'user_'.$user_id );
        }
    }
}; 
         
// add the action 
add_action( 'woocommerce_customer_save_address', 'action_woocommerce_customer_save_address', 10, 2 ); 

/**
 * Exclude products from a particular category on the shop page
 */
function custom_pre_get_posts_query( $q ) {

    $tax_query = (array) $q->get( 'tax_query' );

    $tax_query[] = array(
       'taxonomy' => 'product_cat',
       'field' => 'slug',
       'terms' => array( 'addon' ),
       'operator' => 'NOT IN'
    );

    $q->set( 'tax_query', $tax_query );

}
add_action( 'woocommerce_product_query', 'custom_pre_get_posts_query' );  

//add prod

function addproducto() {
    $product_id = filter_input(INPUT_GET, 'product_id');
    WC()->cart->add_to_cart( $product_id );
    echo $product_id;
    wp_die();
}
add_action( 'wp_ajax_addproducto', 'addproducto' );
add_action( 'wp_ajax_nopriv_addproducto', 'addproducto' );

//add addfacture

function addfacture() {
    $add_ruc = filter_input(INPUT_GET, 'add_ruc');
    $add_raz_social = filter_input(INPUT_GET, 'add_raz_social');
    $id_user = filter_input(INPUT_GET, 'id_user');

    update_field( 'ruc', $add_ruc, 'user_'.$id_user );
    update_field( 'razon_social', $add_raz_social, 'user_'.$id_user );
    wp_die();
}
add_action( 'wp_ajax_addfacture', 'addfacture' );
add_action( 'wp_ajax_nopriv_addfacture', 'addfacture' );

function removedirection() {
    $tipo = filter_input(INPUT_GET, 'tipo');
    $id_user = filter_input(INPUT_GET, 'id_user');
    $value_core = '';
    if ($tipo == 'casa') {
        update_field( 'direccion_casa', $value_core, 'user_'.$id_user );
    } 
    if ($tipo == 'trabajo') {
        update_field( 'direccion_trabajo', $value_core, 'user_'.$id_user );
    } 
    if ($tipo == 'almacen') {
        update_field( 'direccion_almacen', $value_core, 'user_'.$id_user );
    } 
    if ($tipo == 'otros') {
        update_field( 'direccion_otras', $value_core, 'user_'.$id_user );
    }
    wp_die();
}
add_action( 'wp_ajax_removedirection', 'removedirection' );
add_action( 'wp_ajax_nopriv_removedirection', 'removedirection' );




add_filter('woocommerce_order_button_text','custom_order_button_text',1);

function custom_order_button_text($order_button_text) {
    
    $order_button_text = 'GENERAR COMPRA';
    
    return $order_button_text;
}

function sunatlogin() {
    $username = filter_input(INPUT_GET, 'username'); 
    $url ='https://api.sunat.cloud/ruc/'.$username;
    // Get cURL resource
    $curl = curl_init();
    // Set some options - we are passing in a useragent too here
    curl_setopt_array($curl, [
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_URL => $url,
        CURLOPT_USERAGENT => ''
    ]);
    // Send the request & save response to $resp
    $resp = curl_exec($curl);
    // Close request to clear up some resources
    curl_close($curl);
    wp_send_json( $resp );


    wp_die();
}
add_action( 'wp_ajax_sunatlogin', 'sunatlogin' );
add_action( 'wp_ajax_nopriv_sunatlogin', 'sunatlogin' );

function pippin_get_image_id($image_url) {
    global $wpdb;
    $attachment = $wpdb->get_col($wpdb->prepare("SELECT ID FROM $wpdb->posts WHERE guid='%s';", $image_url )); 
        return $attachment[0]; 
}

function imagen_file_upload() {
    $arr_img_ext = array('image/png', 'image/jpeg', 'image/jpg', 'application/pdf');
    $user_id = $_POST["user"];
    if (in_array($_FILES['file']['type'], $arr_img_ext)) {
        $upload_file = wp_upload_bits($_FILES["file"]["name"], null, file_get_contents($_FILES["file"]["tmp_name"]));
        if (!$upload_file['error']) {
            $attachment = array(
                'post_mime_type' => $_FILES['file']['type'],
                'post_parent' => $user_id,
                'post_title' => preg_replace('/\.[^.]+$/', '', $_FILES["file"]["name"]),
                'post_content' => '',
                'post_status' => 'inherit'
            );
            $attachment_id = wp_insert_attachment( $attachment, $upload_file['file'], $user_id );
            if (!is_wp_error($attachment_id)) {
                require_once(ABSPATH . "wp-admin" . '/includes/image.php');
                $attachment_data = wp_generate_attachment_metadata( $attachment_id, $upload_file['file'] );
                wp_update_attachment_metadata( $attachment_id,  $attachment_data );
                //add thmbnail
                update_field('imagen_perfil', $attachment_id, 'user_'.$user_id );   
                echo get_field('imagen_perfil','user_'.$user_id);
            }
        }
    }    
    wp_die();
}
add_action( 'wp_ajax_imagen_file_upload', 'imagen_file_upload' );
add_action( 'wp_ajax_nopriv_imagen_file_upload', 'imagen_file_upload' );

