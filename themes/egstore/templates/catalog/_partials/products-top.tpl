{**
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
 *}
<div id="js-product-list-top" class="row products-selection">
    <div class="col-md-6 total-products">
        {if $listing.pagination.total_items > 1}
            <div>{l s='%product_count% products found' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}</div>
        {elseif $listing.pagination.total_items > 0}
            <div>{l s='1 products found' d='Shop.Theme.Catalog'}</div>
        {/if}
    </div>
    <div class="col-md-6">
        {block name='sort_by'}
            {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}
        {if !empty($listing.rendered_facets)}
            <div class="col-sm-3 col-xs-4 hidden-md-up filter-button">
                <button id="search_filter_toggler" class="btn btn-secondary">
                    {l s='Sort by:' d='Shop.Theme.Global'}
                </button>
            </div>
        {/if}
    </div>
</div>
