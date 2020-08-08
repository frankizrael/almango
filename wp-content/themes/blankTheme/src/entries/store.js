import '../scss/store.scss';
import ThreeSixty from '@mladenilic/threesixty.js';
import { TweenMax, CSSPlugin, EasePack, TimelineMax, gsap } from "gsap";
import ScrollMagic from "scrollmagic";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators";


function animateCards($card) {
    $card.on('mousemove', function (e) {
        var x = e.clientX - $(this).offset().left + $(window).scrollLeft();
        var y = e.clientY - $(this).offset().top + $(window).scrollTop();
        
        var rY = map(x, 0, $(this).width(), -10, 10);
        var rX = map(y, 0, $(this).height(), -10, 10);
    
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

function animateValue($obj, start, end, duration) {
    var range = end - start;
    var current = start;
    var increment = end > start? 1 : -1;
    var stepTime = Math.abs(Math.floor(duration / range));
    var timer = setInterval(function() {
        current += increment;
        $obj.html(current);
        if (current == end) {
            clearInterval(timer);
        }
    }, stepTime);
}
function countNumbers($id) {	
	let $eff = $id.find('.effectnumber');
	for (let t=0;t<$eff.length;t++){
		let num = $eff.eq(t).attr('data');
		let point = num.split('.')[0];
		let pushfin = num.split('.')[1];
		animateValue($eff.eq(t), 0, parseInt(point), 5000);
		if (num.split('.').length>1) {
			setTimeout(function(){
				let nub = $eff.eq(t).text();
				let newbal = nub+'.'+pushfin;
				$eff.eq(t).html(newbal)
			},5010);
		}
	}
}

if ($('body').hasClass('single-product')) {
	let controller = new ScrollMagic.Controller();
	let i1 = 0; 
	let i2 = 0; 
	//
	let scene_1 = new ScrollMagic.Scene({
	triggerElement: "#presures"
	})
	.addTo(controller)
	.on("update", function() {
	    let x1 = controller.info("scrollDirection");
	    let x2 = $(window).scrollTop();
	    let x3 = 400;
        if ( x1 == "REVERSE" && x2 >= x3 && i1 == 0) {
            $('#header_2').removeClass('active');
            i1++;
            i2 = 0;
        }
        if ( x1 == "FORWARD" && x2 > x3 && i2 == 0) {
        	$('#header_2').addClass('active');
            i2++;
            i1 = 0;
        }       
	});
	//
	let scene_2 = new ScrollMagic.Scene({
	triggerElement: "#first_tab"
	})
	.on("start", function() {
	    countNumbers($('#first_tab'));
	})
	.addTo(controller);
	//
	let scene_3 = new ScrollMagic.Scene({
	triggerElement: "#second_tab"
	})
	.on("start", function() {
	    countNumbers($('#second_tab'));
	})
	.addTo(controller);
	//
	let scene_3_1 = new ScrollMagic.Scene({
	triggerElement: "#there_tab"
	})
	.on("start", function() {
	    countNumbers($('#there_tab'));
	})
	.addTo(controller);
	//
	let scene_4 = new ScrollMagic.Scene({
	triggerElement: "#dimensiones"
	})
	.setClassToggle('#dimensiones .box', 'animation')
	.addTo(controller);
	//
	let scene_5 = new ScrollMagic.Scene({
	triggerElement: "#dimensiones"
	})
	.setClassToggle('#dimensiones .positionmanejo', 'animation')
	.addTo(controller);
	//
	let scene_6 = new ScrollMagic.Scene({
	triggerElement: "#dimensiones"
	})
	.on("start", function() {
	    countNumbers($('#dimensiones'));
	})
	.addTo(controller);
	//
	let scene_7 = new ScrollMagic.Scene({
	triggerElement: "#videoBanner"
	})
	.setClassToggle('#videoBanner', 'animation')
	.addTo(controller);
	//
	let scene_8 = new ScrollMagic.Scene({
	triggerElement: "#videoBanner"
	})
	.on("start", function() {
		var myVideo = document.getElementById("bannerVideo"); 
	    myVideo.play();
	})
	.addTo(controller);
	//
	// build tween
	var tween = TweenMax.to( $('#bannerVideo') , 0.8, {height: 250,ease: Linear.easeNone});


	// build scene
	var scene_9 = new ScrollMagic.Scene({triggerElement: "#video_content", duration: 300})
					.setTween(tween)
					.setPin("#videoBanner")
					.addTo(controller);

	let scene_10 = new ScrollMagic.Scene({
	triggerElement: "#mirame"
	})
	.setClassToggle('#mirame', 'animation')
	.addTo(controller);

	
}

if ($('body').hasClass('page-template-template-printpdf')) {
	window.onload = function() { window.print(); }
}



$('header').addClass('active2');


$('.woocommerce .widget_price_filter .price_slider_amount .button').html('Filtrar');
$('.content_lead__tab li').on('click',function(){
	let $this = $(this);	
	let img_id = $this.attr('data-imagen');
	let num = $this.attr('data-num');
	$('.content_lead__tab li').removeClass('active');
	$this.addClass('active');
	let margin = 128*parseInt(num);	
	let margin2 = 140*parseInt(num);
	let margin3 = $('#presures').height()*parseInt(num);
	let cssMargin = 'margin-top:-'+margin+'px;';
	let cssMargin2 = 'margin-top:-'+margin2+'px;';
	let cssMargin3 = 'margin-top:-'+margin3+'px;';
	$('.content_lead__title__item').eq(0).attr('style',cssMargin);
	$('.content_lead__content__item').eq(0).attr('style',cssMargin2);
	$('.ventaja_img').eq(0).attr('style',cssMargin3);
});
$('.content_lead__tab li').eq(0).trigger('click');

$('.colors_step').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	let dataspan = $this.attr('data-span');
	let idspan = '#span_'+dataspan;
	$('.colors_step').removeClass('active');
	$this.addClass('active');
	$('.colores_item').removeClass('act');
	let aux = 0;
	setTimeout(function(){
		$('.colores_item').hide();				
		$(data).show();
		$(data).addClass('act');
		//$('.colores_back span').removeClass('switch');
		//$(dataspan).addClass('switch');
	},400);
	for (let t=0;t<$('.colores_back span').length;t++){
		if($('.colores_back span').eq(t).hasClass('ac')) {
			//primer click	
			$('.colores_back span').removeClass('switch');
			$('.colores_back span').removeClass('ac');
			$('.colores_back span').eq(t).addClass('switch');	
			setTimeout(function(){				
				$(idspan).addClass('ac');				
			},300);			
			break;
		} else {
			//segundo click
			aux = 1;
		}
	}
});
$('.colors_step').eq(0).trigger('click');
$('.colores_back span').eq(0).addClass('ac');

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
	$('.part_js').removeClass('active');
	$this.addClass('active');
	$('.snit_image').hide();
	$('.snit_image img').removeClass('imgActive');
	setTimeout(function(){	
		$(data).show();	
		$(data).find('img').addClass('imgActive');
		$(data).find('video').addClass('imgActive');
	},200);
	countNumbers($('#first_tab'));
});
$('.part_js').eq(0).trigger('click');

$('.trans_js').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	$('.trans_image').hide();
	$('.trans_js').removeClass('active');
	$this.addClass('active');
	$('.trans_image img').removeClass('imgActive');
	setTimeout(function(){	
		$(data).show();	
		$(data).find('img').addClass('imgActive');
		$(data).find('video').addClass('imgActive');
	},200);
	countNumbers($('#second_tab'));
});
$('.trans_js').eq(0).trigger('click');

$('.fren_js').on('click',function(){
	let $this = $(this);	
	let data = $this.attr('data');
	$('.fren_image').hide();
	$('.fren_js').removeClass('active');
	$this.addClass('active');
	$('.trans_image img').removeClass('imgActive');
	setTimeout(function(){	
		$(data).show();	
		$(data).find('img').addClass('imgActive');
		$(data).find('video').addClass('imgActive');
	},200);
	countNumbers($('#there_tab'));
});
$('.fren_js').eq(0).trigger('click');

$('.barent').addClass('active');
setTimeout(function(){
	$('.item_presnts').addClass('active');
},1000);

