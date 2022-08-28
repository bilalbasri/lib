{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div class="mini-cart-product">
    <div class="box-img">
        {if $product.images}
            <a class="label" href="{$product.url}" title="{$product.name}">
                <img
                        class="product-img"
                        src="{$product.images.0.bySize.small_default.url}"
                        alt="{$product.name}"
                        title="{$product.name}"/>
            </a>
        {/if}

    </div>
    <div class="info">
        <div class="product-name-wrapper">
            <a class="label" href="{$product.url}" title="{$product.name}">
                <span class="product-name">{$product.name|truncate:35:'...'}</span>
            </a>
        </div>
        <a class="eg-remove-from-cart"
           href="javascript:void(0)"
           title="{l s='remove from cart' d='Shop.Theme.Actions'}"
           data-link-url = "{$product.remove_from_cart_url}"
           data-id-product = "{$product.id_product|escape:'javascript'}"
           data-qty-product = "{$product.quantity|escape:'javascript'}"
           data-id-product-attribute = "{$product.id_product_attribute|escape:'javascript'}"
           data-id-customization = "{$product.id_customization|escape:'javascript'}"
        >
            {l s='Remove' d='Shop.Theme.Actions'}
        </a>
    </div>
    <div class="info-price product-prices">
        <div class="amount-minicart">
            {if $product.has_discount}
                <div class="product-discount">
                    {if $product.discount_type === 'percentage'}
                        <span class="discount discount-percentage">
                        {$product.discount_percentage_absolute}
                        </span>
                    {else}
                        <span class="discount discount-amount">
                        {$product.discount_to_display}
                        </span>
                    {/if}
                    <span class="regular-price">{$product.regular_price}</span>
                </div>
            {/if}
            <span class="price {if $product.has_discount}red{/if}">{$product.total}</span>
        </div>
    </div>
</div>

{if $product.customizations|count}
    <div class="customizations">
        <ul>
            {foreach from=$product.customizations item='customization'}
                <li>
                    <span class="product-quantity">{$customization.quantity}</span>
                    <a
                            href="{$customization.remove_from_cart_url}"
                            title="{l s='remove from cart' d='Shop.Theme.Actions'}"
                            class="remove-from-cart"
                            rel="nofollow">{l s='Remove' d='Shop.Theme.Actions'}
                    </a>
                    <ul>
                        {foreach from=$customization.fields item='field'}
                            <li>
                                <span>{$field.label}</span>
                                {if $field.type == 'text'}
                                    <span>{$field.text nofilter}</span>
                                {elseif $field.type == 'image'}
                                    <img src="{$field.image.small.url}">
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}
