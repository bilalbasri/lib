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

{if isset($id_product_attribute)}
    <div class="eg_wishlist wishlist_btn_top">
        <a href="#" {if !empty($rvType)}data-rv-type="{$rvType}"{/if} class="btn-egwishlist-add js-egwishlist-add {if EgWishListProduct::checkProductInShortList($id_product) === 1}egwishlist-added{/if}"  data-id-product="{$id_product|intval}" data-id-product-attribute="{$id_product_attribute|intval}"
           data-url="{url entity='module' name='egwishlist' controller='actions'}" data-toggle="tooltip" title="{l s='Add to wishlist' mod='egwishlist'}">
            <i class="icon-wishlist-added not-added" aria-hidden="true"></i><i class="icon-wishlist-added added" aria-hidden="true"></i>
        </a>
    </div>
{/if}
