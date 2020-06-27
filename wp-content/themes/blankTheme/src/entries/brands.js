import '../scss/brands.scss';
import "swiper/dist/css/swiper.css";
import Swiper from "swiper";

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

var motos = new Swiper(".contentModels .swiper-container", {
  slidesPerView: 3
});
