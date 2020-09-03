<?php
/**
 * Main class
 *
 * @author YITH
 * @package YITH Woocommerce Compare
 * @version 1.1.4
 */

if ( !defined( 'YITH_WOOCOMPARE' ) ) { exit; } // Exit if accessed directly

if( !class_exists( 'YITH_Woocompare_Frontend' ) ) {
    /**
     * YITH Custom Login Frontend
     *
     * @since 1.0.0
     */
    class YITH_Woocompare_Frontend {
        /**
         * Plugin version
         *
         * @var string
         * @since 1.0.0
         */
        public $version = YITH_WOOCOMPARE_VERSION;

        /**
         * The list of products inside the comparison table
         *
         * @var array
         * @since 1.0.0
         */
        public $products_list = array();

        /**
         * Plugin version
         *
         * @var string
         * @since 1.0.0
         */
        public $template_file = 'compare.php';

        /**
         * Stylesheet file
         * 
         * @var string
         * @since 2.1.0
         */
        public $stylesheet_file = 'compare.css';

        /**
         * The name of cookie name
         *
         * @var string
         * @since 1.0.0
         */
        public $cookie_name = 'yith_woocompare_list';

        /**
         * The action used to view the table comparison
         *
         * @var string
         * @since 1.0.0
         */
        public $action_view = 'yith-woocompare-view-table';

        /**
         * The action used to add the product to compare list
         *
         * @var string
         * @since 1.0.0
         */
        public $action_add = 'yith-woocompare-add-product';

        /**
         * The action used to add the product to compare list
         *
         * @var string
         * @since 1.0.0
         */
        public $action_remove = 'yith-woocompare-remove-product';

        /**
         * The action used to reload the compare list widget
         *
         * @var string
         * @since 1.0.0
         */
        public $action_reload = 'yith-woocompare-reload-product';

        /**
         * The standard fields
         *
         * @var array
         * @since 1.0.0
         */
        public $default_fields = array();

        /**
         * Constructor
         *
         * @return YITH_Woocompare_Frontend
         * @since 1.0.0
         */
        public function __construct() {


            add_action( 'init', array( $this, 'init_variables' ), 1 );
            add_action( 'init', array( $this, 'populate_products_list' ), 10 );

            // Add link or button in the products list or
            if ( get_option( 'yith_woocompare_compare_button_in_product_page', 'yes' ) == 'yes' )  add_action( 'woocommerce_single_product_summary', array( $this, 'add_compare_link' ), 35 );
            if ( get_option( 'yith_woocompare_compare_button_in_products_list', 'no' ) == 'yes' ) add_action( 'woocommerce_after_shop_loop_item', array( $this, 'add_compare_link' ), 20 );
            add_action( 'init', array( $this, 'add_product_to_compare_action' ), 15 );
            add_action( 'init', array( $this, 'remove_product_from_compare_action' ), 15 );
            add_action( 'wp_enqueue_scripts', array( $this, 'enqueue_scripts' ) );
            add_action( 'template_redirect', array( $this, 'compare_table_html' ) );

            // add the shortcode
            add_shortcode( 'yith_compare_button', array( $this, 'compare_button_sc' ) );

            // AJAX
            if( version_compare( WC()->version, '2.4', '>=' ) ){
                add_action( 'wc_ajax_' . $this->action_add, array( $this, 'add_product_to_compare_ajax' ) );
                add_action( 'wc_ajax_' . $this->action_remove, array( $this, 'remove_product_from_compare_ajax' ) );
                add_action( 'wc_ajax_' . $this->action_reload, array( $this, 'reload_widget_list_ajax' ) );
            }
            else {
                add_action( 'wp_ajax_' . $this->action_add, array( $this, 'add_product_to_compare_ajax' ) );
                add_action( 'wp_ajax_' . $this->action_remove, array( $this, 'remove_product_from_compare_ajax' ) );
                add_action( 'wp_ajax_' . $this->action_reload, array( $this, 'reload_widget_list_ajax' ) );
            }
            // no priv
            add_action( 'wp_ajax_nopriv_' . $this->action_add, array( $this, 'add_product_to_compare_ajax' ) );
            add_action( 'wp_ajax_nopriv_' . $this->action_remove, array( $this, 'remove_product_from_compare_ajax' ) );
            add_action( 'wp_ajax_nopriv_' . $this->action_reload, array( $this, 'reload_widget_list_ajax' ) );

            return $this;
        }

        /**
         * Init class variables
         *
         * @since 2.3.4
         * @author Francesco Licandro
         */
        public function init_variables(){
            global $sitepress;

            $lang = isset( $_REQUEST['lang'] ) ? $_REQUEST['lang'] : false;

            if( defined( 'ICL_LANGUAGE_CODE' ) && $lang && isset( $sitepress ) ) {
                $sitepress->switch_lang( $lang, true );
            }

            // set coookiename
            if ( is_multisite() ) $this->cookie_name .= '_' . get_current_blog_id();

            // populate default fields for the comparison table
            $this->default_fields = YITH_Woocompare_Helper::standard_fields();
        }

        /**
         * Populate the compare product list
         */
        public function populate_products_list(){

            global $sitepress;

            /**
             * WPML Support
             */
            $lang = isset( $_REQUEST['lang'] ) ? $_REQUEST['lang'] : false;

            // get cookie val
            $the_list = isset( $_COOKIE[ $this->cookie_name ] ) ? json_decode( $_COOKIE[ $this->cookie_name ] ) : array();

            // switch lang for WPML
            if( defined( 'ICL_LANGUAGE_CODE' ) && $lang && isset( $sitepress ) ) {
                $sitepress->switch_lang( $lang, true );
            }

            foreach( $the_list as $product_id ) {
                if( function_exists( 'wpml_object_id_filter' ) ) {
                    $product_id_translated = wpml_object_id_filter( $product_id, 'product', false );
                    // get all product of current lang
                    if ( $product_id_translated !== $product_id ) {
                        continue;
                    }
                }

                // check for deleted|private products
                $product = wc_get_product( $product_id );
                if( ! $product || yit_get_prop( $product, 'post_status' ) !== 'publish' ) {
                    continue;
                }

                $this->products_list[] = $product_id;
            }

            do_action( 'yith_woocompare_after_populate_product_list', $this->products_list );
        }

        /**
         * Enqueue the scripts and styles in the page
         */
        public function enqueue_scripts() {

            // scripts
            $min = ! ( defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ) ? '.min' : '';
            wp_register_script( 'yith-woocompare-main', YITH_WOOCOMPARE_ASSETS_URL . '/js/woocompare' . $min .'.js', array('jquery'), $this->version, true );

            // enqueue and add localize
            wp_enqueue_script( 'yith-woocompare-main' );

            // localize script args
            $args = apply_filters( 'yith_woocompare_main_script_localize_array', array(
                'ajaxurl'   => version_compare( WC()->version, '2.4', '>=' ) ? WC_AJAX::get_endpoint( "%%endpoint%%" ) : admin_url( 'admin-ajax.php', 'relative' ),
                'actionadd' => $this->action_add,
                'actionremove' => $this->action_remove,
                'actionview' => $this->action_view,
                'actionreload' => $this->action_reload,
                'added_label' => apply_filters( 'yith_woocompare_compare_added_label', __( 'Added', 'yith-woocommerce-compare' ) ),
                'table_title' => apply_filters( 'yith_woocompare_compare_table_title',__( 'Product Comparison', 'yith-woocommerce-compare' ) ),
                'auto_open' => get_option( 'yith_woocompare_auto_open', 'yes' ),
                'loader'    => YITH_WOOCOMPARE_ASSETS_URL . '/images/loader.gif',
                'button_text' => get_option( 'yith_woocompare_button_text', __( 'Compare', 'yith-woocommerce-compare' ) ),
                'cookie_name' => $this->cookie_name,
                'close_label' => _x( 'Close', 'Label for popup close icon', 'yith-woocommerce-compare' )
            ));

            wp_localize_script( 'yith-woocompare-main', 'yith_woocompare', $args );

            // colorbox
            wp_enqueue_style( 'jquery-colorbox', YITH_WOOCOMPARE_ASSETS_URL . '/css/colorbox.css' );
            wp_enqueue_script( 'jquery-colorbox', YITH_WOOCOMPARE_ASSETS_URL . '/js/jquery.colorbox-min.js', array('jquery'), '1.4.21', true );

            // widget
            if ( is_active_widget( false, false, 'yith-woocompare-widget', true ) && ! is_admin() ) {
                wp_enqueue_style( 'yith-woocompare-widget', YITH_WOOCOMPARE_ASSETS_URL . '/css/widget.css' );
            }
        }

        /**
         * The fields to show in the table
         *
         * @param array $products
         * @return mixed|void
         * @since 1.0.0
         */
        public function fields( $products = array() ) {

            $fields = get_option( 'yith_woocompare_fields', array() );

            foreach ( $fields as $field => $show ) {
                if ( $show ) {
                    if ( isset( $this->default_fields[$field] ) ) {
                        $fields[$field] = $this->default_fields[$field];
                    }
                    else {
                        if ( taxonomy_exists( $field ) ) {
                            $fields[$field] = wc_attribute_label( $field );
                        }
                    }
                }
                else {
                    unset( $fields[$field] );
                }
            }

            return apply_filters( 'yith_woocompare_filter_table_fields', $fields, $products );
        }

        /**
         * Render the maintenance page
         *
         */
        public function compare_table_html() {

            if ( ( ! defined('DOING_AJAX') || ! DOING_AJAX ) && ( ! isset( $_REQUEST['action'] ) || $_REQUEST['action'] != $this->action_view ) ) return;

            // check if is add to cart
            if( isset( $_REQUEST['add-to-cart'] ) ) {
                $product_id = intval( $_REQUEST['add-to-cart'] );

                wp_redirect( get_permalink( $product_id ) );
                exit;
            }

            global $woocommerce, $sitepress;

            /**
             * WPML Suppot:  Localize Ajax Call
             */
            $lang = isset( $_REQUEST['lang'] ) ? $_REQUEST['lang'] : false;

            if( defined( 'ICL_LANGUAGE_CODE' ) && $lang && isset( $sitepress ) ) {
                $sitepress->switch_lang( $lang, true );
            }

            $args = $this->_vars();
            $args['fixed']  = false;
            $args['iframe'] = 'yes';

            //extract args
            extract( $args );

            // remove all styles from compare template
            add_action('wp_print_styles', array( $this, 'remove_all_styles' ), 100);

            // remove admin bar
            remove_action( 'wp_footer', 'wp_admin_bar_render', 1000 );
            remove_action( 'wp_head', '_admin_bar_bump_cb' );

            // remove filters before render compare popup
            add_action( 'wp_enqueue_scripts', array( $this, 'actions_before_load_popup' ), 99 );

            $plugin_path   = YITH_WOOCOMPARE_TEMPLATE_PATH . '/' . $this->template_file;

            if ( defined('WC_TEMPLATE_PATH') ) {

                $template_path = get_template_directory() . '/' . WC_TEMPLATE_PATH . $this->template_file;
                $child_path    = get_stylesheet_directory() . '/' . WC_TEMPLATE_PATH . $this->template_file;
            }
            else {
                $template_path = get_template_directory() . '/' . $woocommerce->template_url . $this->template_file;
                $child_path    = get_stylesheet_directory() . '/' . $woocommerce->template_url . $this->template_file;
            }

            foreach ( array( 'child_path', 'template_path', 'plugin_path' ) as $var ) {
                if ( file_exists( ${$var} ) ) {
                    include ${$var};
                    exit();
                }
            }
        }

        /**
         * Return the array with all products and all attributes values
         *
         * @param mixed $products
         * @return array The complete list of products with all attributes value
         */
        public function get_products_list( $products = array() ) {
            $list = array();

            empty( $products ) && $products = $this->products_list;
            $products = apply_filters( 'yith_woocompare_exclude_products_from_list', $products );

            $fields = $this->fields( $products );

            foreach ( $products as $product_id ) {

                /**
                 * @type object $product /WC_Product
                 */
                $product = $this->wc_get_product( $product_id );

	            if ( ! $product )
		            continue;

                $product->fields = array();

                // custom attributes
                foreach ( $fields as $field => $name )  {

                    switch( $field ) {
                        case 'title':
                            $product->fields[$field] = $product->get_title();
                            break;
                        case 'price':
                            $product->fields[$field] = $product->get_price_html();
                            break;
                        case 'image':
                            $product->fields[$field] = intval( get_post_thumbnail_id( $product_id ) );
                            break;
                        case 'description':
                            $description = apply_filters( 'woocommerce_short_description', yit_get_prop( $product, 'post_excerpt' ) );
                            $product->fields[$field] = apply_filters( 'yith_woocompare_products_description', $description );
                            break;
                        case 'stock':
                            $availability = $product->get_availability();
                            if ( empty( $availability['availability'] ) ) {
                                $availability['availability'] = __( 'In stock', 'yith-woocommerce-compare' );
                            }
                            $product->fields[$field] = sprintf( '<span>%s</span>', esc_html( $availability['availability'] ) );
                            break;
                        case 'sku':
                            $sku = $product->get_sku();
                            ! $sku && $sku = '-';
                            $product->fields[$field] = $sku;
                            break;
                        case 'weight':
                            if( $weight = $product->get_weight() ){
                                $weight = wc_format_localized_decimal( $weight ) . ' ' . esc_attr( get_option( 'woocommerce_weight_unit' ) );
                            }
                            else {
                                $weight = '-';
                            }
                            $product->fields[$field] = sprintf( '<span>%s</span>', esc_html( $weight ) );
                            break;
                        case 'dimensions':
                            $dimensions = function_exists( 'wc_format_dimensions' ) ? wc_format_dimensions( $product->get_dimensions(false) ) : $product->get_dimensions();
                            ! $dimensions && $dimensions = '-';
                            
                            $product->fields[$field] = sprintf( '<span>%s</span>', esc_html( $dimensions ) );
                            break;
                        default:
                            if ( taxonomy_exists( $field ) ) {
                                $product->fields[$field] = array();
                                $terms = get_the_terms( $product_id, $field );
                                if ( ! empty( $terms ) ) {
                                    foreach ( $terms as $term ) {
                                        $term = sanitize_term( $term, $field );
                                        $product->fields[$field][] = $term->name;
                                    }
                                }
                                $product->fields[$field] = implode( ', ', $product->fields[$field] );
                            }
                            else {
                                do_action_ref_array( 'yith_woocompare_field_' . $field, array( $product, &$product->fields ) );
                            }
                            break;
                    }
                }

                $list[ $product_id ] = $product;
            }

            return $list;
        }

        /**
         * The URL of product comparison table
         *
         * @param bool | int $product_id
         * @return string The url to add the product in the comparison table
         */
        public function view_table_url( $product_id = false ) {
	        $url_args = array(
		        'action'    => $this->action_view,
		        'iframe'    => 'yes'
	        );

            $lang = defined( 'ICL_LANGUAGE_CODE' ) ? ICL_LANGUAGE_CODE : false;
            if( $lang ) {
                $url_args['lang'] = $lang;
            }
            // fix by WPML
            return apply_filters( 'yith_woocompare_view_table_url', esc_url_raw( add_query_arg( $url_args, remove_query_arg( 'wc-ajax' ) ) ), $product_id );
        }

        /**
         * The URL to add the product into the comparison table
         *
         * @param int $product_id ID of the product to add
         * @return string The url to add the product in the comparison table
         */
        public function add_product_url( $product_id ) {
            $url_args = array(
                'action' => $this->action_add,
                'id' => $product_id
            );

            $lang = defined( 'ICL_LANGUAGE_CODE' ) ? ICL_LANGUAGE_CODE : false;
            if( $lang ) {
                $url_args['lang'] = $lang;
            }

            return apply_filters( 'yith_woocompare_add_product_url', esc_url_raw( add_query_arg( $url_args, site_url() ) ), $this->action_add );
        }

        /**
         * The URL to remove the product into the comparison table
         *
         * @param string $product_id The ID of the product to remove
         * @return string The url to remove the product in the comparison table
         */
        public function remove_product_url( $product_id ) {
            $url_args = array(
                'action' => $this->action_remove,
                'id' => $product_id
            );
            return apply_filters( 'yith_woocompare_remove_product_url', esc_url_raw( add_query_arg( $url_args, site_url() ) ), $this->action_remove );
        }

        /**
         *  Add the link to compare
         */
        public function add_compare_link( $product_id = false, $args = array() ) {
            extract( $args );

            if ( ! $product_id ) {
                global $product;
                $product_id = ! is_null( $product ) ? yit_get_prop( $product, 'id', true ) : 0;
            }

            // return if product doesn't exist
            if ( empty( $product_id ) || apply_filters( 'yith_woocompare_remove_compare_link_by_cat', false, $product_id ) )
	            return;

            $is_button = ! isset( $button_or_link ) || ! $button_or_link ? get_option( 'yith_woocompare_is_button', 'button' ) : $button_or_link;

            if ( ! isset( $button_text ) || $button_text == 'default' ) {
                $button_text = get_option( 'yith_woocompare_button_text', __( 'Compare', 'yith-woocommerce-compare' ) );
                do_action ( 'wpml_register_single_string', 'Plugins', 'plugin_yit_compare_button_text', $button_text );
                $button_text = apply_filters( 'wpml_translate_single_string', $button_text, 'Plugins', 'plugin_yit_compare_button_text' );
            }

            printf( '<a href="%s" class="%s" data-product_id="%d" rel="nofollow">%s</a>', $this->add_product_url( $product_id ), 'compare' . ( $is_button == 'button' ? ' button' : '' ), $product_id, $button_text ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
        }

        /**
         * Return the url of stylesheet position
         */
        public function stylesheet_url() {
            global $woocommerce;

            $filename = $this->stylesheet_file;
            
            $plugin_path   = array( 'path' => YITH_WOOCOMPARE_DIR . '/assets/css/style.css', 'url' => YITH_WOOCOMPARE_ASSETS_URL . '/css/style.css' );

            if ( defined('WC_TEMPLATE_PATH') ) {
                $template_path = array( 'path' => get_template_directory() . '/' . WC_TEMPLATE_PATH . $filename,         'url' => get_template_directory_uri() . '/' . WC_TEMPLATE_PATH . $filename );
                $child_path    = array( 'path' => get_stylesheet_directory() . '/' . WC_TEMPLATE_PATH . $filename,       'url' => get_stylesheet_directory_uri() . '/' . WC_TEMPLATE_PATH . $filename );
            }
            else {
                $template_path = array( 'path' => get_template_directory() . '/' . $woocommerce->template_url . $filename,         'url' => get_template_directory_uri() . '/' . $woocommerce->template_url . $filename );
                $child_path    = array( 'path' => get_stylesheet_directory() . '/' . $woocommerce->template_url . $filename,       'url' => get_stylesheet_directory_uri() . '/' . $woocommerce->template_url . $filename );
            }

            foreach ( array( 'child_path', 'template_path', 'plugin_path' ) as $var ) {
                if ( file_exists( ${$var}['path'] ) ) {
                    return ${$var}['url'];
                }
            }
        }


        /**
         * Generate template vars
         *
         * @return array
         * @since 1.0.0
         * @access protected
         */
        protected function _vars() {
            $vars = array(
                'products'           => $this->get_products_list(),
                'fields'             => $this->fields(),
				'repeat_price'       => get_option( 'yith_woocompare_price_end', 'yes' ),
                'repeat_add_to_cart' => get_option( 'yith_woocompare_add_to_cart_end', 'no' ),
            );

            return $vars;
        }

        /**
         * The action called by the query string
         */
        public function add_product_to_compare_action() {
            if ( defined( 'DOING_AJAX' ) && DOING_AJAX ||  ! isset( $_REQUEST['id'] ) || ! isset( $_REQUEST['action'] ) || $_REQUEST['action'] != $this->action_add ) {
                return;
            }

	        $product_id = intval( $_REQUEST['id'] );
            $product = $this->wc_get_product( $product_id );

	        // don't add the product if doesn't exist
	        if ( isset( $product->id ) && ! in_array( $product_id, $this->products_list ) ) {
		        $this->add_product_to_compare( $product_id );
	        }

            wp_redirect( esc_url( remove_query_arg( array( 'id', 'action' ) ) ) );
            exit();
        }

        /**
         * The action called by AJAX
         */
        public function add_product_to_compare_ajax() {

            if( ! isset( $_REQUEST['id'] ) || ! isset( $_REQUEST['action'] ) || $_REQUEST['action'] != $this->action_add ){
                die();
            }

		    $product_id = intval( $_REQUEST['id'] );
		    $product = $this->wc_get_product( $product_id );

	        // don't add the product if doesn't exist
	        if ( isset( $product->id ) && ! in_array( $product_id, $this->products_list ) ) {
		        $this->add_product_to_compare( $product_id );
	        }

		    do_action( 'yith_woocompare_add_product_action_ajax' );

		    $json = apply_filters( 'yith_woocompare_add_product_action_json', array(
                'table_url'     => $this->view_table_url( $product_id ),
			    'widget_table'  => $this->list_products_html(),
		     ) );

            echo json_encode( $json );
            die();
        }

        /**
         * Add a product in the products comparison table
         *
         * @param int $product_id product ID to add in the comparison table
         */
        public function add_product_to_compare( $product_id ) {

            $this->products_list[] = $product_id;
            setcookie( $this->cookie_name, json_encode( $this->products_list ), 0, COOKIEPATH, COOKIE_DOMAIN, false, false );

	        do_action( 'yith_woocompare_after_add_product', $product_id );
        }

        /**
         * The action called by the query string
         */
        public function remove_product_from_compare_action() {
            if ( defined( 'DOING_AJAX' ) && DOING_AJAX || ! isset( $_REQUEST['action'] ) || $_REQUEST['action'] != $this->action_remove ) {
                return;
            }

            $this->remove_product_from_compare( $_REQUEST['id'] );

            // redirect
            $redirect = esc_url( remove_query_arg( array( 'id', 'action' ) ) );

	        if ( isset( $_REQUEST['redirect'] ) && $_REQUEST['redirect'] == 'view' )
	            $redirect = esc_url( remove_query_arg( 'redirect', add_query_arg( 'action', $this->action_view, $redirect ) ) );

	        wp_redirect( $redirect );
            exit();
        }

        /**
         * The action called by AJAX
         */
        public function remove_product_from_compare_ajax() {

            if ( ! isset( $_REQUEST['id'] ) || ! isset( $_REQUEST['action'] ) || $_REQUEST['action'] != $this->action_remove ){
                die();
            }

            $lang = isset( $_REQUEST['lang'] ) ? $_REQUEST['lang'] : false;

            $this->remove_product_from_compare( $_REQUEST['id'] );

	        do_action( 'yith_woocompare_remove_product_action_ajax' );

            header('Content-Type: text/html; charset=utf-8');

            if ( isset( $_REQUEST['responseType'] ) && $_REQUEST['responseType'] == 'product_list' ) {
                echo wp_kses_post( $this->list_products_html( $lang ) );
            } else {
                $this->compare_table_html();
            }

            die();
        }

        /**
         * Return the list of widget table, used in AJAX
         */
        public function reload_widget_list_ajax() {

            if ( ! isset( $_REQUEST['action'] ) || $_REQUEST['action'] != $this->action_reload ){
                die();
            }

            $lang = isset( $_REQUEST['lang'] ) ? $_REQUEST['lang'] : false;

            echo wp_kses_post( $this->list_products_html( $lang ) );
            die();
        }

        /**
         * The list of products as HTML list
         */
        public function list_products_html( $lang = false ) {
            ob_start();

            /**
             * WPML Suppot:  Localize Ajax Call
             */
            global $sitepress;

            if( defined( 'ICL_LANGUAGE_CODE' ) && $lang && isset( $sitepress )) {
                $sitepress->switch_lang( $lang, true );
            }

            if ( empty( $this->products_list ) ) {
                echo '<li class="list_empty">' . esc_html__( 'No products to compare', 'yith-woocommerce-compare' ) . '</li>';
                return ob_get_clean();
            }

            foreach ( $this->products_list as $product_id ) {
                /**
                 * @type object $product /WC_Product
                 */
                $product = $this->wc_get_product( $product_id );
                if ( ! $product )
	                continue;
                ?>
                <li>
                    <?php
                    $cat = get_the_terms($product_id,'product_cat', array( 'order' => 'DESC'));
                    $brand;
                    if ($cat) {             
                        foreach ($cat as $ta) {                             
                            $idmarca = $ta->term_id;                            
                            if ($ta->parent == 15) {                                        
                            //if ($ta->parent == 67) {                                        
                                $brand = $ta->name;      
                            }                   
                        }
                    }
                    ?>
                    <a href="<?php echo esc_attr( $this->remove_product_url( $product_id ) ); ?>" data-product_id="<?php echo esc_attr( $product_id ); ?>" class="remove" title="<?php esc_html_e( 'Remove', 'yith-woocommerce-compare' ) ?>"></a>
                    <div class="content-flex">
                        <div class="content_close">
                            <img src="<?php echo get_the_post_thumbnail_url($product_id);?>"> 
                            <p><?php echo $brand; ?></p>
                            <h2><a class="title" href="<?php echo esc_attr( get_permalink( $product_id ) ); ?>"><?php echo esc_html( $product->get_title() ) ?></a></h2>                        
                        </div>
                        <div class="decoration">
                            <svg xmlns="http://www.w3.org/2000/svg" width="82" height="82.108" viewBox="0 0 82 82.108"><defs><style>.a{fill:#c12020;}.b{fill:#fb5252;}.c{fill:#fff;}</style></defs><g transform="translate(-0.301 0)"><path class="a" d="M73.352,74.969c-12.564,10.256-51.795,10.256-64.1,0-12.564-10.256-11.282-54.1,0-65.641s52.82-11.538,64.1,0S85.916,64.713,73.352,74.969Z" transform="translate(0 -0.553)"/><path class="b" d="M41.728,56.468C30.446,65.442,17.882,70.058,6.087,70.314-2.631,55.442-.836,19.289,9.421,8.776c9.231-9.487,38.2-11.282,54.872-5.385C68.395,20.314,59.933,41.853,41.728,56.468Z" transform="translate(-0.171 0)"/><g transform="translate(15.66 26.981)"><path class="c" d="M99.6,169.024l7.179-17.949H113.7L102.416,179.28H97.031l-11.538-28.2h6.923Z" transform="translate(-85.493 -150.819)"/><path class="c" d="M253.5,155.551a3.166,3.166,0,0,0-1.026,2.051,2.332,2.332,0,0,0,1.026,2.051,26.432,26.432,0,0,0,5.128,1.795c2.564.769,4.872,1.538,6.154,3.077a7.16,7.16,0,0,1,2.308,5.641,7.8,7.8,0,0,1-2.82,6.154,11.217,11.217,0,0,1-7.436,2.308,17.288,17.288,0,0,1-12.051-4.872l3.846-4.615c3.077,2.564,5.9,4.1,8.461,4.1a4.6,4.6,0,0,0,2.82-.769,2.564,2.564,0,0,0,0-4.1,13.708,13.708,0,0,0-4.1-1.538,17.155,17.155,0,0,1-7.179-3.077,7.357,7.357,0,0,1-2.308-5.9,7.8,7.8,0,0,1,2.82-6.154c1.795-1.538,4.359-2.051,7.179-2.051a14.615,14.615,0,0,1,5.641,1.026,15.2,15.2,0,0,1,4.872,2.82l-3.077,4.615c-2.564-1.795-4.872-2.82-7.692-2.82A2.308,2.308,0,0,0,253.5,155.551Z" transform="translate(-216.065 -149.654)"/></g></g></svg>
                        </div>
                    </div>                    
                </li>
            <?php
            }

            $return = ob_get_clean();

            return apply_filters( 'yith_woocompare_widget_products_html', $return, $this->products_list, $this );
        }

        /**
         * Remove a product from the comparison table
         *
         * @param $product_id The product ID to remove from the comparison table
         */
        public function remove_product_from_compare( $product_id ) {

            if( $product_id == 'all' ) {
                $this->products_list = array();
            }
            else {
                foreach ( $this->products_list as $k => $id ) {
                    if ( intval( $product_id ) == $id ) {
                        unset( $this->products_list[ $k ] );
                    }
                }
            }

            setcookie( $this->cookie_name, json_encode( array_values( $this->products_list ) ), 0, COOKIEPATH, COOKIE_DOMAIN, false, false );

	        do_action( 'yith_woocompare_after_remove_product', $product_id );
        }

        /**
         * Remove all styles from the compare template
         */
        public function remove_all_styles() {
            global $wp_styles;

            $wp_styles->queue = array_filter( $wp_styles->queue, function( $v ){
            	return strpos( $v, 'yith-proteo' ) !== false;
			});
        }

        /**
         * Show the html for the shortcode
         */
        public function compare_button_sc( $atts, $content = null ) {
            $atts = shortcode_atts(array(
                'product' => false,
                'type' => 'default',
                'container' => 'yes'
            ), $atts);

            $product_id = 0;

            /**
             * Retrieve the product ID in these steps:
             * - If "product" attribute is not set, get the product ID of current product loop
             * - If "product" contains ID, post slug or post title
             */
            if ( ! $atts['product'] ) {
                global $product;
                $product_id = ! is_null( $product ) ? yit_get_prop( $product, 'id', true ) : 0;
            } else {
                global $wpdb;
                $product = $wpdb->get_row( $wpdb->prepare( "SELECT ID FROM $wpdb->posts WHERE ID = %d OR post_name = %s OR post_title = %s LIMIT 1", $atts['product'], $atts['product'], $atts['product'] ) );
                if ( ! empty( $product ) ) {
                    $product_id = $product->ID;
                }
            }

            // make sure to get always the product id of current language
            if( function_exists( 'wpml_object_id_filter' ) ) {
                $product_id = wpml_object_id_filter( $product_id, 'product', false );
            }

            // if product ID is 0, maybe the product doesn't exists or is wrong.. in this case, doesn't show the button
            if ( empty( $product_id ) )
                return '';

            ob_start();
            if ( $atts['container'] == 'yes' ) echo '<div class="woocommerce product compare-button">';
            $this->add_compare_link( $product_id, array(
                'button_or_link' => ( $atts['type'] == 'default' ? false : $atts['type'] ),
                'button_text' => empty( $content ) ? 'default' : $content
            ) );
            if ( $atts['container'] == 'yes' ) echo '</div>';
            return ob_get_clean();
        }

        public function wc_get_product( $product_id ){
            $wc_get_product = function_exists( 'wc_get_product' ) ? 'wc_get_product' : 'get_product';
            return $wc_get_product( $product_id );
        }
        
        
        /**
         * Do action before loads compare popup
         * 
         * @since 2.1.1
         * @author Francesco Licandro
         */
        public function actions_before_load_popup(){
            // removes WooCommerce Product Filter scripts
            wp_dequeue_script( 'prdctfltr-main-js' );
            wp_dequeue_script( 'prdctfltr-history' );
            wp_dequeue_script( 'prdctfltr-ionrange-js' );
            wp_dequeue_script( 'prdctfltr-isotope-js' );
            wp_dequeue_script( 'prdctfltr-scrollbar-js' );
        }
    }
}