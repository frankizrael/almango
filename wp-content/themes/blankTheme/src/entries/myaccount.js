import "../scss/myaccount.scss";
import datepicker from 'js-datepicker';
import 'js-datepicker/dist/datepicker.min.css';

$('header').addClass('active2');


$('.tab_in').on('click',function(){
	let $this = $(this);
	let id = $this.attr('data');
	$('.tab_in').removeClass('active');
	$this.addClass('active');
	$('.closLum__content').removeClass('active');
	$(id).addClass('active');
});

if ($('#user_birthdate').length > 0) {
  console.log('date');
  var picker = datepicker('#user_birthdate', {
    customMonths: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    customDays: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
    overlayPlaceholder : 'Ingresar un año',
    overlayButton : "Filtrar",
    onSelect : ( instance ,  date )  =>  {   
      let month = date.getMonth()+1;  
      let val = date.getDate() +'/'+ month + '/'+ date.getFullYear();
      $('#user_birthdate').val(val);
    }
  });
}

$('.selectMyPedidos p').on('click',function(){
	$('.filterContent').addClass('active');
});
$('.closeFilter').on('click',function(){
	$('.filterContent').removeClass('active');
});
$('.filterContent li').on('click',function(){
	let $this = $(this);
	$this.toggleClass('active');
	$('.itemPedido').hide();
	for (let i=0; i<$('.filterContent li').length;i++){
		let $li = $('.filterContent li').eq(i);
		if ($li.hasClass('active')) {			
			let data = $li.attr('data');	
			$(data).show();
		}
	}	
});



$('.article_tab li').on('click',function(){
	let data = $(this).attr('data');	
	if (data == 'all') {
		$('.article_tab li').removeClass('active');
		$('.article_tab li').eq(0).addClass('active');
		$('.article_desc .dscto_inside').show();
		$('.vip').hide();
	} else {
		$('.article_tab li').removeClass('active');
		$('.article_tab li').eq(1).addClass('active');
		$('.article_desc .dscto_inside').hide();
		$('.vip').show();
	}
});
$('.article_tab li').eq(0).trigger('click');

$('.article_desc_tab li').on('click',function(){
	let $this = $(this);
	let data = $this.attr('data');	
	$('.article_desc_tab li').removeClass('active');
	$this.addClass('active');
	if (data == 'all') {
		$('.article_desc .dscto_inside').show();
	} else {
		$('.article_desc .dscto_inside').hide();
		$('.'+data).show();
	}
});
$('.article_desc_tab li').eq(0).trigger('click');

$('.jsCanjear a').on('click',function(){
	let $this = $(this);
	let data = $this.attr('data');	
	$('.article_top').hide();
	$('.article_bottom').hide();
	$('.principal_change').show();

	$('.insideDetail').hide();
	$(data).show();
});

$('.backend').on('click',function(){	
	$('.article_top').show();
	$('.article_bottom').show();
	$('.principal_change').hide();

	$('.insideDetail').hide();
});



$('.secret').on('click',function(){
	let data = $(this).attr('data');
	if ($(data).hasClass('notsecret')) {
		$(data).attr('type','password');
		$(data).removeClass('notsecret');
	} else {
		$(data).attr('type','text');
		$(data).addClass('notsecret');
	}
});

$('#username').on('blur',function(){
	let username = $('#username').val();
	if (username.length == 8) {
		console.log(username);
		$.ajax({
	        url: urlajax,
	        method: 'get',
	        data: {
	            action: 'sunatlogin',            
	            username: username
	        },
	        beforeSend: function() {
	        	$('#username').addClass('opacity');
	        },
	        success: function (resp) {    
	        	if (resp.length > 0) {
		        	let json = JSON.parse(resp);  
		        	let msj = 'Bienvenido '+json.razon_social+'</br>RUC: '+json.ruc;
		        	$('#msjLog').html(msj);
		        }
	        },
	        complete: function() {
	        	$('#username').removeClass('opacity');
	        }
	    });
	}
});


$('#reg_username').on('blur',function(){
	let username = $('#reg_username').val();
	if (username.length == 8) {
		$.ajax({
	        url: urlajax,
	        method: 'get',
	        data: {
	            action: 'sunatlogin',            
	            username: username
	        },
	        beforeSend: function() {
	        	$('#reg_username').addClass('opacity');
	        },
	        success: function (resp) {  
				console.log(username);  
	        	if (resp.length > 0) {
		        	let json = JSON.parse(resp);  
		        	let msj = 'Bienvenido '+json.razon_social+'</br>RUC: '+json.ruc;
		        	$('#msjReg').html(msj);
		        }
	        },
	        complete: function() {
	        	$('#reg_username').removeClass('opacity');
	        }
	    });
	}
});

