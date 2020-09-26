<?php /* Template Name: anuncia */
set_query_var('ENTRY', 'anuncia');
get_header();
?>
<section class="anuncia">
	<div class="x-container">
		<div class="columnas">
			<div class="columna_center">
				<h1><?php echo get_field('titulo_anuncia') ?></h1>
				<p><?php echo get_field('texto_anuncia') ?></p>
				<h2><?php echo get_field('pregunta') ?></h2>
				<p class="text_left"><?php echo get_field('respuesta') ?></p>
			</div>
			
		</div>
		<div class="columnas_grid">
			<div class="column1">
				<img src="<?php echo get_field('img_top') ?>" alt="">
				<img src="<?php echo get_field('img_bot') ?>" alt="">
			</div>
			<div class="column2">
				<div class="item1">
					<img src="<?php echo get_field('img_lupa') ?>" alt="">
					<p><?php echo get_field('texto_lupa') ?></p>
				</div>
				<div class="item2">
					<img src="<?php echo get_field('img_estadistica') ?>" alt="">
					<p><?php echo get_field('texto_estadistica') ?></p>
					<div class="text-colores">
						<p class="morado"><?php echo get_field('text_morado') ?></p>
						<p class="orange"><?php echo get_field('text_orange') ?></p>
						<p><?php echo get_field('text_estadistica2') ?></p>
					</div>
				</div>
				<div class="item3">
					<img src="<?php echo get_field('img_manos') ?>" alt="">
					<p><?php echo get_field('texto_manos') ?></p>
				</div>
			</div>
			<div class="column3">
				<img src="<?php echo get_field('img_alturamax') ?>" alt="">
			</div>
			<div class="column4">
				<img src="<?php echo get_field('img_flex1') ?>" alt="" class="galeria">
				<img src="<?php echo get_field('img_flex2') ?>" alt="" class="galeria">
				<img src="<?php echo get_field('img_flex3') ?>" alt="" class="galeria">
			</div>
		</div>
		<div class="columnas_grid_movil">
			<div class="arrow1">
				<img src="<?php echo get_field('img_flex2') ?>" alt="" class="galeria">
				<img src="<?php echo get_field('img_flex1') ?>" alt="" class="galeria">
			</div>
			<div class="arrow2">
				<img src="<?php echo get_field('img_alturamax') ?>" alt="">
			</div>
			<div class="arrow_pregunta">
				<h2><?php echo get_field('pregunta') ?></h2>
				<p class="text_left"><?php echo get_field('respuesta') ?></p>
			</div>
			<div class="arrow3">
				<div class="col-izq">
					<div class="item1">
						<img src="<?php echo get_field('img_lupa') ?>" alt="">
						<p><?php echo get_field('texto_lupa') ?></p>
					</div>
					
				</div>
				<div class="col-der">
					<img src="<?php echo get_field('img_top') ?>" alt="">
				</div>
				
			</div>

			<div class="arrow4">
				<div class="col-izq">
					<img src="<?php echo get_field('img_bot') ?>" alt="">					
				</div>
				<div class="col-der">
					<div class="item2">
						<img src="<?php echo get_field('img_estadistica') ?>" alt="">
						<p><?php echo get_field('texto_estadistica') ?></p>
						<div class="text-colores">
							<p class="morado"><?php echo get_field('text_morado') ?></p>
							<p class="orange"><?php echo get_field('text_orange') ?></p>
							<p><?php echo get_field('text_estadistica2') ?></p>
						</div>
					</div>
				</div>
			</div>
			<div class="arrow5">
				<div class="col-izq">
					<p><?php echo get_field('texto_manos') ?></p>				
				</div>
				<div class="col-der">
					<img src="<?php echo get_field('img_manos') ?>" alt="">
				</div>
			</div>
			
			
		</div>
		<div class="form_empresa back_contactos">
			
			<?php echo do_shortcode('[contact-form-7 id="1367" title="anunciar"]'); ?>
		</div>
	</div>
</section>
<?php get_footer();
?>
<style type="text/css">
	.titleA p {
	    font-size: 9px;
	    font-weight: 700;
	    margin-bottom: 18px;
	    color: #737373;
	}
	.titleA h2 {
	    font-size: 20px;
	    margin: 10px;
	}
	input {
	    text-align: center;
	    padding: 10px 0px;
	}
	label:before {
	    width: 22px !important;
	    height: 22px !important;
	    margin-right: 5px !important;
	}
	label {
	    width: 100% !important;
	}
	#correo:before {
	    position: relative;
	    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/mensaje.png');
	    content: '';
	    width: 22px;
	    height: 22px;
	    background-size: contain;
	    display: inline-block;
	    top: 4px;
	    left: 0;
	    margin-right: 5px;
	}
	p.opas {
	    margin: 20px 0px;
	    font-size: 11px;
	}
	input.wpcf7-form-control.wpcf7-submit {
	    border-radius: 10px;
	    border-bottom: none;
	    cursor: pointer;
	}
</style>
