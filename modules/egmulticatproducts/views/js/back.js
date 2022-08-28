/**
 * 2007-2019 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author    PrestaShop SA <contact@prestashop.com>
 *  @copyright 2007-2019 PrestaShop SA
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 *
 * Don't forget to prefix your containers with your own identifier
 * to avoid any conflicts with others containers.
 */


$(document).ready(function() {
    var selectedHook = $('select.hook-blocs option:selected').val();
    if (selectedHook === "displayNavFullWidth") {
        hideFields(['icon', 'link', 'target']);
    } else if (selectedHook === "displayFooterBefore") {
        hideFields(['link', 'target']);
    } else if (selectedHook === "displayLeftColumn" || this.value === "displayContactUs") {
        hideFields(['link', 'target']);
    }  else if (selectedHook === "displayHome") {
        hideFields(['description']);
    }  else if (this.value === "displayProductAdditionalInfoRight") {
        hideFields(['link', 'target']);
    }  else if (this.value === "displayProductAdditionalInfo") {
        hideFields(['link', 'target']);
    } else {
        resetFields();
    }
    $('select.hook-blocs').on('change', function() {
        resetFields();
        if (this.value === "displayNavFullWidth") {
            hideFields(['icon', 'link', 'target']);
        } else if (this.value === "displayFooterBefore") {
            hideFields(['link', 'target']);
        } else if (this.value === "displayLeftColumn" || this.value === "displayContactUs") {
            hideFields(['link', 'target']);
        }  else if (this.value === "displayHome") {
            hideFields(['description']);
        }  else if (this.value === "displayProductAdditionalInfoRight") {
            hideFields(['link', 'target']);
        }  else if (this.value === "displayProductAdditionalInfo") {
            hideFields(['link', 'target']);
        } else {
            resetFields();
        }
    });

    function resetFields() {
        $('.icon-blocs').parents('.form-group').show();
        $('.link-blocs').parents('.form-group').show();
        $('.target-blocs').parents('.form-group').show();
        $('.description-blocs').parents('.form-group').show();
    }

    function hideFields(fields) {
        fields.forEach(element => $('.' + element + '-blocs').parents('.form-group').hide());
    }
});