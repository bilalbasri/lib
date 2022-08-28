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
/* eslint-disable */
import 'expose-loader?Tether!tether';
import 'bootstrap/dist/js/bootstrap.min';
import 'flexibility';
import 'bootstrap-touchspin';
import 'jquery-touchswipe';

import prestashop from 'prestashop';
import EventEmitter from 'events';

import './lib/jquery.validate';
import './lib/slick.min';

// import './selectors';
// import './lib/jquery.sticky';
// import './lib/jquery.zoom.min';
// import './lib/jquery.fancybox.min';
// import './lib/svgConvert.min';
// import './responsive';
// import './checkout';
// import './customer';
// import './listing';
// import './cart';
// import DropDown from './components/drop-down';
// import Form from './components/form';
// import ProductMinitature from './components/product-miniature';
// import ProductSelect from './components/product-select';
// import TopMenu from './components/top-menu';
// import './lib/bootstrap-filestyle.min';
// import './lib/jquery.scrollbox.min';
// import './components/block-cart';
// import './components/footer';
// import './components/stickyHeader';
// import './components/svgToPath';


import './components/header';
import './components/slider';

import './product';

import $ from 'jquery';



/* eslint-enable */

// "inherit" EventEmitter
eslint-disable-next-line
for (const i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

$(document).ready(() => {
  const dropDownEl = $('.js-dropdown');
  const form = new Form();
  const topMenuEl = $('.js-top-menu ul[data-depth="0"]');
  const dropDown = new DropDown(dropDownEl);
  const topMenu = new TopMenu(topMenuEl);
  const productMinitature = new ProductMinitature();
  const productSelect = new ProductSelect();
  dropDown.init();
  form.init();
  topMenu.init();
  productMinitature.init();
  productSelect.init();
});
