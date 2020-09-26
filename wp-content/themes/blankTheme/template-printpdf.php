<?php /* Template Name: pdfprint */
set_query_var('ENTRY', 'store');
get_header();
$id = filter_input( INPUT_GET, 'id' );
?>
<section class="pdf_inside">
	<img src="<?php echo get_field('pdf_background_init',$id); ?>" class="backoff">
	<div class="pdf_inside__right">
		<div class="pdf_inside__right__marca">
		<?php
			$cat = get_the_terms($id,'product_cat', array( 'order' => 'DESC'));
			if ($cat) {				
				foreach ($cat as $ta) {								
					$idmarca = $ta->term_id;
					$thumbnail_id = wp_get_attachment_url(get_term_meta( $idmarca, 'thumbnail_id', true ));	
					if ($thumbnail_id) {
						if ($ta->parent == 24) {										
						//if ($ta->parent == 67) {										
						?>
						<div class="imagen_cat">
							<img src="<?php echo $thumbnail_id; ?>">
						</div>
						<?php
						}						
					}
				}
			}
		?>
		</div>
		<div class="pdf_inside__right__resumen">
			<?php echo get_field('resumen',$id); ?>
		</div>
	</div>
	<div class="pdf_inside__title">
		<h1><?php echo get_the_title($id); ?></h1>
	</div>
