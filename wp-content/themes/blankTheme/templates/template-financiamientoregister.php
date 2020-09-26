<?php /* Template Name: financiamientoregister */
set_query_var('ENTRY', 'financiamientoregister');
get_header();
?>
<section class="anuncia">
	<img class="back_image" src="<?php echo get_field('back_image') ?>" alt="">
	<div class="x-container">

		<div class="columnas">
			<div class="columna_izq">
				<p><?php echo get_field('text_flotante') ?></p>
			</div>	
			<div class="columna_der">
				<h1><?php echo get_field('titulo_anuncia') ?></h1>
				<p class="movil_text1"><?php echo get_field('parrafo_socio') ?></p>
				<div class="contacto_empresa back_contactos">
					<?php echo do_shortcode('[contact-form-7 id="1268" title="financiamiento"]'); ?>
				</div>
				
			</div>

		</div>
	</div>
</section>
<script type="text/javascript">
	jQuery('header').addClass('active2');
</script>
<style>
	section.anuncia {
	    height: auto;
	    overflow: hidden;
	    margin-top: 90px;
	}
	section.anuncia {
    height: auto;
    overflow: hidden;
    padding: 0;
    position: relative;
}
section.anuncia img {
    width: auto;
    position: absolute;
    z-index: -10;
    height: 100%;
    left: 50%;
    transform: translateX(-50%);
}
.columna_izq {
    width: calc(100vw - 400px);
    position: relative;
}
.columna_izq p {
    color: white;
    position: absolute;
    top: 35%;
    right: 108px;
}
	section.anuncia .x-container .columnas .columna_der .back_contactos label a {
	    color: #7a8bff;
	}
#departamento:before,#provincia:before,#distrito:before,#celular:before,#empresa:before,#correo:before,#ruc:before,#documento:before,
#direccion:before,#representante:before,#requerimiento:before,#medio_contacto:before,#situacion_laboral:before,#ingreso_mensual:before,#tiempo_laboral:before,#marca:before,#modelo:before,#monto_inicial:before{
    position: relative;
    content: '';
    width: 22px;
    height: 22px;
    background-size: contain;
    display: inline-block;
    top: 6px;
    left: 0;
    margin-right: 5px;
    background-repeat: no-repeat;
}
.wpcf7 .contact_flex #celular, .wpcf7-form .contact_flex #celular {
    top: 1px;
}
label#distrito {
    margin-top: 15px;
}
label#tiempo_laboral {
    margin-top: 15px;
}
label#monto_inicial {
    margin-top: 15px;
}

#situacion_laboral:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/suitcase.png');
}
#ingreso_mensual:before,#monto_inicial:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/money-4.png');
}
#tiempo_laboral:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/time.png');
}
#marca:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/machine.png');
}
#modelo:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/sport.png');
}
#correo:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/mensaje.png');
}
#ruc:before,#documento:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/business.png');
}
#departamento:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/map-location.png');
}
#provincia:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/map-location-2.png');
}
#direccion:before,#distrito:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/map-location-1.png');
}
#representante:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/name.png');
}
#medio_contacto:before {
	    top: -1px;
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/interface-8.png');
}
#requerimiento:before {
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/chat.png');
}
label#medio_contacto {
    margin: 12px auto !important;
}
/*#ruc:before {
    position: relative;
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/mensaje.png');
    content: '';
    width: 25px;
    height: 25px;
    background-size: contain;
    display: inline-block;
    top: 2px;
    left: 0;
    margin-right: 10px;
}*/
.finalData label br {
    display: none;
}
.finalData label span.wpcf7-form-control-wrap {
    position: absolute;
    left: -10px;
    top: -12px;
    margin-top: 0px;
}
.finalData label {
    display: block;
    position: relative;
    padding-left: 20px;
    font-size: 10px;
}
.finalData p {
    font-size: 12px !important;
    margin-bottom: 20px !important;
}
.finalData {
    padding: 20px 0px;
}
.columnas{
	display: flex;
	justify-content: space-between;
}
textarea.wpcf7-form-control.wpcf7-textarea {
    width: 100%;
    background: #CCCCCC;
    border-radius: 5px;
    border: unset;
    height: 120px;
    margin-top: 5px;
}
section.anuncia{
	height: auto;
	overflow:hidden
	}
