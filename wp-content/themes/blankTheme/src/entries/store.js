import '../scss/store.scss';
import ThreeSixty from '@mladenilic/threesixty.js';
import { TweenMax, CSSPlugin, EasePack, TimelineMax, gsap } from "gsap";
import ScrollMagic from "scrollmagic";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators";
if ($('body').hasClass('single-product')) {
	/*let controller = new ScrollMagic.Controller();
	let scene_1 = new ScrollMagic.Scene({
	triggerElement: "#singlebanner"
	})
	.setClassToggle('header', 'absolute')
	.addTo(controller);
	//
	let scene_2 = new ScrollMagic.Scene({
	triggerElement: "#singlebanner"
	})
	.setClassToggle('#header_2', 'active')
	.addTo(controller);*/
}





$('header').addClass('active2');


$('.woocommerce .widget_price_filter .price_slider_amount .button').html('Filtrar');
$('.content_lead__tab li').on('click',function(){
	let $this = $(this);	
	let img_id = $this.attr('data-imagen');
	let num = $this.attr('data-num');
	$('.content_lead__tab li').removeClass('active');
	$this.addClass('active');
	let margin = 100*parseInt(num);
	let cssMargin = 'margin-left:-'+margin+'%;';
	$('.content_lead__title__item').eq(0).attr('style',cssMargin);
	$('.content_lead__content__item').eq(0).attr('style',cssMargin);
	$('.ventaja_img').hide();
	$(img_id).show();
});
$('.content_lead__tab li').eq(0).trigger('click');

$('.colors_step').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	$('.colores_item').hide();
	$('.colors_step').removeClass('active');
	$this.addClass('active');
	$(data).show();
});
$('.colors_step').eq(0).trigger('click');

//360
function six360(myid,myimage){
  var mywidth = 1000;
  var myheight = 600;

  var widhDevice = $(window).width();
  if (widhDevice < 1501) {
    mywidth = 800;
    myheight = 480;
    if (widhDevice < 1450) {
      mywidth = 666;
      myheight = 400;
    }
    if (widhDevice < 1275) {
      mywidth = 600;
      myheight = 360;
    }
    if (widhDevice < 700) {
      mywidth = 300;
      myheight = 180;
    }
  }  
  var threesixty = new ThreeSixty(document.getElementById(myid), {
    image: myimage,
    width: mywidth,
    height: myheight,
    count: 36,
    perRow: 6,
    dragTolerance: 10,
    speed: 100,
    inverted: true
  });
  threesixty.play();
  /*$(window).resize(function() {
    let wid = $(window).width();
    if (wid > 768) {
      location.reload();
    }
  });*/
}
let $img360 = $('.file_360');
for (let r=0;r<$img360.length;r++){
	var img = $img360.eq(r).attr('data');
	var id = $img360.eq(r).attr('id');
	six360(id,img);
}  

//

$('.part_js').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	$('.snit_image').hide();
	$('.part_js').removeClass('active');
	$this.addClass('active');
	$(data).show();
});
$('.part_js').eq(0).trigger('click');

$('.trans_js').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	$('.trans_image').hide();
	$('.trans_js').removeClass('active');
	$this.addClass('active');
	$(data).show();
});
$('.trans_js').eq(0).trigger('click');

$('.fren_js').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	$('.fren_image').hide();
	$('.fren_js').removeClass('active');
	$this.addClass('active');
	$(data).show();
});
$('.fren_js').eq(0).trigger('click');

$('.barent').addClass('active');
setTimeout(function(){
	$('.item_presnts').addClass('active');
},1000);