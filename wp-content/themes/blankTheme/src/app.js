// Import styles
import 'swiper/dist/css/swiper.css';
import './scss/app.scss';
import Swiper from 'swiper';
// Import scripts
import TweenMax from "gsap/TweenMax";
import CSSPlugin from "gsap/CSSPlugin";
import TweenLite from "gsap/TweenLite";
//header
	$(window).scroll(function(){
		let mytop = $(window).scrollTop();
		if (mytop > 20){
			$('header').addClass('active');
		} else {
			$('header').removeClass('active');
		}
	});
//another ios
	var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
	if (iOS) {
	 	//
	}
//scroll
	$('.anchor a').on('click', function(event){
      	event.preventDefault();
      	let $this = $(this);
      	let href = $this.attr('href');
      	$('html, body').stop().animate({scrollTop: $(href).offset().top - 73}, 800);
 	});
	$('.NavChild__item a').on('click', function(event){
      	event.preventDefault();
      	let $this = $(this);
      	let href = $this.attr('href');
      	$('html, body').stop().animate({scrollTop: $(href).offset().top - 73}, 800);
 	});
 	$('.gotback').on('click', function(event){
      	event.preventDefault();
      	$('html, body').stop().animate({scrollTop: $('#header').offset().top}, 1500);
 	});
//buttons
	$('.openMenu').on('click', function(event){
      	$('body').toggleClass('menuOpen');
 	});
 	$('.openModalButton').on('click', function(event){
		event.preventDefault();
		let $this = $(this);
		let id = $this.attr('data');
		$(id).addClass('active');
		$('body').addClass('hidden')
 	});
	$('.modal_left .close_modal').on('click', function(event){
		event.preventDefault();
		$('.modal_left').removeClass('active');
		$('body').removeClass('hidden')
 	});
//forms input

//preload animation
	TweenLite.to( $('header') , 0.4, {css:{top:'0px'}, delay:0.5});
//slider programas
var swiperPrograms = new Swiper('.programs__slider__swipper', {
    spaceBetween: 20,
    slidesPerView: 'auto',
    pagination: {
        el: '.programs__slider .swiper-pagination',
        clickable: true,
    }
});

//LazyLoad
document.addEventListener('DOMContentLoaded', function() {

	let lazyImages = [].slice.call(document.querySelectorAll('img.lazyload'));
	let active = false;
	const lazyLoad = function() {
		if ( active === false ) {
			active = true;
			setTimeout(() => {
				lazyImages.forEach(function(lazyImage) {
					if ( ( lazyImage.getBoundingClientRect().top <= window.innerHeight && lazyImage.getBoundingClientRect().bottom >= 0 ) && getComputedStyle(lazyImage).display !== 'none' ) {
						lazyImage.src = lazyImage.dataset.src;

						if ( typeof(lazyImage.dataset.srcset) !== 'undefined' ) {
							lazyImage.srcset = lazyImage.dataset.srcset;
						}

						lazyImage.classList.remove('lazyload');

						lazyImages = lazyImages.filter((image) => {
							return image !== lazyImage;
						});

						if ( lazyImages.length === 0 ) {
							document.removeEventListener('scroll', lazyLoad);
							window.removeEventListener('resize', lazyLoad);
							window.removeEventListener('orientationchange', lazyLoad);
						}
					}
				});

				active = false;
			}, 200);
		}
	};
	lazyLoad();
	document.addEventListener('scroll', lazyLoad);
	window.addEventListener('resize', lazyLoad);
	window.addEventListener('orientationchange', lazyLoad);
});

//credits


/*$(".noticias__item").on("click", function (event) {
  event.preventDefault();
  const _this = $(this);
  const url = _this.data("link");
  if (url) {
    window.location.href = url;
  } else {
    console.log("sin url");
  }
});*/
/*
$(".swiper-item").on("click", function (event) {
  event.preventDefault();
  const _this = $(this);
  const url = _this.data("link");
  if (url) {
    window.location.href = url;
  } else {
    console.log("sin url");
  }
});
*/