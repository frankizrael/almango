import "../scss/home.scss";
import "swiper/dist/css/swiper.css";
import Swiper from "swiper";
import { TweenMax, CSSPlugin, EasePack, TimelineMax, gsap } from "gsap";
import Typed from 'typed.js';
import ScrollMagic from "scrollmagic";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators";

let $img = $('.init img');
if ($img) {
  TweenLite.to( $img, 1, {css:{left:'0px'}, delay:0});  
} else {
  let video = document.getElementById('myVideo');
  video.addEventListener('loadedmetadata', function() {
  if (video.buffered.length === 0) return;
  var bufferedSeconds = video.buffered.end(0) - video.buffered.start(0);
  console.log(bufferedSeconds + ' segundos para play!');
  });
}

//animation home
let $hometext = $('.content_text');
let len = $hometext.length;
let aux = 0;
$(window).on('load',function(){
  $hometext.eq(0).show();
  setTimeout(function(){
    $hometext.eq(0).addClass('active');
    //really animation cadousel (si con d)
    setInterval(function(){ 
      if (aux == (len-1)){
        aux = 0;
      } else {
        aux++;
      } 
      //number is correct!!
      for (let y=0;y<len;y++){
        if ($hometext.eq(y).hasClass('active')) {
          $hometext.eq(y).removeClass('active');
          setTimeout(function(){
            $hometext.hide();
            $hometext.eq(aux).show();
            setTimeout(function(){
              $hometext.eq(aux).addClass('active');
            },200);
          },700);
        }
      }
    }, 5000);

  },500);
});
  


var swiperBanner = new Swiper(".banner .swiper-container", {
  slidesPerView: 1,
  pagination: {
    el: ".banner .swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 5000
  }
});

var swiperNews = new Swiper(".style_motos .swiper-container", {
  slidesPerView: 8,
  autoplay: {
    delay: 6000
  }
});

var swiperA = new Swiper(".section-a .swiper-container", {
  slidesPerView: 'auto',
  loop: true,
  navigation: {
      nextEl: '.section-a .swiper-button-next',
      prevEl: '.section-a .swiper-button-prev',
  },
  autoplay: {
    delay: 6000
  }
});

var swipermarcas_list = new Swiper(".marcas_list .swiper-container", {
  slidesPerView: 8,
  loop: true,
  navigation: {
    nextEl: '.marcas_list .swiper-button-next',
    prevEl: '.marcas_list .swiper-button-prev',
  },
  autoplay: {
    delay: 6000
  }
});

var swipermy_products_featureds = new Swiper(".my_products_featureds .swiper-container", {
  slidesPerView: 4,
  loop: true,
  navigation: {
    nextEl: '.my_products_featureds .swiper-button-next',
    prevEl: '.my_products_featureds .swiper-button-prev',
  },
  autoplay: {
    delay: 6000
  }
});

var swipermy_bannerMoonM = new Swiper(".bannerMoonM .swiper-container", {
  slidesPerView: 1,
  loop: true,
  navigation: {
    nextEl: '.bannerMoonM .swiper-button-next',
    prevEl: '.bannerMoonM .swiper-button-prev',
  },
  autoplay: {
    delay: 6000
  }
});



function animateCards($card) {
    $card.on('mousemove', function (e) {
        var x = e.clientX - $(this).offset().left + $(window).scrollLeft();
        var y = e.clientY - $(this).offset().top + $(window).scrollTop();
        
        var rY = map(x, 0, $(this).width(), -17, 17);
        var rX = map(y, 0, $(this).height(), -17, 17);
    
        $(this).children(".ident").css("transform", "rotateY(" + rY + "deg)" + " " + "rotateX(" + -rX + "deg)");
    });        
    function map(x, in_min, in_max, out_min, out_max)
    {
        return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
    }
    $card.on('mouseleave',function(){
      $(this).children(".ident").css('transform','none');
    });
}
animateCards($('.my_prod'));



let $sw = $('.banner .swiper-slide');
for (let i=0;i<$sw.length;i++){
	let data = $sw.eq(i).attr('data');
	$('.banner .swiper-pagination-bullet').eq(i).append('<i>'+data+'</i>');
}

let wind = $(window).width();
let controller = new ScrollMagic.Controller();
let scene_1 = new ScrollMagic.Scene({
triggerElement: "#estilos"
})
.setClassToggle('#estilos', 'animation')
.addTo(controller);
let scene_2 = new ScrollMagic.Scene({
triggerElement: "#bannner"
})
.setClassToggle('#bannner', 'animation')
.addTo(controller);
let scene_3 = new ScrollMagic.Scene({
triggerElement: "#marcas"
})
.setClassToggle('#marcas', 'animation')
.addTo(controller);
let scene_4 = new ScrollMagic.Scene({
triggerElement: "#destacados"
})
.setClassToggle('#destacados', 'animation')
.addTo(controller);
let scene_5 = new ScrollMagic.Scene({
triggerElement: "#dsct"
})
.setClassToggle('#dsct', 'animation')
.addTo(controller);
let scene_6 = new ScrollMagic.Scene({
triggerElement: "#prometemos"
})
.setClassToggle('#prometemos', 'animation')
.addTo(controller);
let scene_7 = new ScrollMagic.Scene({
triggerElement: "#aceptamos"
})
.setClassToggle('#aceptamos', 'animation')
.addTo(controller);
