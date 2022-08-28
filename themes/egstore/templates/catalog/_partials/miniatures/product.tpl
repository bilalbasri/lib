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
{block name='product_miniature_item'}
    <div class="product__card{if $product.has_discount} has-discount{/if}{if array_key_exists('new', $product->getFlags())} new{/if}"
         itemprop="itemListElement"
         itemscope itemtype="https://schema.org/ListItem">

        {if isset($position)}
            <meta itemprop="position" content="{$position}" />
        {/if}

        <article class="product-miniature js-product-miniature"
                 data-id-product="{$product.id_product}"
                 data-id-product-attribute="{$product.id_product_attribute}"
                 itemprop="item"
                 itemscope
                 itemtype="https://schema.org/Product">

            <div class="wishlist-icon">
                {hook h='displayProductListFunctionalButtons' product=$product}
            </div>
            <div class="product__img">
                {if $product.has_discount}
                    <ul class="product-flags">
                        <li class="product-flag promo">{l s="Promotion" d="Shop.Theme.Global"}</li>
                    </ul>
                {/if}
                {include file='catalog/_partials/product-flags.tpl'}
                {block name='product_thumbnail'}
                    {if $product.cover}
                        <a href="{$product.url}" class="thumbnail product-thumbnail">
                            <img
                                src="{$product.cover.bySize.home_default.url}"
                                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                loading="lazy"
                                data-full-size-image-url="{$product.cover.large.url}"
                            />
                        </a>
                    {else}
                        <a href="{$product.url}" class="thumbnail product-thumbnail">
                            <img src="{$urls.no_picture_image.bySize.home_default.url}" loading="lazy" />
                        </a>
                    {/if}
                {/block}
            </div>
            <div class="product__body">
                <div class="product__title">
                    {block name='product_name'}
                        {if $page.page_name == 'index'}
                            <h3 class="h3 product-title" itemprop="name">
                                <a href="{$product.url}" itemprop="url" content="{$product.url}">
                                    {$product.name|truncate:30:'...'}
                                    <span class="product__title--author">{l s="Auréle Vaognes" d="Shop.Theme.Global"}</span>
                                </a>
                            </h3>
                        {else}
                            <h2 class="h3 product-title" itemprop="name">
                                <a href="{$product.url}" itemprop="url" content="{$product.url}">
                                    {$product.name|truncate:30:'...'}
                                    <span class="product__title--author">{l s="Auréle Vaognes" d="Shop.Theme.Global"}</span>
                                </a>
                            </h2>
                        {/if}
                    {/block}
                </div>
                <div class="product__infos">
                    <div class="product__price">
                        {l s="A partir de" d="Shop.Theme.Global"}
                        {block name='product_price_and_shipping'}
                            {if $product.show_price}
                                <div class="product-price-and-shipping">
                                    {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                    <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                                        {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                                        {if '' !== $smarty.capture.custom_price}
                                            {$smarty.capture.custom_price nofilter}
                                        {else}
                                            {$product.price}
                                        {/if}
                                    </span>
                                    {if $product.has_discount}
                                        {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                        <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                                    {/if}
                                    <div itemprop="offers" itemscope itemtype="https://schema.org/Offer" class="invisible">
                                        <meta itemprop="priceCurrency" content="{$currency.iso_code}" />
                                        <meta itemprop="price" content="{$product.price_amount}" />
                                    </div>
                                    {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                                    {hook h='displayProductPriceBlock' product=$product type='weight'}
                                </div>
                            {/if}
                        {/block}
                    </div>
                    {block name='product_availability'}
                        <div class="product__available">
                            {if $product.show_availability && $product.availability_message}
                                {if $product.availability == 'available'}
                                    <span></span> {l s="Disponible" d="Shop.Theme.Global"}
                                {/if}
                            {/if}
                        </div>
                    {/block}
                </div>
                <div class="product__action">
                    <form>
                        <button class="btn btn-primary add-to-cart">{l s="Ajouter au panier" d="Shop.Theme.Global"}</button>
                    </form>
                </div>
            </div>
        </article>
    </div>
{/block}