section.anuncia img {
	width: auto;
    position: absolute;
    z-index: -10;
    height: 100%;
}
section.anuncia .x-container{
	height:100%;
	position:relative
	}
	section.anuncia .x-container .columnas .columna_der{
		position:relative;
		/*top:50%;*/
		right:0;
		width:min-content;
		/*transform:translateY(-50%);*/
		background-color: white;
		margin: 100px 0;
	}
	.anuncia input.wpcf7-form-control.wpcf7-text.wpcf7-email.wpcf7-validates-as-required.wpcf7-validates-as-email {
	    padding: 11px 0px;
	}
	section.anuncia .x-container .columnas .columna_der p.movil_text1 {
	    font-size: 14px;
	    margin-bottom: -15px;
	    padding: 0px 15px;
	}
	section.anuncia .x-container .columnas .columna_der h1{
		text-align:center;
		color:black;
	    font-size: 20px;
	    margin-top: 30px;
	    margin-bottom: 10px;
	}
	h3.link_titulo {
	    margin-bottom: 5px;
	    color: #4B5AFC;
	    margin-top: 25px;
	}
	label#medio_contacto{
		margin: auto;
	}
section.anuncia .x-container .columnas .columna_der h2{
	font-size:20px;
	text-align:center;
	color:black;
	margin:10px 40px;
	}
section.anuncia .x-container .columnas .columna_der p{
	color:black;
	text-align:center;
	margin-bottom:5px;
	}
section.anuncia .x-container .columnas .columna_der .back_contactos{
	width:390px;
	filter:blur(0px);
	height:auto;
	margin-right:0px
	}
section.anuncia .x-container .columnas .columna_der .back_contactos p{
	text-align:left}
section.anuncia .x-container .columnas .columna_der .back_contactos .contact_flex{
	color:black;
	}
section.anuncia .x-container .columnas .columna_der .back_contactos	label {
    color: black;
}
/*REQUERIMIENTO CSS*/
div#medio_contacto {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: auto;
}
span.wpcf7-form-control.wpcf7-checkbox {
    display: flex;
    justify-content: space-between;
}
span.wpcf7-form-control.wpcf7-checkbox input[type="checkbox"] {
    width: auto;
    display: flex;
}
span.wpcf7-list-item {
    display: flex;
    margin: 0 0 0 1em;
    font-size: 9px;
    align-items: center;
}
label {
    font-size: 12px;
}
section.anuncia .x-container .columnas .columna_der .back_contactos {
    width: 400px;
}
.contact_flex{
	flex-wrap: wrap;
}
.contact_flex .input_50{
	width: 49%;
}
.contact_flex .input_100{
	width: 100%;
}
.wpcf7-form {
    padding: 5px 15px !important;
}
.wpcf7 .contact_flex label span {
    margin-top: 0px;
}
.finalData label {
    font-weight: 400 !important;
    text-transform: none;
    margin-bottom: 15px;
}

/*REQUERIMIENTO*/
@media only screen and (max-width: 1500px){
	section.anuncia .x-container .columnas .columna_der h1{
		font-size:20px
		}
	section.anuncia .x-container .columnas .columna_der h2{
		font-size:12px
		}
	section.anuncia .x-container .columnas .columna_der p{
		font-size:10px
		}
	.wpcf7 .contact_flex,.wpcf7-form .contact_flex{
		font-size:10px !important
		}
	.wpcf7,.wpcf7-form{
		padding:10px !important
		}
	section.anuncia .x-container .columnas .columna_der .back_contactos{
		width:320px
		}
}
label#medio_contacto {
    display: flex;
    align-items: center;
}

@media only screen and (max-width: 1100px){
	section.anuncia {
	    height: auto;
	    overflow: hidden;
	    padding: 50px 0;
	}
}
@media only screen and (max-width: 800px){
	section.anuncia .x-container .columnas .columna_der{
		position:relative;
		transform:unset;
		width:320px;
		margin:auto;
		margin-top:100px
		}
	section.anuncia img.back_image{
		width:auto;
		position:absolute;
		z-index:0;
		height:100%;
		top:90px
		}
	section.anuncia{
		position:relative
		}
	section.anuncia{
		background:black
		}
}
@media only screen and (max-width: 500px){
	section.anuncia{
		height: auto;
		}
	.columnas{
		padding-top:30px
		}
	p.movil_text1{
		align-self:flex-end;
		width:218px
		}
	p.movil_text2{
		width:116px;
		align-self:flex-end;
		margin-right:40px
	}
	section.anuncia img.back_image{
		height:100%;
		top:62px;
		left:-90%
		}
	.contacto_empresa.back_contactos:before{
		width:100%;
		content:'';
		height:100%;
		position:absolute;
		background:#CCCCCC;
		filter:blur(-6px);
		opacity:.3
		}
	section.anuncia .x-container .columnas .columna_der{
		display:flex;
		flex-direction:column
	}
}

</style>
<?php get_footer();

