import "../scss/myaccount.scss";
import datepicker from 'js-datepicker';
import 'js-datepicker/dist/datepicker.min.css';
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
    customDays: ['L', 'M', 'M', 'J', 'V', 'S', 'D'],
    overlayPlaceholder : 'Ingresar un año',
    overlayButton : "Filtrar",
    onSelect : ( instance ,  date )  =>  {   
      let month = date.getMonth()+1;  
      let val = date.getDate() +'/'+ month + '/'+ date.getFullYear();
      $('#user_birthdate').val(val);
    }
  });
}

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