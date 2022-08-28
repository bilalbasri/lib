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

use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;

class EgWishlistViewModuleFrontController extends ModuleFrontController
{
    public function init()
    {
        parent::init();
    }

    public function initContent()
    {
        parent::initContent();

        $engine = new PhpEncryption(_NEW_COOKIE_KEY_);
        $idCustomerToken = '';
        $idLang = (int)Context::getContext()->language->id;
        if (Context::getContext()->customer->isLogged()) {
            $idCustomer = (int)Context::getContext()->customer->id;
            $idCustomerToken = $engine->encrypt($idCustomer);
            $wishlistProducts = EgWishListProduct::getWishlistProducts($idCustomer, $idLang);
            $typeRemove = 'rv_pr';
        } else {
            $wishlistProducts = EgWishListProduct::refreshShortlistData();
            $typeRemove = 'rv_ck';
        }

        $productsIds = array();
        $presenterFactory = new ProductPresenterFactory($this->context);
        $presentationSettings = $presenterFactory->getPresentationSettings();

        $assembler = new ProductAssembler($this->context);
        $presenter = new ProductListingPresenter(
            new ImageRetriever(
                $this->context->link
            ),
            $this->context->link,
            new PriceFormatter(),
            new ProductColorsRetriever(),
            $this->getTranslator()
        );

        $presentedWishlistProducts = array();
        foreach ($wishlistProducts as $item) {
            $productsIds[] = $item['id_product'];
            $presentedWishlistProducts[] = $presenter->present(
                $presentationSettings,
                $assembler->assembleProduct($item),
                $this->context->language
            );
        }

        $this->context->smarty->assign(array(
            'wishlistProducts' => $presentedWishlistProducts,
            'token' => $idCustomerToken,
            'typeRemove' => $typeRemove,
            'readOnly' => false,
        ));

        $this->setTemplate('module:egwishlist/views/templates/front/egwishlist-account.tpl');
    }

    public function getBreadcrumbLinks()
    {
        $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = $this->addMyAccountToBreadcrumb();
        $breadcrumb['links'][] = [
            'title' => $this->module->l('Listes d\'envies','view'),
            'url' => '',
        ];
        return $breadcrumb;
    }
}