$('#account_display_name').on('blur',function(){
	let username = $('#account_display_name').val();
	if (username.length == 8) {
		$.ajax({
	        url: urlajax,
	        method: 'get',
	        data: {
	            action: 'sunatlogin',            
	            username: username
	        },
	        beforeSend: function() {
	        	$('#account_display_name').addClass('opacity');
	        },
	        success: function (resp) {  
				console.log(username);  
	        	if (resp.length > 0) {
		        	let json = JSON.parse(resp);  
		        	let msj = 'Bienvenido '+json.razon_social+'</br>RUC: '+json.ruc;
		        	$('#validDNI').html(msj);
		        }
	        },
	        complete: function() {
	        	$('#account_display_name').removeClass('opacity');
	        }
	    });
	}
});

$('#ruc').on('blur',function(){
	let username = $('#ruc').val();
	if (username.length >= 8) {
		$.ajax({
	        url: urlajax,
	        method: 'get',
	        data: {
	            action: 'sunatlogin',            
	            username: username
	        },
	        beforeSend: function() {
	        	$('#ruc').addClass('opacity');
	        	$('#razon_social').addClass('opacity');					        	
	        },
	        success: function (resp) { 
					console.log(resp);  
	        	if (resp.length > 0) { 
		        	let json = JSON.parse(resp);  
		        	$('#razon_social').val(json.razon_social);
		        	$('#valID').html('RUC Válido');
		        }
	        },
	        complete: function() {
	        	$('#ruc').removeClass('opacity');
	        	$('#razon_social').removeClass('opacity');
	        }
	    });
	}
});



$('.trigger_crear').on('click',function(){
	$('.tab_in').eq(1).trigger('click');
});

$('.backtabuser').on('click',function(){
	$('.tab_in').eq(0).trigger('click');
});


$('.checkin').on('click',function(){
	let $this = $(this);
	$this.toggleClass('active');
	if ($('.checkOne').hasClass('active') && $('.checkTwo').hasClass('active')) {
		$('#registerButton').removeClass('disable');
	}
});


$('.close_modal').on('click',function(){
	let $this = $(this);
	$this.closest('.myModal').removeClass('active');	
});
$('.modalOpen').on('click',function(){
	let $this = $(this);
	let id = $this.attr('data');
	$('.myModal').removeClass('active');	
	$(id).addClass('active');
});

var arrayAns = [];
$('#allstles').on('change',function(){
	let val = $(this).val();
	let index = $('#allstles')[0].selectedIndex;	
	let valueDiv = '<div class="minstl" data="'+val+'" datainx="'+index+'">'+val+'<i></i></div>';
	$('.select_style').append(valueDiv);
	arrayAns = [];
	for (let a=0;a<$('.select_style .minstl').length;a++){
		let data = $('.select_style .minstl').eq(a).attr('data');
		arrayAns.push(data);
	}
	$('#allstles option').eq(index).attr('disabled',true);
	$('#estilos_preferidos').val(arrayAns);
	updateCreatorList();

	$('#allstles').closest('.selectIdent').find('.subMidSelect').removeClass('active');

});


$('.selectOpen').on('click',function(){
	$(this).closest('.selectIdent').find('.subMidSelect').toggleClass('active');
});
$('.radioOpen').on('click',function(){
	$(this).closest('.selectIdent').find('.radioMidSelect').toggleClass('active');
});
$('.redesOpen').on('click',function(){
	$(this).closest('.selectIdent').find('.redesMidSelect').toggleClass('active');
});
$('.radioSelect').on('click',function(){
	let $this = $(this);
	let data = $this.attr('data');
	$('#tienes_moto').val(data);
	$('.radioSelect').removeClass('active');
	$this.addClass('active');
	$('.radioMidSelect').removeClass('active');
});	
$('.redesSelect').on('click',function(){
	let $this = $(this);
	let data = $this.attr('data');
	$('#send_redes_sociales').val(data);
	$('#send_redes_sociales').trigger('change');
	$('.redesSelect').removeClass('active');
	$this.addClass('active');
	$('.redesMidSelect').removeClass('active');
});	

$('#send_redes_sociales').on('change',function(){
	let val = $(this).val();
	let index = $('#send_redes_sociales')[0].selectedIndex;	
	let valueDiv = '<div class="minstl_l" data="'+val+'" datainx="'+index+'">'+val+'<i></i></div>';
	$('.select_style_core').append(valueDiv);
	arrayAns = [];
	for (let a=0;a<$('.select_style_core .minstl_l').length;a++){
		let data = $('.select_style_core .minstl_l').eq(a).attr('data');
		arrayAns.push(data);
	}
	$('#send_redes_sociales option').eq(index).attr('disabled',true);
	$('#redes_sociales').val(arrayAns);

	$('#send_redes_sociales').closest('.selectIdent').find('.redesMidSelect').removeClass('active');

});
$(document).on('click','.minstl_l',function(){
	let $this = $(this);
	let val = $this.attr('data');
	let index = $this.attr('datainx');
	$('#send_redes_sociales option').eq(index).attr('disabled',false);
	arrayAns = [];
	$this.remove();
	for (let a=0;a<$('.select_style_core .minstl_l').length;a++){
		let data = $('.select_style_core .minstl_l').eq(a).attr('data');
		arrayAns.push(data);
	}
	$('#send_redes_sociales').val(arrayAns);
});





