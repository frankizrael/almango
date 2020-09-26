<?php /* Template Name: contacto */
set_query_var('ENTRY', 'contacto');
get_header();
?>
<section class="contacto">
	 <div class="x-container">
	 	<div class="col-izq">
	 		<h2><?php echo get_field('titulo_contacto') ?></h2>
	 		<p><?php echo get_field('concepto_contacto') ?></p>
	 		<img class="img_contacto" src="<?php echo get_field('img_contacto') ?>" alt="">
	 		<h2><?php echo get_field('titulo_redes') ?></h2>
	 		<p><?php echo get_field('concepto_redes') ?></p>
	 		<ul>
	 			<?php
	            $redes = get_field('redes');
	            if ($redes){
	                foreach($redes as $vid) {
	                    ?>
	                    <li>
	                    	<a href="<?php echo $vid['url_redsocial']; ?>">
	                    	<div class="imagen_red">
	                    		<img src="<?php echo $vid['imagen_red']; ?>" alt="">
	                    	</div>			 				
			 				<p><?php echo $vid['nombre_red']; ?></p>
			 				</a>
			 			</li>
	                    <?php
	                }
	            }
	            ?>
	 		</ul>
	 	</div>
	 	<div class="col-der back_contactos">
	 		<?php echo do_shortcode('[contact-form-7 id="1387" title="formulario contacto"]'); ?>
	 	</div>
	 </div>
</section>
<style>
	h2.subTitlex {
	    margin-top: 15px;
	    margin-bottom: 10px;
	    font-size: 20px;
	}
	section.contacto{
		background: transparent linear-gradient(2deg, #00E9D9 0%, #FF9F32 100%) 0% 0% no-repeat padding-box;
		padding-top: 200px;
	}
	section.contacto .x-container{
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.back_contactos {
	    height: max-content;
	    margin: auto;
	}
	section.contacto .x-container .col-izq{
		width: calc(100% - 500px);
	}
	section.contacto .x-container .col-izq p {
	    font-size: 20px;
	}
	section.contacto .x-container .col-izq h2{
		font-size: 30px;
		margin-bottom: 30px;
	}
	section.contacto .x-container .col-izq .img_contacto{
		margin-left: 150px;
		margin-top: 50px;
	}
	section.contacto .x-container .col-izq ul{
		display: flex;
		margin-top: 40px;
		justify-content: space-between;
		margin-bottom: 50px;
		width: 400px;
		margin: 50px auto;
		padding-bottom: 30px;
	}
	section.contacto .x-container .col-izq ul li{
		position: relative;
	}
	section.contacto .x-container .col-izq ul li .imagen_red{
		width: 70px;
		height: 70px;
		border-radius: 10px;
		background-color: black;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	section.contacto .x-container .col-izq ul li p {
	    text-align: center;
	    width: 77px;
	    font-size: 18px;
	    position: absolute;
	    left: 50%;
	    transform: translateX(-50%);
	    margin-top: 15px;
	}


	/*FORMULARIO ICONOS*/
	#departamento:before,#provincia:before,#distrito:before,#celular:before,#empresa:before,#correo:before,#ruc:before,#documento:before,
	#direccion:before,#representante:before,#requerimiento:before,#medio_contacto:before,#situacion_laboral:before,#ingreso_mensual:before,#tiempo_laboral:before,#marca:before,#modelo:before,#monto_inicial:before,#tipo_solicitud:before{
	    position: relative;
	    content: '';
	    width: 22px;
	    height: 22px;
	    background-size: contain;
	    display: inline-block;
	    top: 5px;
	    left: 0;
	    margin-right: 5px;
	    background-repeat: no-repeat;
	}
	#correo:before {
	    background-image: url('<?php echo site_url();?>/wp-content/uploads/2020/09/mensaje.png');
	}
	#requerimiento:before {
	    background-image: url('<?php echo site_url();?>/wp-content/uploads/2020/09/chat.png');
	}
	#tipo_solicitud:before {
	    background-image: url('<?php echo site_url();?>/wp-content/uploads/2020/09/message.png');
	}
	.finalData label br {
	    display: none;
	}
	.finalData label span.wpcf7-form-control-wrap {
	    position: absolute;
	    left: -13px;
	    top: -7px;
	    margin-top: 0px;
	}
	.finalData label {
	    display: block;
	    position: relative;
	    padding-left: 20px;
	    font-size: 10px;
	}
	.finalData p label {
	    text-transform: none;
	    padding-left: 25px;
	    font-weight: 400;
	}
	.finalData p {
	    font-size: 12px !important;
	    margin-bottom: 20px !important;
	}
	.finalData p label{
		margin-bottom: 20px;
	}
	.finalData p label {
	    text-transform: none;
	    padding-left: 25px;
	}
	.finalData {
	    padding: 10px 0px;
	}

	.back_contactos label a {
		    color: #7a8bff;
		}
	input[type="checkbox"] {
	    width: auto;
	}
	textarea.wpcf7-form-control.wpcf7-textarea {
	    background: #CCCCCC;
	    border: unset;
	    border-radius: 5px;
	}
	.wpcf7 p label, .wpcf7-form p label {
	    margin-bottom: 10px;
	}
	label#requerimiento {
	    margin-top: 10px;
	}
	textarea.wpcf7-form-control.wpcf7-textarea {
	    resize: none;
	    height: 120px;
	    width: 100%;
	}
	.wpcf7 .contact_flex, .wpcf7-form .contact_flex {
	    margin-top: 0px !important;
	}
</style>
<script type="text/javascript">
	jQuery('header').addClass('active2');
</script>
<?php get_footer();


