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

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once dirname(__FILE__).'/classes/EgWishListProduct.php';

class EgWishList extends Module implements WidgetInterface
{
    public function __construct()
    {
        $this->name = 'egwishlist';
        $this->version = '1.0.0';
        $this->author = 'Egio digital';
        $this->need_instance = 0;
        $this->bootstrap = true;
        $this->tab = 'front_office_features';
        $this->secure_key = Tools::encrypt($this->name);
        $this->controllers = array('view');

        parent::__construct();
        $this->displayName = $this->l('EG Short List');
        $this->description = $this->l('Allow customers to create Short List which can share.');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        include(dirname(__FILE__).'/sql/install.php');
        return (parent::install()
            && $this->registerHook('header')
            && $this->registerHook('displayNav2')
            && $this->registerHook('displayTop')
            && $this->registerHook('actionProductDelete')
            && $this->registerHook('actionCustomerLogoutBefore')
            && $this->registerHook('actionAuthentication')
            && $this->registerHook('displayAfterProductAddCartBtn')
            && $this->registerHook('displayProductAccessoryInfo')
            && $this->registerHook('displayCustomerAccount')
            && $this->registerHook('displayProductListFunctionalButtons')
            && $this->registerHook('displayEgShortHover')
            && $this->registerHook('displayEgShortListButtons')
            && $this->registerHook('displayBeforeBodyClosingTag')
            && $this->registerHook('registerGDPRConsent')
            && $this->registerHook('actionDeleteGDPRCustomer')
            && $this->registerHook('actionExportGDPRData')
        );
    }

    public function uninstall()
    {
        include(dirname(__FILE__).'/sql/uninstall.php');
        return parent::uninstall();
    }

    public function hookActionCustomerLogoutBefore()
    {
        Context::getContext()->cookie->bcm_short_list = '';
    }

    public function hookActionAuthentication()
    {
        $context = Context::getContext();
        if ($context->cookie->bcm_short_list != '') {
            $shortlisted = explode(',', $context->cookie->bcm_short_list);
        } else {
            $shortlisted = array();
        }

        if (count($shortlisted) > 0) {
            foreach ($shortlisted as $id_product) {
                $wishlistProduct = new EgWishListProduct();
                $wishlistProduct->id_product = $id_product;
                $wishlistProduct->id_customer = $context->customer->id;
                $wishlistProduct->id_shop = $context->shop->id;
                $wishlistProduct->add();
            }
        }
    }
    
    public function hookHeader()
    {
        $this->context->controller->registerStylesheet(
            'modules-'.$this->name.'-style',
            'modules/'.$this->name.'/views/css/front.css',
            ['media' => 'all', 'priority' => 150]
        );

        $this->context->controller->registerJavascript(
            'modules'.$this->name.'-script',
            'modules/'.$this->name.'/views/js/front.js',
            ['position' => 'bottom', 'priority' => 150]
        );

        $idCustomer = (int) Context::getContext()->customer->id;

        if ($this->context->customer->isLogged()) {
            $nbProducts = (int) EgWishListProduct::getWishlistProductsNb($idCustomer);
        } else {
            $nbProducts = (int) $this->countShortlistData();
        }
        Media::addJsDef(array('egwishlist' => [
            'nbProducts' => $nbProducts
        ]));

    }

    function countShortlistData()
    {
        if ($this->context->cookie->bcm_short_list != '') {
            $shortlisted = explode(',', $this->context->cookie->bcm_short_list);
        } else {
            $shortlisted = array();
        }
        return count($shortlisted) ;
    }

    public function hookDisplayProductAccessoryInfo()
    {
        return $this->display(__FILE__, 'views/templates/hook/product-accessory.tpl');
    }