function updateCreatorList(){
	$('.subMidSelect').html('');
	for (let i=1;i<$('#allstles option').length;i++){
		let selected = '';
		if ($('#allstles option').eq(i).attr('disabled') == 'disabled') {
			selected = 'selected';
		}
		let data = $('#allstles option').eq(i).attr('data');
		let value = $('#allstles option').eq(i).attr('value');
		let data_image = $('#allstles option').eq(i).attr('data-image');
		let tmpl = '<div class="umiSelect '+selected+'" value="'+value+'">'+data+'<img src="'+data_image+'"></div>';
		$('.subMidSelect').append(tmpl);
	}
	$('.umiSelect').on('click',function(){
		let value = $(this).attr('value');
		$('#allstles').val(value);
		$('#allstles').trigger('change');
	});	
}

updateCreatorList();


$(document).on('click','.minstl',function(){
	let $this = $(this);
	let val = $this.attr('data');
	let index = $this.attr('datainx');
	$('#allstles option').eq(index).attr('disabled',false);
	arrayAns = [];
	$this.remove();
	for (let a=0;a<$('.select_style .minstl').length;a++){
		let data = $('.select_style .minstl').eq(a).attr('data');
		arrayAns.push(data);
	}
	$('#estilos_preferidos').val(arrayAns);
});


let v_array = $('#estilos_preferidos').val();
let v_arrayRedes = $('#redes_sociales').val();
if ($('body').hasClass('woocommerce-edit-account')) {
	$('.myaccount-navigation .link_list').eq(0).find('a').addClass('active');
	if (v_array.length > 1) {
		let sp = v_array.split(',');
		for (let i=0;i<sp.length;i++){
			let value = sp[i];
			$('#allstles').val(value);
			$('#allstles').trigger('change');
		}
	}
	if (v_arrayRedes.length > 1) {
		let sp2 = v_arrayRedes.split(',');
		for (let i=0;i<sp2.length;i++){
			let value = sp2[i];
			$('#send_redes_sociales').val(value);
			$('#send_redes_sociales').trigger('change');
		}
	}
}

//ooohhhh fireee
let valdirection = $('#billing_tipo_direccion').val();
let $new = $('.new_direction');
for (let i=0;i<$new.length;i++){
	let tit = $new.eq(i).find('h4').attr('data-title');
	if (valdirection == tit) {
		$new.eq(i).addClass('active');
	}
}
$('.new_direction .new_flex .left_new i').on('click',function(){
	let $this = $(this);
	let $h4 = $this.closest('.new_direction').find('h4');
	let title = $h4.attr('data-title');
	let direction = $h4.attr('data-direction');
	let reference = $h4.attr('data-reference');
	let lote = $h4.attr('data-lote');
	let dpto = $h4.attr('data-dpto');
	let urb = $h4.attr('data-urb');
	let dep = $h4.attr('data-dep');
	let prov = $h4.attr('data-prov');
	let city = $h4.attr('data-city');	
	$('#billing_tipo_direccion').val(title);
	$('#billing_tipo_direccion').trigger('change');
	$('#billing_address_1').val(direction);
	$('#billing_address_lote').val(lote);
	$('#billing_address_dpto').val(dpto);
	$('#billing_urbanizacion').val(urb);
	$('#billing_provincia').val(prov);
	$('#billing_state').val(dep);
	$('#billing_state').trigger('change');
	$('#billing_city').val(city);
	$('#billing_address_2').val(reference);
	$('.new_direction').removeClass('active');
	$this.closest('.new_direction').addClass('active');
	$('.info').show();
});

$('.close_new_i').on('click',function(){
	let $this = $(this);
	let data = $this.closest('.new_direction').find('h4').attr('data-title');
	let user_id = $('.newflex').attr('data-id');
	$.ajax({
        url: urlajax,
        method: 'get',
        data: {
            action: 'removedirection',  
            id_user: user_id,          
            tipo: data
        },
        success: function (resp) { 
        	console.log(resp);
        	location.reload();
        }
    });
});

$('#editFile').on('change',function(){
	let user_id = $('#editFile').attr('data');
	let $this = $(this);
    let file_data = $(this).prop('files')[0];
    let form_data = new FormData();
    form_data.append('file', file_data);
	form_data.append('user', user_id);	
    form_data.append('action', 'imagen_file_upload');
    $.ajax({
        url: urlajax,
        type: 'POST',
        contentType: false,
        processData: false,
        data: form_data,
        success: function (resp) {
        	console.log(resp); 
        	$('#perfilImg').attr('src',resp);
        }
    });
});