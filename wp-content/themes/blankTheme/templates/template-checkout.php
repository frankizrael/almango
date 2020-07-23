<?php
/* Template Name: checkout woocomeerce */
set_query_var('ENTRY', 'car');
get_header();
?>
<div class="checkout-page">
	<div class="breadcrumb">
		<div class="x-container">
			<ul>
				<li class="" id="cartpage">1. Carrito de compras</li>
				<li class="divisor "><svg xmlns="http://www.w3.org/2000/svg" width="19.999" height="24.596" viewBox="0 0 19.999 24.596"><defs><style>.a{fill:#4b5afc;}</style></defs><g transform="translate(-24 -20)"><path class="a" d="M33,44.6a.946.946,0,0,1-.707-.328,1.213,1.213,0,0,1,0-1.581L41.585,32.3,32.292,21.908a1.213,1.213,0,0,1,0-1.581.927.927,0,0,1,1.414,0l10,11.18a1.213,1.213,0,0,1,0,1.581l-10,11.18A.946.946,0,0,1,33,44.6Zm-7.293-.328,10-11.18a1.212,1.212,0,0,0,0-1.581l-10-11.18a.927.927,0,0,0-1.414,0,1.213,1.213,0,0,0,0,1.581L33.585,32.3,24.293,42.687a1.212,1.212,0,0,0,0,1.581.927.927,0,0,0,1.414,0Z" transform="translate(0 0)"/></g></svg></li>
				<li id="despacho" class="active">2. Despacho de tu pedido</li>
				<li class="divisor active"><svg xmlns="http://www.w3.org/2000/svg" width="19.999" height="24.596" viewBox="0 0 19.999 24.596"><defs><style>.a{fill:#4b5afc;}</style></defs><g transform="translate(-24 -20)"><path class="a" d="M33,44.6a.946.946,0,0,1-.707-.328,1.213,1.213,0,0,1,0-1.581L41.585,32.3,32.292,21.908a1.213,1.213,0,0,1,0-1.581.927.927,0,0,1,1.414,0l10,11.18a1.213,1.213,0,0,1,0,1.581l-10,11.18A.946.946,0,0,1,33,44.6Zm-7.293-.328,10-11.18a1.212,1.212,0,0,0,0-1.581l-10-11.18a.927.927,0,0,0-1.414,0,1.213,1.213,0,0,0,0,1.581L33.585,32.3,24.293,42.687a1.212,1.212,0,0,0,0,1.581.927.927,0,0,0,1.414,0Z" transform="translate(0 0)"/></g></svg></li>
				<li id="confirmation">3. Confirmación de compra</li>
			</ul>
		</div>
	</div>
	<div class="core-page">
		<div class="x-container">
		<?php if (have_posts()):
			while (have_posts()):
				the_post();
				the_content();
			endwhile;
		endif; ?>
		</div>
	</div>
</div>
<?php get_footer();