    public function renderWidget($hookName = null, array $configuration = [])
    {
        if ($hookName == null && isset($configuration['hook'])) {
            $hookName = $configuration['hook'];
        }
        $templateFile = 'my-account.tpl';
        if (preg_match('/^displayCustomerAccount\d*$/', $hookName)) {
            $templateFile = 'my-account.tpl';
        } elseif (preg_match('/^displayNav2\d*$/', $hookName) ||
            preg_match('/^displayTop\d*$/', $hookName) ||
            preg_match('/^displayNav\d*$/', $hookName)) {
            $templateFile = 'display-nav.tpl';
        } elseif (preg_match('/^displayBeforeBodyClosingTag\d*$/', $hookName)) {
            $templateFile = 'display-modal.tpl';
        } elseif (preg_match('/^displayHeaderButtons\d*$/', $hookName)) {
            $templateFile = 'display-header-buttons.tpl';
        } elseif (preg_match('/^displayHeaderButtonsMobile\d*$/', $hookName)) {
            $templateFile = 'display-header-buttons-mobile.tpl';
        }  elseif (preg_match('/^displayProductAdditionalInfo\d*$/', $hookName) ||
            preg_match('/^displayEgShortListButtons\d*$/', $hookName) ) {
            $templateFile = 'product-page.tpl';
        } elseif (preg_match('/^displayProductListFunctionalButtons\d*$/', $hookName)) {
            $templateFile = 'product-miniature.tpl';
        } elseif (preg_match('/^displayEgShortHover\d*$/', $hookName)) {
            $templateFile = 'product-miniature.tpl';
        }
        if ($this->context->customer->isLogged()) {
            $rvType = 'rv_pr';
        } else {
            $rvType = 'rv_ck';
        }

        $assign = $this->getWidgetVariables($hookName, $configuration);
        $this->smarty->assign($assign);
        $this->smarty->assign('rvType', $rvType);
        $this->smarty->assign('shortlistCount' , 7);
        $this->smarty->assign('shortListType' , $this->shortListType());
        return $this->fetch('module:' . $this->name . '/views/templates/hook/' . $templateFile);
    }

    public function getWidgetVariables($hookName = null, array $configuration = [])
    {
        if ($hookName == null && isset($configuration['hook'])) {
            $hookName = $configuration['hook'];
        }
        if (preg_match('/^displayBeforeBodyClosingTag\d*$/', $hookName)) {
            if (!Context::getContext()->customer->isLogged()) {
                $form = new CustomerLoginForm(
                    $this->context->smarty,
                    $this->context,
                    $this->getTranslator(),
                    new CustomerLoginFormatter($this->getTranslator()),
                    $this->context->controller->getTemplateVarUrls()
                );
                $form->setAction('index.php?controller=authentication&back=my-account');
                return array(
                    'login_form' => $form->getProxy(),
                );
            }
        } elseif (preg_match('/^displayProductListFunctionalButtons\d*$/', $hookName)) {
            $idProduct = (int) $configuration['smarty']->tpl_vars['product']->value['id_product_attribute'];
            $idProductAttribute = (int) $configuration['smarty']->tpl_vars['product']->value['id_product'];
            if (isset($configuration['smarty'])) {
                return array(
                    'id_product_attribute' => $idProduct,
                    'id_product' => $idProductAttribute,
                    'shortListType' => $this->shortListType(),
                );
            }
        }
    }

    public function shortListType()
    {
        if (Context::getContext()->customer->isLogged()) {
            $typeRemove = 'rv_pr';
        } else {
            $typeRemove = 'rv_ck';
        }
        return $typeRemove;
    }

    public function hookActionDeleteGDPRCustomer($customer)
    {
        if (!empty($customer['id'])) {
            EgWishListProduct::deleteGDPRCustomer($customer['id']);
        }
    }

    public function hookActionExportGDPRData($customer)
    {
        if (!empty($customer['id'])) {
            if ($res = EgWishListProduct::getIdProduct($customer['id'])) {
                $arr = array();
                foreach ($res as $key => $val) {
                    $arr[] = $val['id_product'];
                }
                $productsIds = implode(",",  $arr);
                $items = EgWishListProduct::getItemsProduct($productsIds);
                return json_encode($items);
            }
        }
    }
}
