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
});

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
}



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