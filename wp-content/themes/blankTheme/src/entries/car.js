import '../scss/car.scss';
$('.escoger_metodo li').on('click',function(){
	let data = $(this).attr('data-id');
	$('.method_item').hide();
	$(data).show();
});