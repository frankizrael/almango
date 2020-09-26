<section class="subscription" style="background: transparent linear-gradient(135deg, #FF9F32 0%, #ED1E1E 100%) 0% 0% no-repeat padding-box;">
  <div class="subscription_left">
    <div style="background-image: url(<?php echo get_template_directory_uri(); ?>/img/gg1_left.png);" class="insideBack"></div>
  </div>
  <div class="x-mid-container">
    <h2><?php the_field('subscription_title','options'); ?></h2>
    <div class="subscriptionmethod">
      <?php echo do_shortcode('[contact-form-7 id="5" title="subscription"]'); ?>
      <p class="terms">He leído y acepto la <a href="<?php echo site_url(); ?>/politicas-de-privacidad/">Política de tratamiento de protección de datos personales.</a></p>
    </div>
  </div>
  <div class="subscription_right">
    <div style="background-image: url(<?php echo get_template_directory_uri(); ?>/img/gg1_right.png);" class="insideBack"></div>
  </div>
</section>

<footer>
  <div class="x-container">
    <div class="flex onlydesktop justify-content-between">
      <div class="group">
        <a href="<?php echo site_url(); ?>">
          <img src="<?php the_field('logo','options'); ?>">
        </a>
        <h2>Métodos de pago</h2>
        <div class="metodos-s">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_1.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_2.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_3.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_4.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_5.png">
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
          <a href="<?php echo site_url(); ?>/libro-de-reclamaciones/">
            <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/libro.png">
            <p>LIBRO DE RECLAMACIONES</p>
          </a>
        </div>
      </div>
    </div>
    <!-- un pesimo disenho te obliga a hacer esto -->
    <div class="flex onlyMobile" style="display: none;">
      <div class="topAlmango">
        <a href="<?php echo site_url(); ?>">
          <img src="<?php the_field('logo','options'); ?>">
        </a>
      </div>
      <div class="accordeon">
        <div class="accordeon_item">
          <?php the_field('conocenos_menu','options'); ?>
        </div>
        <div class="accordeon_item">
          <?php the_field('servicio_menu','options'); ?>
        </div>
        <div class="accordeon_item">
          <?php the_field('nosotros_menu','options'); ?>
        </div>
        <div class="accordeon_item">
          <?php the_field('legales_menu','options'); ?>
        </div>
      </div>
      <div class="mediosPago">
        <h2>Métodos de pago</h2>
        <div class="metodos-s">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_1.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_2.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_3.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_4.png">
          <img src="<?php echo get_template_directory_uri(); ?>/img/metodo_pago_5.png">
        </div>
      </div>
      <div class="followme">
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
      <div class="bookReclamtion">
        <a href="<?php echo site_url(); ?>/libro-de-reclamaciones/">
          <img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/libro.png">
          <p>LIBRO DE RECLAMACIONES</p>
        </a>
        <p class="extraff">Copyright 2020 - ALMANGO.PE. TODOS LOS DERECHOS RESERVADOS</p>
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
<style>
  .woocommerce form.login{
    border: unset !important;
}
/*MY ACCOUNT*/
.myaccount-page .myaccount-navigation ul li {
  text-align: center;
    position: relative;
}
.myaccount-page .myaccount-navigation ul li a img {
    margin-right: 10px;
    height: 40px;
    width: auto;
    position: relative;
    display: block;
}
.myaccount-page .myaccount-navigation .image-people .editImage {
    right: 65px;
    bottom: -13px;
}
/*MIS ELEGIDAS*/
.myaccount-page .flex-account .myAccount-content .favorite_section .product-remove {
    position: absolute;
    right: 0px;
    z-index: 1000;
}
/*MIS CUPONES*/
.article_tab ul {
    display: flex;
    cursor: pointer;
}
.article_tab ul li{
  background-color: white;
}
.article_tab ul li.active{
  background-color: #4b5afc;
}
</style><style type="text/css">
  .form_reclamo .subtitle {
      font-size: 18px;
      color: #2e5bff;
  } 
  .form_reclamo .customSelect select {
      border: none !important;
      border-bottom: 1px solid #4F4D4D !important;
      padding: 15px 0px !important;
      padding-top: 16px !important;
  }
  .form_reclamo .control input {
      border: none;
      border-bottom: solid 1px #4f4d4d;
      padding-bottom: 11px;
  }
  .form-checkbox input {
      width: 10px;
      height: 12px;
  }
  .form-checkbox {
      display: flex;
      margin-left: 10px;
  }
  .row.call-action .button {
      background: #2e5bff !important;
      border: none;
  }
  .form_reclamo .control textarea {
      width: 100%;
      height: 120px;
      resize: none;
      border: none;
      border-bottom: solid 1px #4f4d4d;
  }
</style>