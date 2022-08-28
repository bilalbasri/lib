/**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 */
import $ from 'jquery';
import prestashop from 'prestashop';

function checkoutSteps() {
  var $gris_step = $('.steps-grid .ul_steps');
  /*steps checkout*/
  $(".checkout-step .step-title").each(function () {
    var title_step = $(this).clone().children().remove().end().text().trim();
    var step = $(this).find("span.titre").text();

    if (!$(this).parent().hasClass('-reachable')) {
      $("<li class='step'><span>" + step + "</span><i></i></li>").appendTo($gris_step);
    } else {
      $("<li class='step-active'><span>" + step + "</span><i></i></li>").appendTo($gris_step);
    }
  });

  $("input:checkbox[name='conditions_to_approve[terms-and-conditions]']").change(function () {
    if ($(this).is(':checked') === false) {
      $('.need-agreement').removeClass('hide');
    } else {
      $('.need-agreement').addClass('hide');
    }
  });

}

function setUpCheckout() {
  $(prestashop.themeSelectors.checkout.termsLink).on('click', (event) => {
    event.preventDefault();
    let url = $(event.target).attr('href');

    if (url) {
      // TODO: Handle request if no pretty URL
      url += '?content_only=1';
      $.get(url, (content) => {
        $(prestashop.themeSelectors.modal)
          .find(prestashop.themeSelectors.modalContent)
          .html($(content).find('.page-cms').contents());
      }).fail((resp) => {
        prestashop.emit('handleError', {
          eventType: 'clickTerms',
          resp
        });
      });
    }

    $(prestashop.themeSelectors.modal).modal('show');
  });

  $(prestashop.themeSelectors.checkout.giftCheckbox).on('click', () => {
    $('#gift').collapse('toggle');
  });
}

function toggleImage() {
  // Arrow show/hide details Checkout page
  $(prestashop.themeSelectors.checkout.imagesLink).on('click', function () {
    const icon = $(this).find('i.material-icons');

    if (icon.text() === 'expand_more') {
      icon.text('expand_less');
    } else {
      icon.text('expand_more');
    }
  });
}

$(document).ready(() => {
  if ($('body#checkout').length === 1) {
    setUpCheckout();
    toggleImage();
    checkoutSteps();
  }

  prestashop.on('updatedDeliveryForm', (params) => {
    if (typeof params.deliveryOption === 'undefined' || params.deliveryOption.length === 0) {
      return;
    }
    // Hide all carrier extra content ...
    $(prestashop.themeSelectors.checkout.carrierExtraContent).hide();
    // and show the one related to the selected carrier
    params.deliveryOption.next(prestashop.themeSelectors.checkout.carrierExtraContent).slideDown();
  });
});