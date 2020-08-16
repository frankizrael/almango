<div class="whisliContentTitle">
	<h2>Mis favoritos</h2>
</div>
<div class="whisliContent">
	<?php
	if ( $wishlist && $wishlist->has_items() ) :
		foreach ( $wishlist_items as $item ) :
			// phpcs:ignore Generic.Commenting.DocComment
			/**
			 * @var $item \YITH_WCWL_Wishlist_Item
			 */
			global $product;

			$product      = $item->get_product();
			$availability = $product->get_availability();
			$stock_status = isset( $availability['class'] ) ? $availability['class'] : false;

			if ( $product && $product->exists() ) :
				$myid = $item->get_product_id();

				$cat = get_the_terms($myid,'product_cat', array( 'order' => 'DESC'));
				if ($cat) {				
					foreach ($cat as $ta) {						
						if ($ta->parent == 67) {										
							?>
						<div class="imagen_cat">
							<?php $marcaTitle = $ta->name;?>
						</div>
						<?php
						}	
					}
				}


				?>

				<div class="myloopWooProducts">
					<div class="product-remove">
						<div>
							<a href="<?php echo esc_url( add_query_arg( 'remove_from_wishlist', $item->get_product_id() ) ); ?>" class="remove remove_from_wishlist" title="<?php echo esc_html( apply_filters( 'yith_wcwl_remove_product_wishlist_message_title', __( 'Remove this product', 'yith-woocommerce-wishlist' ) ) ); ?>">&times;</a>
						</div>
					</div>
					<div class="ident">
						<a href="<?php echo get_permalink($myid); ?>">
							<?php
								if(is_featured_product($myid) == 0) {					
								$background_side = 'background: transparent radial-gradient(closest-side at 50% 50%, #F9F1E8 0%, #FF9F32 100%) 0% 0% no-repeat padding-box;';
							?>
							<div class="decorative"><img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/rock.png"> Motos de la marca</div>
							<?php
								} else {
								$background_side = 'background: transparent radial-gradient(closest-side at 50% 50%, #4B5AFC 0%, #000000 100%) 0% 0% no-repeat padding-box;';
									?>
							<div class="decorative animationdecoration"><img src="<?php echo get_template_directory_uri(); ?>/src/assets/img/fuego.png"><b>Motos Hot</b></div>
									<?php
								}
							?>
							<div class="myMoto">
								<div class="myMoto__img" style="<?php echo $background_side; ?>">										
									<div class="myMoto__title">
										<h4 data="<?php echo $marcaTitle; ?>"><?php echo $marcaTitle; ?></h4>
									</div>
									<img src="<?php echo get_the_post_thumbnail_url($myid); ?>">
								</div>
								<div class="myMoto__content">
									<?php
										if (get_field('descuento',$myid)) {
									?>
									<div class="desct">
										<span><?php the_field('descuento',$myid); ?></span> DSCTO
									</div>
									<?php
										}
									?>
									<div class="myMoto__tags">
										<?php 
											$tags = get_terms( 'product_tag', $myid);
											if ($tags) {
												foreach ($tags as $ta) {
													?>
													<div class="myTag">
														<a href="<?php echo get_category_link($ta->term_id); ?>">
															<?php echo $ta->name; ?>
														</a>
													</div>
													<?php		
												}
											}
										?>
									</div>
									<div class="myMoto__title">
										<h3><?php echo get_the_title($myid); ?></h3>
										<p><?php the_field('modelo',$myid); ?></p>
									</div>				
									<div class="myMoto_final">
										<div class="myMoto__price">
											<?php
												$product = wc_get_product( $myid );
												echo $product->get_price_html();
											?>
										</div>
										<div class="myMoto__mPrice">
											<span class="pp">Otro medio de pago</span>
											<span class="bb">
												<?php
													$porcentaje = get_field('porcentaje_conversion','options');
													$price = $product->get_price();
													$price_new = $porcentaje*$price;
													echo get_woocommerce_currency_symbol();
													echo asDollars($price_new);
												?>
											</span>
										</div>
										<div class="myMoto__colors">
											<?php
												$colores = get_field('colores', $myid);
												if ($colores) {
													foreach ($colores as $ce) {
												?>
												<div class="color">
													<span style="background:<?php echo $ce['color']; ?>"></span>
												</div>
											<?php
													}
												}
											?>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>


				
			<?php
			endif;
		endforeach;
	else :
	?>
		<tr>
			<td colspan="<?php echo esc_attr( $column_count ); ?>" class="wishlist-empty"><?php echo esc_html( apply_filters( 'yith_wcwl_no_product_to_remove_message', __( 'No products added to the wishlist', 'yith-woocommerce-wishlist' ), $wishlist ) ); ?></td>
		</tr>
	<?php
	endif;

	if ( ! empty( $page_links ) ) :
	?>
		<tr class="pagination-row wishlist-pagination">
			<td colspan="<?php echo esc_attr( $column_count ); ?>"><?php echo $page_links; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?></td>
		</tr>
	<?php endif ?>
</div>



