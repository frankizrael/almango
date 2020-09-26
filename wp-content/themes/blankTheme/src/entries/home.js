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
  
//descuentos
let $left_dcts = $('.dscto_left');
for (let i=0;i<$left_dcts.length;i++){
  $('.descuentos__left').append($left_dcts.eq(i));
}
let $right_dcts = $('.dscto_right');
for (let i=0;i<$right_dcts.length;i++){
  $('.descuentos__right').append($right_dcts.eq(i));
}
//animation core.
  /*function calculateHeight($content){
    return $content.height();
  }
  function calculateHeightMin($content){
    return $content.height();
  }
  function animationCore(content,minContent){
    let heightContent = calculateHeight($(content));
    let heightContentMin = calculateHeightMin($(minContent)) + 40;
    let cant = $(content).find(minContent).length;
    let $firstelement = $(content).find(minContent).eq(0);
    let events = 0;
    if (cant > 5) {
      let interval = setInterval(function(){
        let number = events + 5;
        let diference = cant - number;
        if (diference > 0) {          
          events++;
        } else {          
          events--;
        }
        let css = 'margin-top:-'+heightContentMin*events+'px';
        $firstelement.attr('style',css);
      },2000);
    }
  }*/

  function newcarouselleft(){
    var interval = 3000;
    let leng = $('#listLeft').find('.dscto_inside').length;
    let withA = $(window).width();
    let value = 5;
    if (withA < 1301) {
      value = 4;
    }


    if (leng > value) {
      setInterval(function() {
        var first_height = $('#listLeft').find('.dscto_inside:first').height();
        var paddings = parseInt($('#listLeft').find('.dscto_inside:first').css('padding-top')) + parseInt($('#listLeft').find('.dscto_inside:first').css('padding-bottom'));
        var margins = parseInt($('#listLeft').find('.dscto_inside:first').css('margin-top')) + parseInt($('#listLeft').find('.dscto_inside:first').css('margin-bottom'));
        var animation = interval - paddings - margins;
          $('#listLeft').stop().animate({
            scrollTop: first_height + paddings + margins
          }, animation, 'linear', function() {
            $(this).scrollTop(0).find('.dscto_inside:last').after($('.dscto_inside:first', this));
          });
        }, interval);
    }
  }

  function newcarouselright(){
    var interval = 3000;
    let leng = $('#listRight').find('.dscto_inside').length;
    let withA = $(window).width();
    let value = 5;
    if (withA < 1301) {
      value = 4;
    }
    if (leng > value) {
      setInterval(function() {
        var first_height = $('#listRight').find('.dscto_inside:first').height();
        var paddings = parseInt($('#listRight').find('.dscto_inside:first').css('padding-top')) + parseInt($('#listRight').find('.dscto_inside:first').css('padding-bottom'));
        var margins = parseInt($('#listRight').find('.dscto_inside:first').css('margin-top')) + parseInt($('#listRight').find('.dscto_inside:first').css('margin-bottom'));
        var animation = interval - paddings - margins;
          $('#listRight').stop().animate({
            scrollTop: first_height + paddings + margins
          }, animation, 'linear', function() {
            $(this).scrollTop(0).find('.dscto_inside:last').after($('.dscto_inside:first', this));
          });
      }, interval);
    }
  }

  $('#dsct').on('click', function(event){
      setTimeout(function(){
        newcarouselleft();    
        newcarouselright();
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
  },
  breakpoints: {
    1300: {
      slidesPerView: 4
    }
  }
});

var swiperA = new Swiper(".section-a .swiper-container", {
  slidesPerView: 'auto',
  loop: true,
  pagination: {
    el: ".section-a .swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 6000
  }
});

var swipermarcas_list = new Swiper(".marcas_list .swiper-container", {
  slidesPerView: 8,
  loop: true,
  pagination: {
    el: ".marcas_list .swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 6000
  },
  breakpoints: {
    1300: {
      slidesPerView: 4
    }
  }
});

var swipermy_products_featureds = new Swiper(".my_products_featureds .swiper-container", {
  slidesPerView: 4,
  loop: true,
  pagination: {
    el: ".my_products_featureds .swiper-pagination",
    clickable: true,
  },
  breakpoints: {
    1300: {
      slidesPerView: 2
    }
  }
});

var swipermy_bannerMoonM = new Swiper(".bannerMoonM .swiper-container", {
  slidesPerView: 1,
  loop: true,
  pagination: {
    el: ".bannerMoonM .swiper-pagination",
    clickable: true,
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
