import '../scss/car.scss';
import "swiper/dist/css/swiper.css";
import Swiper from "swiper";
import datepicker from 'js-datepicker';
import 'js-datepicker/dist/datepicker.min.css';

$('header').addClass('active-2');

function addDays(date, days) {
  const copy = new Date(Number(date))
  copy.setDate(date.getDate() + days)
  return copy
}

let today = new Date();
let bday = addDays(today,3);

if ($('#calendarDomicilio').length > 0) {
  var picker = datepicker('#calendarDomicilio', {
    customMonths: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    customDays: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
    overlayPlaceholder : 'Ingresar un año',
    overlayButton : "Filtrar",
    noWeekends: true,
    minDate: bday,
    onSelect : ( instance ,  date )  =>  {   
      let month = date.getMonth()+1;  
      let val = date.getDate() +'/'+ month + '/'+ date.getFullYear();
      $('#calendarDomicilio').val(val);
    }
  });
}

if ($('#calendarDomicilio2').length > 0) {
  var picker = datepicker('#calendarDomicilio2', {
    customMonths: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    customDays: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
    overlayPlaceholder : 'Ingresar un año',
    overlayButton : "Filtrar",
    noWeekends: true,
    minDate: bday,
    onSelect : ( instance ,  date )  =>  {   
      let month = date.getMonth()+1;  
      let val = date.getDate() +'/'+ month + '/'+ date.getFullYear();
      $('#calendarDomicilio2').val(val);
    }
  });
}

$('#add_ruc').on('blur',function(){
	let username = $('#add_ruc').val();
	if (username.length >= 8) {
		$.ajax({
	        url: urlajax,
	        method: 'get',
	        data: {
	            action: 'sunatlogin',            
	            username: username
	        },
	        beforeSend: function() {
	        	$('#add_ruc').addClass('opacity');
	        	$('#add_raz_social').addClass('opacity');					        	
	        },
	        success: function (resp) { 
					console.log(resp);  
	        	if (resp.length > 0) { 
		        	let json = JSON.parse(resp);  
		        	$('#add_raz_social').val(json.razon_social);
		        	$('#valID').html('RUC Válido');
		        }
	        },
	        complete: function() {
	        	$('#add_ruc').removeClass('opacity');
	        	$('#add_raz_social').removeClass('opacity');
	        }
	    });
	}
});



$('.escoger_metodo li').on('click',function(){	
	let data = $(this).attr('data-id');
	$('.escoger_metodo li').removeClass('active');
	$(this).addClass('active');
	$('.method_item').hide();	
	$(data).show();
});

$('.more_inf').on('click',function(e){
	e.preventDefault();
	let $this = $(this);
	$this.closest('.item_additional').find('.information').addClass('active');
});
$('.close-inf').on('click',function(){
	let $this = $(this);
	$this.closest('.information').removeClass('active');
});

$('.inbox_check input').on('change',function(){
	let $this = $(this);
	let product_id = $this.attr('data');
	let padre_id = $this.attr('id-prod');
	let sexy_id = 'additional_'+product_id+'_'+padre_id;
	if ($this.is('checked')) {
		console.log('ño');
	} else {		
		$.ajax({
	        url: urlajax,
	        method: 'get',
	        data: {
	            action: 'addproducto',            
	            product_id: product_id
	        },
	        success: function (resp) {            	
	        	localStorage.setItem(sexy_id,'active');
	        	location.reload();        	
	        }
	    });		
	}
});


$(document).on('click','.colors_step',function(){
	let $this = $(this);
	let data = $this.attr('data');
	let prod_id = $('.colores_tag').attr('data-id');
	$this.closest('.addtionalContent').find('.colors_step').removeClass('active');
	$this.addClass('active');
	localStorage.setItem(prod_id+'_color',data);
});

for(let t=0;t<$('.addtionalContent').length;t++){
	$('.addtionalContent').eq(t).find('.colors_step').eq(0).trigger('click');
}

$(document).on('click','.cupone_f button',function(e){
	e.preventDefault();
	$('#coupon_code').val($('.cupone_f input').val());
	$('.coupon button').click();
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

var swipermy_products_featureds = new Swiper(".my_products_featureds .swiper-container", {
  slidesPerView: 4,
  navigation: {
      nextEl: '.my_products_featureds .swiper-button-next',
      prevEl: '.my_products_featureds .swiper-button-prev',
    },
});

//checkout
$('.editData a').on('click',function(){
	let $this = $(this);
	$('#customer_details').toggle();
});

$('.solFactura').on('click',function(){
	$('.facturaFields').toggle();
});

$('.addFacture').on('click',function(){
	let add_ruc = $('#add_ruc').val();
	let add_raz_social = $('#add_raz_social').val();
	let id = $('.addFacture').attr('id-use');
	if (add_ruc.length > 0) {
		if (add_raz_social.length > 0) {
			$.ajax({
		        url: urlajax,
		        method: 'get',
		        data: {
		            action: 'addfacture',            
		            id_user: id,
		            add_ruc: add_ruc,
		            add_raz_social: add_raz_social
		        },
		        success: function (resp) {            	
		        	console.log(resp);       	
		        }
		    });				
		}
	}
});

$('.escoger_metodo li').eq(0).trigger('click');