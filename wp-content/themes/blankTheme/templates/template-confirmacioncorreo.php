
<?php /* Template Name: activacioncuenta */
set_query_var('ENTRY', 'activacioncuenta');
get_header();
?>
<section class="preguntas_frecuentes">
	<img src="<?php echo get_field('back_imagen') ?>" alt="" class="back_imagen">
	<div class="x-container">
		<div class="columnas">
			<div class="columna-izq">
				<p><?php echo get_field('text_col') ?></p>
			</div>
			<div class="columna-der">
				<h1><?php echo get_field('titulo_activacion') ?></h1>
				<img class="openModal" src="<?php echo get_field('img_mensaje') ?>" alt="">
				<p><?php echo get_field('parrafo_1') ?></p>
				<p><?php echo get_field('parrafo_2') ?></p>
				<div class="pregunta-link">
					<h2><?php echo get_field('pregunta_link') ?></h2>
					<a  href="<?php echo get_field('url_reenviar') ?>"><?php echo get_field('text_reenviar') ?></a>
				</div>
				
			</div>
		</div>
	</div>
	<div class="modalShow" style="display: none;">			
		<div class="contentModalShow">
			<div class="close-modal"></div>
			<div class="content">
				<img src="<?php echo get_field('verificacion_img') ?>" alt="">
				<p><?php echo get_field('verificacion_text') ?></p> 
			</div>
		</div>
		<script>
			$('.openModal').on('click',function(){
		   $('.modalShow').show();
		});
		$('.close-modal').on('click',function(){
		  $('.modalShow').hide();
		});
		</script>
	</div>
	<style>
	.close-modal:after {
	    content: '';
	    position: absolute;
	    width: 20px;
	    height: 2px;
	    background: black;
	    transform: rotate(-45deg);
	    top: 13px;
	    left: 5px;
	}
	.close-modal:before {
	    content: '';
	    position: absolute;
	    width: 20px;
	    height: 2px;
	    background: black;
	    transform: rotate(45deg);
	    top: 13px;
	    left: 5px;
	}
	.close-modal {
	    cursor: pointer;
	    position: absolute;
	    width: 30px;
	    height: 30px;
	    top: 5px;
	    right: 5px;
	}
	.modalShow {
	    position: fixed;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    left: 0;
	    background: #000000ba;
	    z-index: 500;
	    transition: 0.3s;
	}
	</style>
</section>
<?php get_footer();

