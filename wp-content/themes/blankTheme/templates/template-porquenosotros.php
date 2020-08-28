<?php /* Template Name: porquenosotros */
set_query_var('ENTRY', 'porquenosotros');
get_header();
$idhome = get_option( 'page_on_front' );
?>
<section class="porque_nosotros">
	<div class="x-container">
		<div class="columnas">
			<div class="columna_center">
				<h1><?php echo get_field('titulo') ?></h1>
				<p><?php echo get_field('texto') ?></p>
			</div>	
			<div class="col-youtube">
				<img src="<?php echo get_field('img_adorni') ?>" alt="" class="adorno-izq">
				<?php echo get_field('url_youtube') ?>
				<img src="<?php echo get_field('img_adornd') ?>" alt="" class="adorno-der">
			</div>	
			<div class="hashtag">
				<p><?php echo get_field('hashtag') ?> </p>
			</div>	
		</div>
	</div>	
</section>
<section id="dsct" class="descuentos" style="background: transparent linear-gradient(90deg, #27F4CA 0%, #BD90FF 62%, #960FEF 100%) 0% 0% no-repeat padding-box;">
	<div class="decorative_left">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_0.svg" style="transition-delay: 0s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_1.svg" style="transition-delay: 0.2s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_2.svg" style="transition-delay: 0.4s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_3.svg" style="transition-delay: 0.6s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/coupon_4.svg" style="transition-delay: 0.8s;">
	</div>
	<div class="x-container">
		<h2><?php the_field('descuentos_title',$idhome); ?></h2>
		<p><?php the_field('descuentos_subtitle',$idhome); ?></p>
	</div>
	<div class="decorative_right">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount.svg" style="transition-delay: 1s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount-1.svg" style="transition-delay: 1.2s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount-2.svg" style="transition-delay: 1.4s;">
		<img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/discount-3.svg" style="transition-delay: 1.6s;">
	</div>
</section>
<?php get_footer();

