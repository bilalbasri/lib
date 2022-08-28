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

<div id="egwishlist-product-{$product.id_egwishlist_product|intval}" class="row egwishlist-product">
    <div class="col-md-12 align-items-center">
        <div class="col-md-2 col-sm-auto">
            <a href="{$product.url}"> <img
                        class="img-fluid"
                        src="{$product.cover.bySize.cart_default.url}"
                        alt="{$product.cover.legend}"
                ></a>
        </div>
        <div class="col-md-2">
            <a href="{$product.url}">{$product.name}</a>
            {if !$readOnly}
                <div class="col col-auto">
                    <a href="#" class="js-egwishlist-remove"
                       data-id-product="{$product.id_egwishlist_product|intval}"
                       data-url="{url entity='module' name='egwishlist' controller='actions'}">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                    </a>
                </div>
            {/if}
        </div>
    </div>
    <hr>
</div>