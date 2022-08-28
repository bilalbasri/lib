/**
 * 2019 (c) Egio digital
 *
 * MODULE EgWishList
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */

$(document).ready(function () {

	$('.egwishlist-nb').text(egwishlist.nbProducts);

	if (egwishlist.nbProducts == 0) {
		$('.egwishlist-nb').hide();
	}


	$('body').on('click', '.js-egwishlist-add, .btn-egwishlist-add', function (event) {
		var self = this;
		prestashop.emit('clickegWishlistAdd', {
			dataset: self.dataset,
			self: self
		});
		event.preventDefault();
	});

	$('body').on('click', '.js-egwishlist-remove, .egwishlist-added', function (event) {
		var self = this;
		prestashop.emit('clickegWishlistRemove', {
			dataset: self.dataset
		});
		event.preventDefault();
	});

	prestashop.on('clickegWishlistAdd', function (elm) {

		var data = {
			'process': 'add',
			'ajax': 1,
			'idProduct': elm.dataset.idProduct,
			'idProductAttribute': elm.dataset.idProductAttribute
		};

		$.post(elm.dataset.url, data, null, 'json').then(function (resp) {
			$(elm.self).addClass('egwishlist-added');
			// var btnShortList = $('.btn-egwishlist-add[data-id-product="' + elm.dataset.idProduct +'"]');
			// btnShortList.each(function() {
			// 	btnShortList.addClass('egwishlist-added');
			// });
			$('.btn-egwishlist-add[data-id-product="' + elm.dataset.idProduct +'"]').addClass('egwishlist-added');
			$('.js-egwishlist-add[data-id-product="' + elm.dataset.idProduct +'"]').addClass('egwishlist-added');
			if (resp.success) {
				(function () {
					egwishlist.nbProducts++;
					if (egwishlist.nbProducts > 0) {
						$('.egwishlist-nb').show();
					}
					$('.egwishlist-nb').text(egwishlist.nbProducts);

					var $notification = $('#egwishlist-notification');
					$notification.addClass('ns-show');

					setTimeout(function () {
						$notification.removeClass('ns-show');
					}, 3500);
				})();
			}
		}).fail(function (resp) {
			prestashop.emit('handleError', { eventType: 'clickegWishlistAdd', resp: resp });
		});
	});

	prestashop.on('clickegWishlistRemove', function (elm) {

		var data = {
			'process': 'remove',
			'ajax': 1,
			'idProduct': elm.dataset.idProduct,
			'rvType': elm.dataset.rvType,
		};

		$.post(elm.dataset.url, data, null, 'json').then(function (resp) {
			console.log('#egwishlist-product-' + elm.dataset.idProduct);
			$('#egwishlist-product-' + elm.dataset.idProduct).remove();
			egwishlist.nbProducts--;
			$('.btn-egwishlist-add[data-id-product="' + elm.dataset.idProduct +'"]').removeClass('egwishlist-added');
			if (egwishlist.nbProducts == 0) {
				$('.egwishlist-nb').hide();
			}
			$('.egwishlist-nb').text(egwishlist.nbProducts);

			if (egwishlist.nbProducts == 0) {
				$('#egwishlist-warning').removeClass('hidden-xs-up');
				$('#egwishlist-crosseling, #egwishlist-share').addClass('hidden-xs-up');
			}
		}).fail(function (resp) {
			prestashop.emit('handleError', { eventType: 'clickegWishlistRemove', resp: resp });
		});
	});

	prestashop.on('updatedProduct', function (elm) {
		$('.btn-egwishlist-add').data('id-product-attribute', elm.id_product_attribute);
		$('.btn-egwishlist-add').attr('data-id-product-attribute', elm.id_product_attribute);
	});

	$('#egwishlist-clipboard-btn').on('click', function () {

		var $btn = $(this);

		var copyInput = $btn.closest('.input-group').children('input.js-to-clipboard');
		copyInput.select();

		try {
			var successful = document.execCommand('copy');
			if (successful) {
				$btn.text($btn.data('textCopied'));
				setTimeout(function () {
					$btn.text($btn.data('textCopy'));
				}, 1500);
			}
		} catch (err) {
			console.log('Oops, unable to copy');
		}
	});
});

