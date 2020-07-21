import "../scss/home.scss";
import "swiper/dist/css/swiper.css";
import Swiper from "swiper";
import { TweenMax, CSSPlugin, EasePack, TimelineMax, gsap } from "gsap";
import Typed from 'typed.js';
import ScrollMagic from "scrollmagic";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators";

TweenLite.to( $('.init img') , 1, {css:{left:'0px'}, delay:0});

var typed = new Typed('#typed', {
	stringsElement: '#typed-letter',
	typeSpeed: 90,
	loop: true
});

var swiperBanner = new Swiper(".banner .swiper-container", {
  slidesPerView: 1,
  pagination: {
    el: ".banner .swiper-pagination",
    clickable: true,
  },
});

var swiperNews = new Swiper(".style_motos .swiper-container", {
  slidesPerView: 8,
  loop: true,
  navigation: {
      nextEl: '.style_motos .swiper-button-next',
      prevEl: '.style_motos .swiper-button-prev',
    },
});

var swiperA = new Swiper(".section-a .swiper-container", {
  slidesPerView: 'auto',
  navigation: {
      nextEl: '.section-a .swiper-button-next',
      prevEl: '.section-a .swiper-button-prev',
    },
});

var swipermarcas_list = new Swiper(".marcas_list .swiper-container", {
  slidesPerView: 8,
  navigation: {
      nextEl: '.marcas_list .swiper-button-next',
      prevEl: '.marcas_list .swiper-button-prev',
    },
});

var swipermy_products_featureds = new Swiper(".my_products_featureds .swiper-container", {
  slidesPerView: 4,
  navigation: {
      nextEl: '.my_products_featureds .swiper-button-next',
      prevEl: '.my_products_featureds .swiper-button-prev',
    },
});

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
