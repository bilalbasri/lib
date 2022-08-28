{*
 * 2019 (c) Egio digital
 *
 * MODULE EgWishList
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */
*}

{extends file='customer/page.tpl'}

{block name='page_header_container'}
    {if $readOnly}
        <header class="page-header">
            <h1 class="h1 page-title"><span>{l s='Wishlist' mod='egwishlist'}</span></h1>
        </header>
        {else}
        {$smarty.block.parent}
    {/if}
{/block}


{block name='page_title'}
    {if !$readOnly}
        {l s='Wishlist' mod='egwishlist'}
    {/if}
{/block}

{block name='page_content'}
    {if isset($wishlistProducts) && $wishlistProducts}
        <div id="egwishlist-user-products" class="mb-4">
            {foreach from=$wishlistProducts item="wishlistProduct"}
                {include 'module:egwishlist/views/templates/front/egwishlist-product.tpl' product=$wishlistProduct}
{*                {include file="catalog/_partials/miniatures/product.tpl" product=$wishlistProduct}*}
            {/foreach}
        </div>
        <p class="alert alert-warning hidden-xs-up" id="egwishlist-warning">
            {l s='Your wishlist is empty' mod='egwishlist'}
        </p>
        {if isset($crosselingProducts) && $crosselingProducts}
            <section id="egwishlist-crosseling" class="featured-products clearfix mt-4">
                <h3>{l s='Customers who bought this product(s) also bought:' mod='egwishlist'}</h3>
                <div class="products slick-products-carousel products-grid slick-default-carousel">
                    {foreach from=$crosselingProducts item="product"}
                        {include file="catalog/_partials/miniatures/product.tpl" product=$product carousel=true}
                    {/foreach}
                </div>
            </section>
        {/if}
    {else}
        <p class="alert alert-warning">{l s='Your wishlist is empty' mod='egwishlist'}</p>
    {/if}
{/block}



