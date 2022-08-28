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

{if isset($product.id_product_attribute)}
    {assign var='isShortList' value=EgWishlistProduct::checkProductInShortList($product.id_product)}
    <div class="product-wishlist">
        <a
                id="eg-wishlist-product-btn"
                data-placement="top"
                title="{if $isShortList == 1}{l s='Supprimer des favoris' mod='egwishlist'}{else}{l s='Ajouter au favoris' mod='egwishlist'}{/if}"
                class="btn-egwishlist-add js-egwishlist-add {if $isShortList == 1}egwishlist-added{/if}"
                data-animation="false"
                data-id-product="{$product.id_product}"
                data-id-product-attribute="{$product.id_product_attribute}"
                data-rv-type="{if isset($shortListType) && !empty($shortListType)}{$shortListType}{/if}"
                data-url="{url entity='module' name='egwishlist' controller='actions'}">

                <i class="icon-heart-full added" aria-hidden="true"></i>
                <i class="icon-heart not-added" aria-hidden="true"></i>
            {l s='Ajouter aux favoris' mod='egwishlist'}
        </a>
    </div>
{/if}