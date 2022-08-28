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
{extends file=$layout}

{block name='head' append}
    <meta property="og:type" content="product">
    <meta property="og:url" content="{$urls.current_url}">
    <meta property="og:title" content="{$page.meta.title}">
    <meta property="og:site_name" content="{$shop.name}">
    <meta property="og:description" content="{$page.meta.description}">
    {if $product.cover}
        <meta property="og:image" content="{$product.cover.large.url}">
    {/if}

    {if $product.show_price}
        <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
        <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
        <meta property="product:price:amount" content="{$product.price_amount}">
        <meta property="product:price:currency" content="{$currency.iso_code}">
    {/if}
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}">
        <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
{/block}

{block name='content'}

    <section id="main" itemscope itemtype="https://schema.org/Product">
        <meta itemprop="url" content="{$product.url}">

        <div class="product-container">
            <div class="product__media">
                {block name='page_content_container'}
                    <section class="page-content" id="content">
                        {block name='page_content'}
                            <div class="product__flags">
                                {if $product.has_discount}
                                    <li class="product-flag promo">{l s="Promotion" d="Shop.Theme.Global"}</li>
                                {/if}
                                {include file='catalog/_partials/product-flags.tpl'}
                            </div>
                            {block name='product_cover_thumbnails'}
                                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                            {/block}
                        {/block}
                    </section>
                {/block}
            </div>
            <div class="product__info">
                {block name='page_header_container'}
                    {block name='page_header'}
                        <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                    {/block}
                {/block}
                {block name='product_prices'}
                    {include file='catalog/_partials/product-prices.tpl'}
                {/block}
                <div class="product-information">
                    {block name='product_description_short'}
                        <div id="product-description-short-{$product.id}" class="product-description" itemprop="description">{$product.description_short nofilter}</div>
                    {/block}
                    {if $product.is_customizable && count($product.customizations.fields)}
                        {block name='product_customization'}
                            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                        {/block}
                    {/if}
                    <div class="product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
                                {block name='product_variants'}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                {/block}
                                {block name='product_pack'}
                                    {if $packItems}
                                        <section class="product-pack">
                                            <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                                            {foreach from=$packItems item="product_pack"}
                                                {block name='product_miniature'}
                                                    {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                                                {/block}
                                            {/foreach}
                                        </section>
                                    {/if}
                                {/block}
                                {block name='product_discounts'}
                                    {include file='catalog/_partials/product-discounts.tpl'}
                                {/block}
                                {block name='product_add_to_cart'}
                                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                                {/block}
                                {block name='product_additional_info'}
                                    {include file='catalog/_partials/product-additional-info.tpl'}
                                {/block}
                                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                                {block name='product_refresh'}{/block}
                            </form>
                        {/block}
                    </div>
                    {block name='hook_display_reassurance'}
                        {hook h='displayReassurance'}
                    {/block}
                </div>
            </div>
        </div>
        <div class="product__content">
            {block name='product_description'}
                <div class="product__content--card product__content--description">
                    <div class="product__content--card--title">
                        <h3>{l s='Résumé' d='Shop.Theme.Catalog'}</h3>
                    </div>
                    <div id="myDIV" class="product__content--card--body show_less " >
                        {$product.description nofilter}
                    </div>
                    <div class="product__content--card--action" id="right_content_container">
                        <a href="javascript:void(0)" id="show_more_right">
                            {l s='Voir Plus' d='Shop.Theme.Catalog'}<i class="material-icons add">keyboard_arrow_down</i>
                        </a>
                    </div>
                </div>
            {/block}
            <div class="product__content--card product__content--features">
                {block name='product_details'}
                    <div class="product__content--card--title">
                        <h3>{l s='Caractéristiques' d='Shop.Theme.Catalog'}</h3>
                    </div>
                    <div class="product__content--card--body">
                        {include file='catalog/_partials/product-details.tpl'}
                    </div>
                {/block}
            </div>
            <div class="product__content--card product__content--author">
                <div class="product__content--card--title">
                    <h3>{l s='Auteur' d='Shop.Theme.Catalog'}</h3>
                </div>
                <div class="product__content--card--body">
                    <div class="author">
                        <div class="author--img">
                            <img width="180" height="120" src="https://picsum.photos/200/300?grayscale" alt="imgauteur" loading="lazy">
                            <div class="author--name">
                                <span>{l s='Biographie'}</span>
                                <h4>{l s='Valéie Perrin' d='Shop.Theme.Catalog'}</h4>
                            </div>
                        </div>
                        <div id="divauthor" class="author--description show_less">
                            <p>{l s='Photographe et scénariste, Valérie Perrin a conquis le public dès son premier roman, Les oubliés du dimanche (salué par de nombreux prix dont celui de Lire Elire 2016 et de Poulet-Malassis 2016). Son deuxième roman, Changer l\'eau des fleurs, a été Choix des libraires 2018 au Livre de Poche et a reçu le prix des Maisons de la Presse 2018.' d='Shop.Theme.Catalog'}</p>
                        </div>
                    </div>
                </div>
                <div class="product__content--card--action" id="left_content_container">
                <a href="javascript:void(0)" id="show_more_left">
                            {l s='Voir Plus' d='Shop.Theme.Catalog'}<i id="btnicon" class="material-icons add">keyboard_arrow_down</i>
                        </a>

                </div>
            </div>
        </div>


            {block name='product_attachments'}
                {if $product.attachments}
                    <section class="product-attachments">
                        <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                        {foreach from=$product.attachments item=attachment}
                            <div class="attachment">
                                <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                                <p>{$attachment.description}</p>
                                <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                    {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                </a>
                            </div>
                        {/foreach}
                    </section>
                {/if}
            {/block}
            {foreach from=$product.extraContent item=extra key=extraKey}
                <div class="{$extra.attr.class}" id="extra-{$extraKey}"
                    {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                    {$extra.content nofilter}
                </div>
            {/foreach}
        </div>

        {block name='product_accessories'}
            {if $accessories}
                <section class="featured-products clearfix product-accessories">
                    <h2 class="custom-title">
                        <span class="title-light">
                            {l s='You might also like' d='Shop.Theme.Catalog'}
                        </span>
                    </h2>
                    <div class="products" itemscope itemtype="https://schema.org/ItemList">
                        {foreach from=$accessories item="product_accessory" key="position"}
                            {block name='product_miniature'}
                                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position}
                            {/block}
                        {/foreach}
                    </div>
                </section>
            {/if}
        {/block}

        {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
            <footer class="page-footer">
                {block name='page_footer'}
                    <!-- Footer content -->
                {/block}
            </footer>
        {/block}
    </section>

    {include file='catalog/_partials/product-popup.tpl'}

{/block}
