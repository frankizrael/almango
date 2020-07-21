import '../scss/brands.scss';
import "swiper/dist/css/swiper.css";
import Swiper from "swiper";
import { TweenMax, CSSPlugin, EasePack, TimelineMax, gsap } from "gsap";
import Typed from 'typed.js';
import ScrollMagic from "scrollmagic";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators";

var swiperBanner = new Swiper(".slide-min .swiper-container", {
  slidesPerView: 3
});

var bannner = new Swiper(".banner .swiper-container", {
  slidesPerView: 1,
  pagination: {
    el: ".banner .swiper-pagination",
    clickable: true,
  },
});

let $sw = $('.banner .swiper-slide');
for (let i=0;i<$sw.length;i++){
	let data = $sw.eq(i).attr('data');
	$('.banner .swiper-pagination-bullet').eq(i).append('<i>'+data+'</i>');
}


$('.jsCarrusel').on('click',function(){
	$('.jsLista').removeClass('active');
	$('.jsCarrusel').addClass('active');
	var motos = new Swiper(".contentModels .swiper-container", {
	  slidesPerView: 3
	});
});

$('.jsLista').on('click',function(){
	$('.jsLista').addClass('active');
	$('.jsCarrusel').removeClass('active');
	
});


$('.jsCarrusel').trigger('click');

//animation
TweenLite.to( $('.title-x h1') , 0.5, {css:{transform:'none',opacity:'1'}, delay:1});
TweenLite.to( $('.init .content-x .desc') , 0.5, {css:{transform:'none',opacity:'1'}, delay:1.5});