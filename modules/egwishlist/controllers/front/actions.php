<?php
/**
 * 2019 (c) Egio digital
 *
 * MODULE EgWishList
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */

/**
 * @since 1.5.0
 */
class EgWishlistActionsModuleFrontController extends ModuleFrontController
{
    /**
     * @var int
     */
    public $id_product;
    public $id_product_attribute;
    public $ssl = true;
    public $php_self = 'view';


    public function init()
    {
        parent::init();
        $this->id_product = (int)Tools::getValue('id_product');
        $this->id_product_attribute = (int)Tools::getValue('id_product_attribute');
    }

    public function postProcess()
    {
        if (Tools::getValue('process') == 'remove') {
            $this->processRemove();
        } elseif (Tools::getValue('process') == 'add') {
            $this->processAdd();
        }
    }

    /**
     * Remove a wishlist product.
     */
    public function processRemove()
    {
        header('Content-Type: application/json');

        $context = Context::getContext();
        $rvType = Tools::getValue('rvType');
        $idProduct = (int) Tools::getValue('idProduct');
        $idCustomer = (int) $context->customer->id;
        if ($context->customer->isLogged() && $rvType == 'rv_pr') {
           EgWishListProduct::cleanShortListByIds($idProduct, $idCustomer);
            $this->ajaxDie(json_encode(array(
                'success' => true,
                'data' => [
                    'message' => $this->l('Product removed from wishlist'),
                    'type' => 'removed'
                ]
            )));
        }
        if ($rvType == 'rv_ck') {
            $saved_arr = array();
            if ($this->context->cookie->bcm_short_list != '') {
                $saved_arr = explode(',', $this->context->cookie->bcm_short_list);
            }
            $this->context->cookie->bcm_short_list = implode(',', array_diff($saved_arr, array($idProduct)));
            $this->ajaxDie(json_encode(array(
                'success' => true,
                'data' => [
                    'message' => $this->l('Product removed from wishlist'),
                    'type' => 'removed'
                ]
            )));
        }
    }

    /**
     * Add a shortList product.
     */
    public function processAdd()
    {
        header('Content-Type: application/json');
        $context = Context::getContext();
        $idCustomer = (int)$context->customer->id;
        $idProduct = (int) Tools::getValue('idProduct');
        $idProductAttribute = (int) Tools::getValue('idProductAttribute');
        if ($this->context->cookie->logged) {
            if (!EgWishListProduct::isCustomerWishlistProduct($idCustomer, $idProduct, $idProductAttribute)) {
                $this->addProductToShortlist($idCustomer, $idProduct, $idProductAttribute);
            }
        } else {
            $already_added = $this->getCookieProducts();
            if (!in_array($idProduct, $already_added)) {
                $this->addProductToShortlistByCookie($idProduct);
                $this->ajaxDie(json_encode(array(
                    'success' => true,
                    'data' => [
                        'message' => $this->l('Product added to wishlist'),
                        'type' => 'added'
                    ]
                )));
            }
        }
    }

    private function addProductToShortlist($idCustomer, $idProduct, $idProductAttribute)
    {
        $idShop = (int) Context::getContext()->shop->id;
        $wishlistProduct = new EgWishListProduct();
        $wishlistProduct->id_product = $idProduct;
        $wishlistProduct->id_customer = $idCustomer;
        $wishlistProduct->id_product_attribute = $idProductAttribute;
        $wishlistProduct->id_shop = $idShop;
        if ($wishlistProduct->add()) {
            $this->ajaxDie(json_encode(array(
                'success' => true,
                'data' => [
                    'message' => $this->l('Product added to wishlist'),
                    'type' => 'added'
                ]
            )));
        }
    }

    private function addProductToShortlistByCookie($idProduct)
    {
        $is_added = true;
        if ($is_added) {
            if ($this->context->cookie->bcm_short_list != '') {
                $this->context->cookie->bcm_short_list = $this->context->cookie->bcm_short_list. ',' . $idProduct;
            } else {
                $this->context->cookie->bcm_short_list = $idProduct;
            }
        }

        return $is_added;
    }

    public function getCookieProducts()
    {
        $this->context->cookie->bcm_short_list = trim($this->context->cookie->bcm_short_list);
        $this->context->cookie->bcm_short_list = trim($this->context->cookie->bcm_short_list, ',');
        if ($this->context->cookie->bcm_short_list != '') {
            $egListed = explode(',', $this->context->cookie->bcm_short_list);
        } else {
            $egListed = array();
        }
        return $egListed;
    }
}