</section>
<section class="pdf_options">
	<div class="pdf_options__flex">
		<div class="pdf_options__border">
			<h2>DATOS GENERALES</h2>
			<div class="pdf_options__content">
				<div class="title">PAÍS DE ORIGEN</div>
				<div class="value"><?php echo get_field('pdf_pais_origen',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">PAÍS DE FABRICACIÓN</div>
				<div class="value"><?php echo get_field('pdf_pais_fabricacion',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">AÑO</div>
				<div class="value"><?php echo get_field('modelo',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">TIPO DE CHASIS</div>
				<div class="value"><?php echo get_field('pdf_tipo_chasis',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">Colores</div>
				<div class="value">
					<div class="colores_b">
						<?php
							$colores = get_field('colores',$id);
							if ($colores) {
								foreach ($colores as $ce) {
							?>
							<span style="background:<?php echo $ce['color']; ?>"></span>
						<?php
								}
							}
						?>
					</div>
				</div>
			</div>
			<div class="pdf_options__content">
				<div class="title">Posición de manejo</div>
				<div class="value"><?php echo get_field('position_moto_desc',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">Estilo</div>
				<div class="value">
					<?php
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
				</div>
			</div>
			<div class="pdf_options__content">
				<div class="title">Número de asientos</div>
				<div class="value"><?php echo get_field('pdf_num_asientos',$id); ?></div>
			</div>			
		</div> 
		<div class="pdf_options__border_top">
			<img src="<?php echo get_template_directory_uri(); ?>/img/logo_trans.png" class="backfond">
			<h2>Regalos por tu compra</h2>
			<div class="pdf_options__present">
				<?php
					$presents = get_field('presents',$id);
					$transition = 0;
					if ($presents) {
						foreach ($presents as $pp) {
					?>
				<div class="item_presnts">
					<img src="<?php echo $pp['imagen']; ?>">
					<p><?php echo $pp['text']; ?></p>
				</div>
					<?php
						}
					}
				?>
			</div>
		</div>
		<div class="pdf_options__border">
			<h2>Garantía</h2>
			<div class="pdf_options__content">
				<div class="title">MESES</div>
				<div class="value"><?php echo get_field('pdf_garantia_meses',$id); ?></div>
			</div>		
			<div class="pdf_options__content">
				<div class="title">KILÓMETROS</div>
				<div class="value"><?php echo get_field('pdf_garantia_kilometros',$id); ?></div>
			</div>		
			<p>* Lo que pase primero</p>
			<h2>Recomendaciones</h2>
			<div class="pdf_options__content">
				<div class="title">MANTENIMIENTO</div>
				<div class="value"><?php echo get_field('pdf_garantia_mantenimiento',$id); ?></div>
			</div>	
			<div class="pdf_options__content">
				<div class="title">ACEITE RECOMENDADO</div>
				<div class="value"><?php echo get_field('pdf_aceite',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">ASENTAMIENTO DE MOTOR (Km)</div>
				<div class="value"><?php echo get_field('pdf_asentamiento_motor',$id); ?></div>
			</div>
		</div> 
	</div>
</section>
<section class="pdf_banner">
	<img src="<?php echo get_field('pdf_background_second',$id); ?>" class="backoff">
</section>
<section class="pdf_data_ins pdf_options">
	<div class="pdf_options__flex">
		<div class="pdf_options__border">
			<h2>MOTOR Y SISTEMA ELÉCTRICO</h2>
			<?php
				$parts = get_field('trans',$id);
				$tipo_motor = $parts[0]['list'][0]['number'].' '.$parts[0]['list'][0]['atrib'];
				$cilindrada = $parts[0]['list'][1]['number'];
				$n_cilindros = $parts[0]['list'][2]['number'];
			?>
			<div class="pdf_options__content">
				<div class="title">CILINDRADA</div>
				<div class="value"><?php echo $cilindrada; ?>cc</div>
			</div>
			<div class="pdf_options__content">
				<div class="title">N° DE CILINDROS</div>
				<div class="value"><?php echo $n_cilindros; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">RATIO DE COMPRENSIÓN</div>
				<div class="value"><?php echo get_field('pdf_ratio_comprension',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">DÍAMETRO POR CARRERA</div>
				<div class="value"><?php echo get_field('pdf_diametro_carrera',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">TORQUE NM</div>
				<div class="value"><?php echo get_field('pdf_torque_nm',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">TORQUE RPM</div>
				<div class="value"><?php echo get_field('pdf_torque_rpm',$id); ?></div>
			</div>		
			<div class="pdf_options__content">
				<div class="title">CABALLOS DE FUERZA</div>
				<div class="value"><?php echo get_field('pdf_caballos_fuerza',$id); ?></div>
			</div>	
			<div class="pdf_options__content">
				<div class="title">TIPO DE MOTOR</div>
				<div class="value"><?php echo $tipo_motor; ?></div>
			</div>	
			<div class="pdf_options__content">
				<div class="title">ENCENDIDO</div>
				<div class="value"><?php echo get_field('pdf_encendido',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">REFRIGERACIÓN</div>
				<div class="value"><?php echo get_field('pdf_refrigeracion',$id); ?></div>
			</div>		
		</div> 
		<div class="pdf_options__border_left">
			<img src="<?php echo get_template_directory_uri(); ?>/img/logo_trans.png"  class="backfond">
			<h2>Faros y tablero</h2>
			<?php
				$parts = get_field('parts',$id);
				foreach ($parts[0]['list'] as $li) {
					?>
				<div class="pdf_options__content">
					<div class="title"><?php echo $li['title']; ?></div>
					<div class="value"><?php echo $li['content']; ?> <?php echo $li['atrib_content']; ?></div>
				</div>
					<?php
				}
			?>
			<?php
				$parts = get_field('parts',$id);
				foreach ($parts[1]['list'] as $li) {
					?>
				<div class="pdf_options__content">
					<div class="title"><?php echo $li['title']; ?></div>
					<div class="value">SI</div>
				</div>
					<?php
				}
			?>
		</div>
		<div class="pdf_options__border">
			<h2>Consumo, rendimiento y transmisión</h2>
			<div class="pdf_options__content">
				<div class="title">Recomendación</div>
				<div class="value"><?php echo get_field('pdf_combustible_recomendacion',$id); ?></div>
			</div>		
			<div class="pdf_options__content">
				<div class="title">Sistema de combustible</div>
				<div class="value"><?php echo get_field('pdf_sistema_de_combustible',$id); ?></div>
			</div>	
			<?php
				$parts = get_field('parts',$id);
				foreach ($parts[2]['list'] as $li) {
					?>
				<div class="pdf_options__content">
					<div class="title"><?php echo $li['title']; ?></div>
					<div class="value"><?php echo $li['content']; ?> <?php echo $li['atrib_content']; ?></div>
				</div>
					<?php
				}
			?>
			<?php
				$parts = get_field('trans',$id);
				$transmision = $parts[1]['subtitle'];
				$transmision_list = $parts[1]['list'];;				
			?>
			<div class="pdf_options__content">
				<div class="title">TRANSMISIÓN</div>
				<div class="value"><?php echo $transmision; ?></div>
			</div>
			<?php
				foreach ($transmision_list as $li) {
					?>
				<div class="pdf_options__content">
					<div class="title"><?php echo $li['title']; ?></div>
					<div class="value"><?php echo $li['number']; ?> <?php echo $li['atrib']; ?></div>
				</div>
					<?php
				}
			?>
			<p>* valores expuestos con óptimas condiciones de conducción</p>

		</div> 
	</div>
</section>
<section class="pdf_banner">
	<img src="<?php echo get_field('pdf_background_there',$id); ?>" class="backoff">
</section>
<section class="pdf_options pdf_data_foot">
	<div class="pdf_options__flex">
		<div class="pdf_options__border">
			<h2>LLANTAS, AROS, SUSPENSIÓN Y FRENOS</h2>
			<?php
				$parts = get_field('fren',$id);
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
			<div class="pdf_options__content">
				<div class="title">LLANTA DELANTERA</div>
				<div class="value"><?php echo $llanta_delantera; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">LLANTA POSTERIOR</div>
				<div class="value"><?php echo $llanta_posterior; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">TIPO DE LLANTAS</div>
				<div class="value"><?php echo $tipo_llanta; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">TIPO DE ARO</div>
				<div class="value"><?php echo $aleacion; ?></div>
			</div>
			<?php
				foreach ($parts[0]['list'] as $li) {
					?>
				<div class="pdf_options__content">
					<div class="title">SUSPENSIÓN <?php echo $li['title']; ?></div>
					<div class="value"><?php echo $li['number']; ?> <small><?php echo $li['atrib']; ?></small></div>
				</div>
					<?php
				}
			?>
			<div class="pdf_options__content">
				<div class="title">SISTEMA DE FRENOS</div>
				<div class="value"><?php echo $sistema_frenos; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">FRENO DELANTERO</div>
				<div class="value"><?php echo $freno_delantero; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">MEDIDA FRENO DELANTERO</div>
				<div class="value"><?php echo $medida_freno_delantero; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">FRENO POSTERIOR</div>
				<div class="value"><?php echo $freno_posterior; ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title">MEDIDA FRENO POSTERIOR</div>
				<div class="value"><?php echo $medida_freno_posterior; ?></div>
			</div>
		</div>
		<div class="pdf_options__border">
			<h2>DIMENSIONES Y PRESTACIONES</h2>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_1',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_1',$id); ?><?php echo get_field('text_box_1',$id); ?> </div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_2',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_2',$id); ?> <?php echo get_field('text_box_2',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_3',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_3',$id); ?> <?php echo get_field('text_box_3',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_4',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_4',$id); ?> <?php echo get_field('text_box_4',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_5',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_5',$id); ?> <?php echo get_field('text_box_5',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_6',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_6',$id); ?> <?php echo get_field('text_box_6',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('desc_box_7',$id); ?></div>
				<div class="value"><?php echo get_field('number_box_7',$id); ?> <?php echo get_field('text_box_7',$id); ?></div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('atrib_text_1',$id); ?></div>
				<div class="value"><?php echo get_field('atrib_number_1',$id); ?> </div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('atrib_text_2',$id); ?></div>
				<div class="value"><?php echo get_field('atrib_number_2',$id); ?> </div>
			</div>
			<div class="pdf_options__content">
				<div class="title"><?php echo get_field('atrib_text_3',$id); ?></div>
				<div class="value"><?php echo get_field('atrib_number_3',$id); ?> </div>
			</div>
		</div>
	</div>
</section>
<section class="pdf_options pdf_data_foot_fo">
	<div class="pdf_flexprice">
		<div class="title_p">PRECIO</div>
		<div class="buy_info">
			<div class="prices_html__price">
				<?php
					$product = wc_get_product( $id );
					echo $product->get_price_html();
				?>
			</div>
			<div class="prices_html__mPrice">
				<span class="pp">Otro medio de pago</span>
				<span class="bb">
					<?php
						$porcentaje = get_field('porcentaje_conversion','options');
						$price = $product->get_price();
						$price_new = $porcentaje*$price;
						echo get_woocommerce_currency_symbol();
						echo asDollars($price_new);
					?>
				</span>
			</div>
			<p>TIPO DE CAMBIO DEL DÍA S/. <?php echo get_field('tipo_cambio','options'); ?></p>
		</div>
		<div class="buttonbuy">
			<a href="<?php echo get_permalink($id);?>" class="btn">COMPRAR</a>
		</div>
	</div>
	<div class="footer">
		<div class="footer_logo">
			<img src="<?php the_field('logo','options'); ?>">	
		</div>
		<div class="content_s">
			<p>Aceptamos DEPOSITOS , TRANSFERENCIAS, tarjetas de Crédito y Débito.</p>
			<div class="metodos-s">
	          <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/visaimg.png">
	          <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/pagoefectivo-logo-1.png">
	        </div>
		</div>
		<div class="content_a">
			<div class="red_social">        
		        <h2>Síguenos</h2>
		        <div class="list-social">
		          <ul>
		            <?php
		              $social = get_field('social','options');
		              if ($social) {
		                foreach ($social as $s) {
		                  ?>
		            <li>
		              <a href="<?php echo $s['link']; ?>"><img src="<?php echo $s['img']; ?>"></a>
		            </li>
		                  <?php
		                }
		              }
		            ?>
		          </ul>
		        </div>
		    </div>		    
        	<p class="extraffs">Copyright 2020 - ALMANGO.PE. TODOS LOS DERECHOS RESERVADOS</p>
		</div>
	</div>
</section>
<?php get_footer();