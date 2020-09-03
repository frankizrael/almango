<?php
/**
 * Woocommerce Compare page
 *
 * @author YITH
 * @package YITH Woocommerce Compare
 * @version 2.3.2
 */

// remove the style of woocommerce
if (defined('WOOCOMMERCE_USE_CSS') && WOOCOMMERCE_USE_CSS) wp_dequeue_style('woocommerce_frontend_styles');

$is_iframe = (bool)(isset($_REQUEST['iframe']) && $_REQUEST['iframe']);

wp_enqueue_script('jquery-imagesloaded', YITH_WOOCOMPARE_ASSETS_URL . '/js/imagesloaded.pkgd.min.js', array('jquery'), '3.1.8', true);
wp_enqueue_script('jquery-fixedheadertable', YITH_WOOCOMPARE_ASSETS_URL . '/js/jquery.dataTables.min.js', array('jquery'), '1.10.19', true);
wp_enqueue_script('jquery-fixedcolumns', YITH_WOOCOMPARE_ASSETS_URL . '/js/FixedColumns.min.js', array('jquery', 'jquery-fixedheadertable'), '3.2.6', true);

$widths = array();
foreach ($products as $product) $widths[] = '{ "sWidth": "205px", resizeable:true }';

$table_text = get_option('yith_woocompare_table_text', __('Compare products', 'yith-woocommerce-compare'));
do_action('wpml_register_single_string', 'Plugins', 'plugin_yit_compare_table_text', $table_text);
$localized_table_text = apply_filters('wpml_translate_single_string', $table_text, 'Plugins', 'plugin_yit_compare_table_text');

?><!DOCTYPE html>
<!--[if IE 6]>
<html id="ie6" class="ie"<?php language_attributes() ?>>
<![endif]-->
<!--[if IE 7]>
<html id="ie7" class="ie"<?php language_attributes() ?>>
<![endif]-->
<!--[if IE 8]>
<html id="ie8" class="ie"<?php language_attributes() ?>>
<![endif]-->
<!--[if IE 9]>
<html id="ie9" class="ie"<?php language_attributes() ?>>
<![endif]-->
<!--[if gt IE 9]>
<html class="ie"<?php language_attributes() ?>>
<![endif]-->
<!--[if !IE]>
<html <?php language_attributes() ?>>
<![endif]-->

<!-- START HEAD -->
<head>
    <meta charset="<?php bloginfo('charset'); ?>"/>
    <meta name="viewport" content="width=device-width"/>
    <title><?php esc_html_e('Product Comparison', 'yith-woocommerce-compare') ?></title>
    <link rel="profile" href="http://gmpg.org/xfn/11"/>

    <?php wp_head() ?>

    <?php do_action('yith_woocompare_popup_head') ?>

    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"/>
    <link rel="stylesheet" href="<?php echo esc_attr(YITH_WOOCOMPARE_URL) ?>assets/css/colorbox.css"/>
    <link rel="stylesheet" href="<?php echo esc_attr(YITH_WOOCOMPARE_URL) ?>assets/css/jquery.dataTables.css"/>
    <link rel="stylesheet" href="<?php echo esc_attr($this->stylesheet_url()); ?>" type="text/css"/>

    <style type="text/css">
        body.loading {
            background: url("<?php echo esc_attr( YITH_WOOCOMPARE_URL ) ?>assets/images/colorbox/loading.gif") no-repeat scroll center center transparent;
        }
        .compareWith__title h2 {
            color: #082630;
            font-size: 25px;
            margin-bottom: 5px;
            margin-top: 10px;
        }
        .compareWith__flex_ins {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            justify-content: space-between;
        }
        .buttons_inside {
            display: flex;
            align-items: center;
        }
        .buttons_inside__it {
            background: #FFFFFF 0% 0% no-repeat padding-box;
            box-shadow: 0px 3px 6px #000000;
            border-radius: 24px;
            display: flex;
            align-items: center;
            padding: 5px 20px;
            margin-right: 25px;
            height: 70px;
        }
        a.btn img {
            margin-left: 15px;
        }
        a.btn {
            background: #6245FB;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 25px;
            display: flex;
            align-items: center;
        }
        .lupa_icon {
            position: relative;
            margin-right: 25px;
        }
        .lupa_c {
            width: 50px;
        }
        img.lupa_content {
            position: absolute;
            width: 27px;
            right: 4px;
            top: 10px;
        }
        .lupa_text {
            position: relative;
            padding-left: 10px;
        }
        .lupa_text .numb {
            position: absolute;
            font-size: 100px;
            letter-spacing: 0px;
            color: #000000;
            opacity: 0.1;
            left: 0px;
            top: 10px;
        }
        .lupa_text p {
            font-weight: 700;
            color: black;
            font-size: 14px;
        }
        .buttons_inside__it.active {
            background: #FFCB90;
        }
        .vs_icon {
            color: black;
            font-weight: 700;
        }
        table.compare-list tbody th {
            background: transparent;
            font-size: 14px;
            font-weight: 400;
            text-transform: uppercase;
            color: #082630;
            border-top: 0px !important;
            border-right: 0px !important;
        }
        table.dataTable.compare-list tbody td {
            background: transparent;
            border: none;
            border-left: solid 1px #cccccc;
        }
        .colors_s span {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            margin: 0px 5px;
        }
        .colors_s {
            display: flex;
            justify-content: center;
        }
        p.morado {
            color: #6245fb;
        }
        table.compare-list td img {
            border: none;
        }
        table.compare-list td img {
            border: none;
            margin-bottom: 0px;
            display: block;
            margin: auto;
        }
        table.dataTable.compare-list tr.price td del {
            font-size: 18px;
            opacity: 0.4;
        }
        table.dataTable.compare-list tr.price td ins {
            text-decoration: none;
            font-weight: 700;
        }
        table.dataTable.compare-list tr.price td {
            color: black;
            text-decoration: none;
            font-size: 25px;
        }
        table.dataTable.compare-list tr.title td {
            font-size: 35px;
            font-weight: 700;
            color: black;
        }
    </style>
