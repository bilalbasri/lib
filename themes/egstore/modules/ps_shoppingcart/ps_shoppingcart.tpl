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

<div id="_desktop_cart">
    <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
        <div class="full header">
            {assign var='isMobile' value=Context::getContext()->isMobile()}
            <a rel="nofollow" href="{$cart_url}" class="link {if !$isMobile}show-mini-cart{/if}">
                <span class="icon-cart">
                    {if $cart.products_count > 0}
                        <span class="cart-products-count">{$cart.products_count}</span>
                    {/if}
                </span>
                <div class="hidden-sm-down cart-name">{l s='Cart' d='Shop.Theme.Checkout'}</div>
            </a>
        </div>
        {if !$isMobile }
            <div class="body body-mini-cart">
                <span class="close"></span>
                <div class="mini-cart-top">
                    {if $cart.products_count < 1}
                        <p class="title_panier">{l s="Cart" d='Shop.Theme.Actions'}</p>
                    {else}
                        <p class="title_panier">
                            <span>{l s="Your cart contains" d='Shop.Theme.Actions'}</span>
                            <span class="title_panier_count">{$cart.products_count}</span>
                            <span>{if $cart.products_count > 1}{l s="items" d='Shop.Theme.Actions'}{else}{l s="item" d='Shop.Theme.Actions'}{/if}</span>
                        </p>
                    {/if}
                </div>
                <div class="mini-cart-middle">
                    {if $cart.products_count < 1}
                        <div class="empty-cart"><p>{l s="Your cart is empty" d='Shop.Theme.Actions'}</p></div>
                        <div class="fill-cart">
                            <p>{l s="Fill it with the new collection!" d='Shop.Theme.Actions'}</p>
                        </div>
                    {else}
                        <ul class="product-line-bloc eg-dropdown-list-item">
                            {foreach from=$cart.products item=product}
                                <li class="product-line eg-dropdown-cart-item">
                                    {include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
                                </li>
                            {/foreach}
                        </ul>
                    {/if}
                </div>

                <div class="mini-cart-footer">
                    {if $cart.products_count > 0 }
                        <div class="cart-total">
                            <span class="label">{l s='Subtotal' d='Shop.Theme.Actions'}{*{$cart.totals.total.label}*}</span>
                            <span class="value">{$cart.totals.total.value}</span>
                        </div>
                    {/if}
                    <div class="button_panier">
                        <a
                                href="{$cart_url}"
                                class="btn">
                            {if $cart.products_count > 0 }
                            {l s='View my cart' d='Shop.Theme.Actions'}
                            {else}
                            {l s='Continue shopping' d='Shop.Theme.Actions'}
                            {/if}
                        </a>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>
