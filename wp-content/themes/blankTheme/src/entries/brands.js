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
animateCards($('.myloopWooProducts'));

let $sw = $('.banner .swiper-slide');
for (let i=0;i<$sw.length;i++){
	let data = $sw.eq(i).attr('data');
	$('.banner .swiper-pagination-bullet').eq(i).append('<i>'+data+'</i>');
}

var motosSwiper;
$('.jsCarrusel').on('click',function(){
	$('.jsLista').removeClass('active');
	$('.jsCarrusel').addClass('active');
	motosSwiper = new Swiper(".contentModels .swiper-container", {
	  	slidesPerView: 3,	  
	    autoplay: {
	        delay: 7500
	    }
	});
	$('.contentModels').removeClass('listaView');
});

$('.jsLista').on('click',function(){
	$('.jsLista').addClass('active');
	$('.jsCarrusel').removeClass('active');
	motosSwiper.destroy();
	$('.contentModels').addClass('listaView');
});


$('.jsCarrusel').trigger('click');

//animation
TweenLite.to( $('.title-x h1') , 0.5, {css:{transform:'none',opacity:'1'}, delay:1});
TweenLite.to( $('.init .content-x .desc') , 0.5, {css:{transform:'none',opacity:'1'}, delay:1.5});