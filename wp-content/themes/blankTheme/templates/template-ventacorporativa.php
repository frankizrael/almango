<?php /* Template Name: ventacorporativa */
set_query_var('ENTRY', 'ventacorporativa');
get_header();
?>
<section class="anuncia">
	<img class="back_image" src="<?php echo get_field('back_image') ?>" alt="">
	<div class="x-container">

		<div class="columnas">
			<div class="columna_izq">
				
			</div>	
			<div class="columna_der">
				<h1><?php echo get_field('titulo_anuncia') ?></h1>
				<p class="movil_text1"><?php echo get_field('parrafo_socio') ?></p>
				<h2><?php echo get_field('subtitulo_anuncia') ?></h2>
				<div class="contacto_empresa back_contactos">
					<?php echo do_shortcode('[contact-form-7 id="1247" title="ventas corporativas"]'); ?>
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
	section.anuncia img {
	    width: auto;
	    position: absolute;
	    z-index: -10;
	    height: 100%;
	    left: 50%;
	    transform: translateX(-50%);
	}
	section.anuncia {
	    position: relative;
	}
	section.anuncia .x-container .columnas .columna_der .back_contactos label a {
	    color: #7a8bff;
	}
	.wpcf7 input, .wpcf7-form input {
	    padding: 10px 0px;
	    text-align: center;
	}
	#celular:before{
		margin-right: 5px;
	}
	#empresa {
	    width: 100%;
	}
	#empresa:before{
		margin-right: 5px;
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
	#ruc:before {
	    position: relative;
	    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/business.png');
	    content: '';
	    width: 22px;
	    height: 22px;
	    background-size: contain;
	    display: inline-block;
	    top: 5px;
	    left: 0;
	    margin-right: 5px;
	}
	#direccion:before {
	    position: relative;
	    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/map-location-1.png');
	    content: '';
	    width: 22px;
	    height: 22px;
	    background-size: contain;
	    display: inline-block;
	    top: 5px;
	    left: 0;
	    margin-right: 5px;
	}
	#representante:before {
	    position: relative;
	    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/name.png');
	    content: '';
	    width: 22px;
	    height: 22px;
	    background-size: contain;
	    display: inline-block;
	    top: 5px;
	    left: 0;
	    margin-right: 5px;
	}
	#requerimiento:before {
	    position: relative;
	    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/chat.png');
	    content: '';
	    width: 25px;
	    height: 25px;
	    background-size: contain;
	    display: inline-block;
	    top: 2px;
	    left: 0;
	    margin-right: 10px;
	    margin-top: 15px;
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
	section.anuncia img{
		width:100%;
		position:absolute;
		z-index:-10
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
		box-shadow: 3px 3px 20px black;
	}
	section.anuncia .x-container .columnas .columna_der h1{
		text-align:center;
		color:black;
		font-size:20px;
		margin-top: 40px;
	}
	section.anuncia .x-container .columnas .columna_der h2 {
	    font-size: 18px;
	    color: black;
	    margin: 20px 40px;
	    text-align: left;
	    margin-bottom: 5px;
	}
	section.anuncia .x-container .columnas .columna_der p {
	    color: black;
	    text-align: center;
	    margin-bottom: 5px;
	    font-size: 12px;
	    margin-top: 10px;
	    margin-left: 10px;
	    margin-right: 10px;
	}
	section.anuncia .x-container .columnas .columna_der .back_contactos{
		width:390px;
		filter:blur(0px);
		height:auto;
		margin-right:0px
		}
	section.anuncia .x-container .columnas .columna_der .back_contactos p {
	    text-align: left;
	    margin-left: 0px;
	    margin-right: 0px;
	    margin-top: 0px;
	}
	section.anuncia .x-container .columnas .columna_der .back_contactos .contact_flex{
		color:black;
		}
	section.anuncia .x-container .columnas .columna_der .back_contactos	label {
	    color: black;
	}
	section.anuncia .x-container .columnas .columna_der .back_contactos label {
	    margin-bottom: 10px;
	}
/*REQUERIMIENTO CSS*/
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
    margin-bottom: 10px;
    font-weight: 400 !important;
}
.finalData label {
    display: block;
    position: relative;
    padding-left: 20px;
    font-size: 10px;
    text-transform: none;
}
.finalData p {
    font-size: 12px !important;
    margin-bottom: 20px !important;
}
.finalData {
    padding: 10px 0px;
}
div#medio_contacto label {
    margin-bottom: 15px;
    margin-top: 10px;
}
div#medio_contacto {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0;
    margin-bottom: 10px;
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
label#medio_contacto:before {
    position: relative;
    background-image: url('<?php echo site_url(); ?>/wp-content/uploads/2020/09/interface-8.png');
    content: '';
	width: 22px;
    height: 22px;
    background-size: contain;
    display: inline-block;
    top: 0px;
    left: 0;
    margin-right: 5px;
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

