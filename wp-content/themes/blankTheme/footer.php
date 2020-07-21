<section class="subscription" style="background: transparent linear-gradient(135deg, #FF9F32 0%, #ED1E1E 100%) 0% 0% no-repeat padding-box;">
  <div class="subscription_left">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_4.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_2.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_6.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_3.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_5.png">
  </div>
  <div class="x-mid-container">
    <h2><?php the_field('subscription_title','options'); ?></h2>
    <div class="subscriptionmethod">
      <?php echo do_shortcode('[contact-form-7 id="5" title="subscription"]'); ?>
      <p class="terms">He leído y acepto la <a href="#">Política de tratamiento de protección de datos personales.</a></p>
    </div>
  </div>
  <div class="subscription_right">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_7.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_6.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_1.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_4.png">
    <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/motorcycle_3.png">
  </div>
</section>

<footer>
  <div class="x-container">
    <div class="flex  justify-content-between">
      <div class="group">
        <a href="<?php echo site_url(); ?>">
          <img src="<?php the_field('logo','options'); ?>">
        </a>
        <h2>Métodos de pago</h2>
        <div class="metodos-s">
          <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/visaimg.png">
          <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/pagoefectivo-logo-1.png">
        </div>
        <p class="extraff">Copyright 2020 - ALMANGO.PE. TODOS LOS DERECHOS RESERVADOS</p>
      </div>
      <div class="group" style="flex: none;">        
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
      <div class="group">
        <div class="desc">
          <?php the_field('conocenos_menu','options'); ?>
        </div>
      </div>
      <div class="group">
        <div class="desc">
          <?php the_field('servicio_menu','options'); ?>
        </div>
      </div>
      <div class="group">
        <div class="desc">
          <?php the_field('nosotros_menu','options'); ?>
        </div>
      </div>
      <div class="group">
        <div class="desc">
          <?php the_field('legales_menu','options'); ?>
        </div>
        <div class="submit">
          <a href="#">
            <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/libro.png">
            <p>LIBRO DE RECLAMACIONES</p>
          </a>
        </div>
      </div>
    </div>
  </div>  
</footer>
<div class="extraFooter">
  Hecho con <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/symbol.png"> por Almango.pe
</div>
<style type="text/css">
  .swiper-button-prev {
    background-image: url('<?php echo get_template_directory_uri(); ?>/src/assets/img/proximo-1.png') !important;
  }
  .swiper-button-next {
     background-image: url('<?php echo get_template_directory_uri(); ?>/src/assets/img/proximo.png') !important;
  }
</style>
<?php wp_footer() ?>
</body>
</html>
</footer>
<script type="text/javascript">
(function($) {
    $(document).ready(function(){
        console.log("ღ AlMango ღ \n Dev con Amor por wampy para AlMango");
    });
})( jQuery );     
</script>