</head>
<!-- END HEAD -->

<?php global $product; ?>

<!-- START BODY -->
<body <?php body_class('woocommerce yith-woocompare-popup') ?>>

<div id="yith-woocompare" class="woocommerce compareWith">
    <div class="compareWith__title">
        <h2>COMPARADOR</h2>
        <p>Busca, elige y compara los modelos que desees y toma la mejor decisión en tu compra.</p>
    </div>    
    <div class="compareWith__flex_ins">
        <div class="compareWith__left">
            <div class="buttons_inside">
                <div class="buttons_inside__it">
                    <div class="lupa_icon">
                        <img src="<?php echo get_template_directory_uri(); ?>/img/lupa_enorme.svg" class="lupa_c">
                        <img src="<?php echo get_template_directory_uri(); ?>/img/lupa_moto.svg" class="lupa_content">
                    </div>
                    <div class="lupa_text">
                        <div class="numb">1</div>
                        <p>Selecciona los modelos</p>
                    </div>                    
                </div>
                <div class="buttons_inside__it active">
                    <div class="vs_icon">
                        <img src="<?php echo get_template_directory_uri(); ?>/img/moto_vs_1.svg" class="vs_moto">
                        <span>vs</span>
                        <img src="<?php echo get_template_directory_uri(); ?>/img/moto_vs_2.svg" class="vs_moto">
                    </div>
                    <div class="lupa_text">
                        <div class="numb">2</div>
                        <p>Selecciona los modelos</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="compareWith__right">
            <a href="javascript:void(0)" class="btn">DESCARGAR <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/pdf.png"></a>
        </div>
    </div>

    <?php do_action('yith_woocompare_before_main_table'); ?>

    <table class="compare-list" cellpadding="0"
           cellspacing="0"<?php if (empty($products)) echo ' style="width:100%"' ?>>
        <thead>
            <tr>
                <th>&nbsp;</th>
                <?php foreach ($products as $product_id => $product) : ?>
                    <td></td>
                <?php endforeach; ?>
            </tr>
        </thead>
        <tfoot>
        <tr>
            <th>&nbsp;</th>
            <?php foreach ($products as $product_id => $product) : ?>
                <td></td>
            <?php endforeach; ?>
        </tr>
        </tfoot>
        <tbody>

        <?php if (empty($products)) : ?>

            <tr class="no-products">
                <td><?php esc_html_e('No products added in the compare table.', 'yith-woocommerce-compare') ?></td>
            </tr>

        <?php else : ?>
            <tr class="remove">
                <th>&nbsp;</th>
                <?php
                $index = 0;
                foreach ($products as $product_id => $product) :
                    $product_class = ($index % 2 == 0 ? 'odd' : 'even') . ' product_' . $product_id ?>
                    <td class="<?php echo esc_attr( $product_class ); ?>">
                        <a href="<?php echo add_query_arg('redirect', 'view', $this->remove_product_url($product_id)); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?>"
                           data-product_id="<?php echo esc_attr( $product_id ); ?>"><?php esc_html_e('Remove', 'yith-woocommerce-compare') ?>
                            <span class="remove">x</span></a>
                    </td>
                    <?php
                    ++$index;
                endforeach;
                ?>
            </tr>

            <?php foreach ($fields as $field => $name) : ?>

                <tr class="<?php echo esc_attr( $field ); ?>">

                    <th>
                       
                    </th>

                    <?php
                    $index = 0;
                    foreach ($products as $product_id => $product) :
                        $product_class = ($index % 2 == 0 ? 'odd' : 'even') . ' product_' . $product_id; ?>
                        <td class="<?php echo esc_attr( $product_class ); ?>"><?php
                            switch ($field) {

                                case 'image':
                                    echo '<div class="image-wrap">' . $product->get_image('yith-woocompare-image')  . '</div>'; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
                                    break;

                                case 'add-to-cart':
                                    woocommerce_template_loop_add_to_cart();
                                    break;

                                default:
                                    echo empty($product->fields[$field]) ? '&nbsp;' : $product->fields[$field]; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
                                    break;
                            }
                            ?>
                        </td>
                        <?php
                        ++$index;
                    endforeach; ?>

                </tr>

            <?php endforeach; ?>


                <tr>
                    <th><h3>DATOS GENERALES</h3></th>
                    <td></td>
                </tr>
                <tr>
                    <th>PAIS DE ORIGEN</th>
                    <td><?php echo get_field('pdf_pais_origen',$product_id); ?></td>
                </tr>
                <tr>
                    <th>PAIS DE FABRICACIÓN</th>
                    <td><?php echo get_field('pdf_pais_fabricacion',$product_id); ?></td>
                </tr>
                <tr>
                    <th>AÑO DE MODELO</th>
                    <td><?php echo get_field('modelo',$product_id); ?></td>
                </tr>
                <tr>
                    <th>TIPO DE CHASIS</th>
                    <td><?php echo get_field('pdf_tipo_chasis',$product_id); ?></td>
                </tr>
                <tr>
                    <th>COLORES DISPONIBLES</th>
                    <td>
                        <div class="colors_s">
                            <?php
                                $colores = get_field('colores',$product_id);
                                if ($colores) {
                                    foreach ($colores as $ce) {
                                ?>
                                <span style="background:<?php echo $ce['color']; ?>"></span>
                            <?php
                                    }
                                }
                            ?>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>POSICIÓN DE MANEJO</th>
                    <td><?php echo get_field('position_moto_desc',$product_id); ?></td>
                </tr>
                <tr>
                    <th>ESTILO</th>
                    <td><?php
                        $cat = get_the_terms($id,'product_cat', array( 'order' => 'DESC'));
                        $a = 0;
                        if ($cat) {             
                            foreach ($cat as $ta) {     
                                if ($ta->term_id != 15 && $ta->term_id != 67){  
                                //if ($ta->term_id != 15 && $ta->term_id != 24){                                        
                                    //if ($ta->parent == 67) {                  
                                    if ($ta->parent != 24) {                    
                            ?>
                            <?php if ($a == 0) {
                                echo $ta->name;
                                $a = 1;
                            } else {
                                echo ', '.$ta->name;
                            }?>
                        <?php
                                    }
                                }
                            }
                        }
                    ?> 
                    </td>
                </tr>
                <tr>
                    <th>NÚMERO DE ASIENTOS</th>
                    <td><?php echo get_field('pdf_num_asientos',$product_id); ?></td>
                </tr>
                <tr>
                    <th><h3>GARANTÍA</h3></th>
                    <td><p class="morado">Lo que ocurra primero</p></td>
                </tr>
                <tr>
                    <th>MESES*</th>
                    <td><?php echo get_field('pdf_garantia_meses',$product_id); ?></td>
                </tr>
                <tr>
                    <th>KILÓMETROS*</th>
                    <td><?php echo get_field('pdf_garantia_kilometros',$product_id); ?></td>
                </tr>
                <tr>
                    <th><h3>RECOMENDACIONES</h3></th>
                    <td></td>
                </tr>
                <tr>
                    <th>MANTENIMIENTO (Km)</th>
                    <td><?php echo get_field('pdf_garantia_mantenimiento',$product_id); ?></td>
                </tr>
                <tr>
                    <th>ACEITE RECOMENDADO</th>
                    <td><?php echo get_field('pdf_aceite',$product_id); ?></td>
                </tr>   
                <tr>
                    <th>ASENTAMIENTO DE MOTOR (Km)</th>
                    <td><?php echo get_field('pdf_asentamiento_motor',$product_id); ?></td>
                </tr>
                <tr>
                    <th><h3>MOTOR Y SISTEMA ELÉCTRICO</h3></th>
                    <td></td>
                </tr>
                <?php
                    $parts = get_field('trans',$product_id);
                    $tipo_motor = $parts[0]['list'][0]['number'].' '.$parts[0]['list'][0]['atrib'];
                    $cilindrada = $parts[0]['list'][1]['number'];
                    $n_cilindros = $parts[0]['list'][2]['number'];
                ?>
                <tr class="pdf_options__content">
                    <th class="title">CILINDRADA</th>
                    <td class="value"><?php echo $cilindrada; ?>cc</tdtd>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">N° DE CILINDROS</th>
                    <td class="value"><?php echo $n_cilindros; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">RATIO DE COMPRENSIÓN</th>
                    <td class="value"><?php echo get_field('pdf_ratio_comprension',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">DÍAMETRO POR CARRERA</th>
                    <td class="value"><?php echo get_field('pdf_diametro_carrera',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">TORQUE NM</th>
                    <td class="value"><?php echo get_field('pdf_torque_nm',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">TORQUE RPM</th>
                    <td class="value"><?php echo get_field('pdf_torque_rpm',$product_id); ?></td>
                </tr>      
                <tr class="pdf_options__content">
                    <th class="title">CABALLOS DE FUERZA</th>
                    <td class="value"><?php echo get_field('pdf_caballos_fuerza',$product_id); ?></td>
                </tr>  
                <tr class="pdf_options__content">
                    <th class="title">TIPO DE MOTOR</th>
                    <td class="value"><?php echo $tipo_motor; ?></td>
                </tr>  
                <tr class="pdf_options__content">
                    <th class="title">ENCENDIDO</th>
                    <td class="value"><?php echo get_field('pdf_encendido',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">REFRIGERACIÓN</th>
                    <td class="value"><?php echo get_field('pdf_refrigeracion',$product_id); ?></td>
                </tr>
                <tr>
                    <th><h3>FAROS Y TABLERO</h3></th>
                    <td></td>
                </tr>
                <?php
                    $parts = get_field('parts',$product_id);
                    if ($parts[0]['list']) {
                        foreach ($parts[0]['list'] as $li) {
                            ?>
                        <tr>
                            <th><?php echo $li['title']; ?></th>
                            <td><?php echo $li['content']; ?> <?php echo $li['atrib_content']; ?></td>
                        </tr>
                            <?php
                        }
                    }
                ?>
                <?php
                    $parts = get_field('parts',$product_id);
                    if ($parts[1]['list']) {
                        foreach ($parts[1]['list'] as $li) {
                            ?>
                        <tr class="pdf_options__content">
                            <th class="title"><?php echo $li['title']; ?></th>
                            <td class="value">SI</td>
                        </tr>
                            <?php
                        }
                    }
                ?>
                <tr>
                    <th><h3>Consumo, rendimiento y transmisión</h3></th>
                    <td><p class="morado">* Valores expuestos con optimas condiciones de conducción</p></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">Recomendación</th>
                    <td class="value"><?php echo get_field('pdf_combustible_recomendacion',$product_id); ?></td>
                </tr>      
                <tr class="pdf_options__content">
                    <th class="title">Sistema de combustible</th>
                    <td class="value"><?php echo get_field('pdf_sistema_de_combustible',$product_id); ?></td>
                </tr>  
                <?php
                    $parts = get_field('parts',$product_id);
                    if ($parts[2]['list']) {
                        foreach ($parts[2]['list'] as $li) {
                            ?>
                        <tr class="pdf_options__content">
                            <th class="title"><?php echo $li['title']; ?></th>
                            <td class="value"><?php echo $li['content']; ?> <?php echo $li['atrib_content']; ?></td>
                        </tr>
                            <?php
                        }
                    }
                ?>
                <?php
                    $parts = get_field('trans',$product_id);
                    $transmision = $parts[1]['subtitle'];
                    $transmision_list = $parts[1]['list'];;             
                ?>
                <tr class="pdf_options__content">
                    <th class="title">TRANSMICIÓN</th>
                    <td class="value"><?php echo $transmision; ?></td>
                </tr>
                <?php
                    foreach ($transmision_list as $li) {
                        ?>
                    <tr class="pdf_options__content">
                        <th class="title"><?php echo $li['title']; ?></th>
                        <td class="value"><?php echo $li['number']; ?> <?php echo $li['atrib']; ?></td>
                    </tr>
                        <?php
                    }
                ?>
                <tr>
                    <th><h3>LLANTAS, AROS, SUSPENSIÓN Y FRENOS</h3></th>
                    <td></td>
                </tr>
                <?php
                    $parts = get_field('fren',$product_id);
                    $llanta_delantera = $parts[3]['list'][0]['number'].' '.$parts[3]['list'][0]['atrib'];
                    $llanta_posterior = $parts[3]['list'][1]['number'].' '.$parts[3]['list'][1]['atrib'];
                    $tipo_llanta = $parts[3]['list'][0]['text'];
                    //
                    $aleacion = $parts[2]['list'][2]['number'];
                    $sistema_frenos = $parts[1]['list'][2]['number'];
                    $freno_delantero = $parts[1]['list'][0]['atrib'];
                    $medida_freno_delantero = $parts[1]['list'][0]['number'];
                    $freno_posterior = $parts[1]['list'][1]['atrib'];
                    $medida_freno_posterior = $parts[1]['list'][1]['number'];
                ?>
                <tr class="pdf_options__content">
                    <th class="title">LLANTA DELANTERA</th>
                    <td class="value"><?php echo $llanta_delantera; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">LLANTA POSTERIOR</th>
                    <td class="value"><?php echo $llanta_posterior; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">TIPO DE LLANTAS</th>
                    <td class="value"><?php echo $tipo_llanta; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">TIPO DE ARO</th>
                    <td class="value"><?php echo $aleacion; ?></td>
                </tr>
                <?php
                    foreach ($parts[0]['list'] as $li) {
                        ?>
                    <tr class="pdf_options__content">
                        <th class="title">SUSPENSIÓN <?php echo $li['title']; ?></th>
                        <td class="value"><?php echo $li['number']; ?> <small><?php echo $li['atrib']; ?></small></td>
                    </tr>
                        <?php
                    }
                ?>
                <tr class="pdf_options__content">
                    <th class="title">SISTEMA DE FRENOS</th>
                    <td class="value"><?php echo $sistema_frenos; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">FRENO DELANTERO</th>
                    <td class="value"><?php echo $freno_delantero; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">MEDIDA FRENO DELANTERO</th>
                    <td class="value"><?php echo $medida_freno_delantero; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">FRENO POSTERIOR</th>
                    <td class="value"><?php echo $freno_posterior; ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title">MEDIDA FRENO POSTERIOR</th>
                    <td class="value"><?php echo $medida_freno_posterior; ?></td>
                </tr>
                <tr>
                    <th><h3>DIMENSIONES Y PRESTACIONES</h3></th>
                    <td></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('text_box_1',$product_id); ?> <?php echo get_field('desc_box_1',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_1',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('text_box_2',$product_id); ?> <?php echo get_field('desc_box_2',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_2',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"> <?php echo get_field('text_box_3',$product_id); ?> <?php echo get_field('desc_box_3',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_3',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('text_box_4',$product_id); ?> <?php echo get_field('desc_box_4',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_4',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('text_box_5',$product_id); ?> <?php echo get_field('desc_box_5',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_5',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('text_box_6',$product_id); ?> <?php echo get_field('desc_box_6',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_6',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('text_box_7',$product_id); ?> <?php echo get_field('desc_box_7',$product_id); ?></th>
                    <td class="value"><?php echo get_field('number_box_7',$product_id); ?></td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('atrib_text_1',$product_id); ?></th>
                    <td class="value"><?php echo get_field('atrib_number_1',$product_id); ?> </td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('atrib_text_2',$product_id); ?></th>
                    <td class="value"><?php echo get_field('atrib_number_2',$product_id); ?> </td>
                </tr>
                <tr class="pdf_options__content">
                    <th class="title"><?php echo get_field('atrib_text_3',$product_id); ?></th>
                    <td class="value"><?php echo get_field('atrib_number_3',$product_id); ?> </td>
                </tr>

                <tr class="price repeated">
                    <th><h3>PRECIO</h3></th>

                    <?php
                    $index = 0;
                    foreach ($products as $product_id => $product) :
                        $product_class = ($index % 2 == 0 ? 'odd' : 'even') . ' product_' . $product_id ?>
                        <td class="<?php echo esc_attr( $product_class ) ?>"><?php echo wp_kses_post( $product->fields['price'] ); ?></td>
                        <?php
                        ++$index;
                    endforeach; ?>

                </tr>

            <tr class="pdf_options__content">
                <th class="title"></th>
                <td class="value"><p class="morado">*Tipo de cambio del día S/. 3.41</p></td>
            </tr>           

            <?php if ($repeat_add_to_cart == 'yes' && isset($fields['add-to-cart'])) : ?>
                <tr class="add-to-cart repeated">
                    <th><?php echo wp_kses_post( $fields['add-to-cart'] ); ?></th>

                    <?php
                    $index = 0;
                    foreach ($products as $product_id => $product) :
                        $product_class = ($index % 2 == 0 ? 'odd' : 'even') . ' product_' . $product_id ?>
                        <td class="<?php echo esc_attr( $product_class ); ?>">
                            <?php woocommerce_template_loop_add_to_cart(); ?>
                        </td>
                        <?php
                        ++$index;
                    endforeach; ?>

                </tr>
            <?php endif; ?>

        <?php endif; ?>

        </tbody>
    </table>

    <?php do_action('yith_woocompare_after_main_table'); ?>

</div>

<?php if (wp_script_is('responsive-theme', 'enqueued')) wp_dequeue_script('responsive-theme') ?><?php if (wp_script_is('responsive-theme', 'enqueued')) wp_dequeue_script('responsive-theme') ?>
<?php print_footer_scripts(); ?>

<script type="text/javascript">

    jQuery(document).ready(function ($) {
        $('a').attr('target', '_parent');

        var oTable;
        $('body').on('yith_woocompare_render_table', function () {

            var t = $('table.compare-list');

            if (typeof $.fn.DataTable != 'undefined' && typeof $.fn.imagesLoaded != 'undefined' && $(window).width() > 767) {
                t.imagesLoaded(function () {
                    oTable = t.DataTable({
                        'info': false,
                        'scrollX': true,
                        'scrollCollapse': true,
                        'paging': false,
                        'ordering': false,
                        'searching': false,
                        'autoWidth': false,
                        'destroy': true,
                        'fixedColumns': true
                    });
                });
            }
        }).trigger('yith_woocompare_render_table');

        // add to cart
        var redirect_to_cart = false,
            body = $('body');

        // close colorbox if redirect to cart is active after add to cart
        body.on('adding_to_cart', function ($thisbutton, data) {
            if (wc_add_to_cart_params.cart_redirect_after_add == 'yes') {
                wc_add_to_cart_params.cart_redirect_after_add = 'no';
                redirect_to_cart = true;
            }
        });

        body.on('wc_cart_button_updated', function (ev, button) {
            $('a.added_to_cart').attr('target', '_parent');
        });

        // remove add to cart button after added
        body.on('added_to_cart', function (ev, fragments, cart_hash, button) {

            $('a').attr('target', '_parent');

            if (redirect_to_cart == true) {
                // redirect
                parent.window.location = wc_add_to_cart_params.cart_url;
                return;
            }

            // Replace fragments
            if (fragments) {
                $.each(fragments, function (key, value) {
                    $(key, window.parent.document).replaceWith(value);
                });
            }
        });

        // close window
        $(document).on('click', 'a.close', function (e) {
            e.preventDefault();
            window.close();
        });

        $(window).on('resize yith_woocompare_product_removed', function () {
            $('body').trigger('yith_woocompare_render_table');
        });

        $('.compareWith__right a').on('click',function(){
            window.print();
        });

    });



</script>

</body>
</html>