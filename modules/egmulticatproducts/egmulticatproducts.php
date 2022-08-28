<?php
/**
 * 2020  (c)  Egio digital
 *
 * MODULE EgAdvancedMenu
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */

if (!defined('_PS_VERSION_')) {
    exit;
}
use PrestaShop\PrestaShop\Core\Module\WidgetInterface;
include_once(dirname(__FILE__) . '/classes/EgmulticatproductsClass.php');
include_once(dirname(__FILE__) . '/classes/EgmulticatproductsBloc.php');
use PrestaShop\PrestaShop\Adapter\Category\CategoryProductSearchProvider;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\SortOrder;
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;
class Egmulticatproducts extends Module implements WidgetInterface
{
    protected $_html = '';
    protected $templateFile;
    protected $domain;
    protected $img_path;

    public function __construct()
    {
        $this->name = 'egmulticatproducts';
        $this->version = '1.0.0';
        $this->tab = 'front_office_features';
        $this->author = 'Egio digital';
        $this->need_instance = 0;
        $this->secure_key = Tools::encrypt($this->name);
        $this->bootstrap = true;
        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);

        parent::__construct();

        $this->domain = 'Modules.Egmulticatproducts.Egmulticatproducts';
        $this->displayName = $this->trans('Eg MulticatProducts', array(), $this->domain);
        $this->description = $this->trans('Display MulticatProducts', array(), $this->domain);

        $this->confirmUninstall = $this->trans('Are you sure you want to uninstall?', array(), $this->domain);
        $this->img_path = $this->_path.'views/img/';
        $this->templateFile = [
            
            'displayHome' => 'module:egmulticatproducts/views/templates/hook/egmulticatproducts.tpl'
        ];
    }

    /**
     * @see  CREATE TAB module in Dashboard
     */
    public function createTabs()
    {
        $idParent = (int) Tab::getIdFromClassName('AdminEgDigital');
        if (empty($idParent)) {
            $parent_tab = new Tab();
            $parent_tab->name = array();
            foreach (Language::getLanguages(true) as $lang) {
                $parent_tab->name[$lang['id_lang']] = $this->l('Modules EGIO');
            }
            $parent_tab->class_name = 'AdminEgDigital';
            $parent_tab->id_parent = 0;
            $parent_tab->module = $this->name;
            $parent_tab->icon = 'library_books';
            $parent_tab->add();
        }

        $tab = new Tab();
        $tab->name = array();
        foreach (Language::getLanguages(true) as $lang) {
            $tab->name[$lang['id_lang']] = $this->l('EG MultiCatProducts');
        }
        $tab->class_name = 'AdminEgmulticatproducts';
        $tab->id_parent = (int)Tab::getIdFromClassName('AdminEgDigital');
        $tab->module = $this->name;
        $tab->icon = 'library_books';
        $tab->add();
        $tabBloc = new Tab();
        $tabBloc->name = array();
        foreach (Language::getLanguages(true) as $lang) {
            $tabBloc->name[$lang['id_lang']] = $this->trans('EG MultiCatProducts', array(), $this->domain);
        }
        $tabBloc->class_name = 'AdminEgmulticatproductsBloc';
        $tabBloc->id_parent = (int) Tab::getIdFromClassName('AdminEgDigital');
        $tabBloc->module = $this->name;
        $tabBloc->active = false;
        $tabBloc->icon = 'library_books';
        $tabBloc->add();


        return true;
    }

    /**
     * Remove Tabs module in Dashboard
     * @param $class_name string name Tab
     * @return bool
     * @throws
     * @throws
     */
    public function removeTabs($class_name)
    {
        if ($tab_id = (int)Tab::getIdFromClassName($class_name)) {
            $tab = new Tab($tab_id);
            $tab->delete();
        }
        return true;
    }

    /**
     * @see Module::install()
     */
    public function install(): bool
    {
        include(dirname(__FILE__).'/sql/install.php');

        return parent::install()
            && $this->createTabs()
            && $this->registerHook('header')
            && $this->registerHook('displayEgmulticatproducts')
            && $this->registerHook('displayLeftColumn')
            && $this->registerHook('backOfficeHeader')
            && $this->registerHook('displayCategory')
            && $this->registerHook('displayHome');
            
    }

    /**
     * @see Module::uninstall()
     */
    public function uninstall(): bool
    {
        include(dirname(__FILE__).'/sql/uninstall.php');
        $this->removeTabs('AdminEgInformation');
        return parent::uninstall();
    }

    public function isUsingNewTranslationSystem(): bool
    {
        return true;
    }

    public function hookHeader()
    {
        $this->context->controller->addCSS($this->_path.'views/css/category.css');
    }

    /**
     * Add the CSS & JavaScript files you want to be loaded in the BO.
     */
    public function hookBackOfficeHeader()
    {
        $this->context->controller->addCSS($this->_path.'views/css/back.css');
        $this->context->controller->addJs($this->_path.'views/js/back.js');
    }

    public function clearCache()
    {
        $this->_clearCache($this->templateFile['displayLeftColumn']);
    }

    public function renderWidget($hookName = null, array $configuration = [])
    {
        if (empty($hookName)) {
            $hookName = 'displayLeftColumn';
        }
        if (empty($this->templateFile[$hookName])) {
            $this->templateFile[$hookName] = $this->templateFile['displayHome'];
        }
        $this->clearCache();
        if (!$this->isCached($this->templateFile[$hookName], $this->getCacheId('egmulticatproducts'))) {
            $variables = $this->getWidgetVariables($hookName, $configuration);

            if (empty($variables)) {
                return false;
            }

            $this->smarty->assign($variables);
        }

        return $this->fetch($this->templateFile[$hookName], $this->getCacheId('egmulticatproducts'));
    }

    /**
     * @param null $hookName
     * @param array $configuration
     * @return array|false
     * @throws PrestaShopDatabaseException
     * {hook h='DisplayHome'}
     */
    public function hookDisplayHome()
    {  
        $blocs =  EgmulticatproductsClass::getData();
        $egmulticatproductsbloc = new EgmulticatproductsBloc();
        $prod = [];
        foreach ($blocs as $key => $bloc) {
            $blocs[$key]['products'] = [];
            $id_bloc = $bloc['id_eg_multicat_products'];
            $categs = EgmulticatproductsClass::getCategs($id_bloc);
            if($categs) {
                foreach ($categs as $key => $categ) {
                    $id_category = $categ['id_category'];
                    $nbr = $categ['nbr'];
                    $ps = egmulticatproducts::getProducts($id_category,$nbr);
                    if($ps) {
                        foreach ($ps as $key => $p) {
                           $prod[$id_bloc]['products'][] = $p;
                        }
                    }
                }
            }
        }
        $this->context->smarty->assign([ 
            'blocs' => $blocs,
            'prod' => $prod,
            
        ]);
        return $this->display(__FILE__, 'views/templates/hook/egmulticatproducts.tpl');
        


    }
    
    protected function getProducts($cat=0, $nbr=12)
    {         
        $egmulticatproductsbloc = new EgmulticatproductsBloc();
        $id = $egmulticatproductsbloc ->getIdcategory();
        if($cat) {
            $id = $cat;
        }
        $category = new Category($id);
        
        
        $searchProvider = new CategoryProductSearchProvider(
            $this->context->getTranslator(),
            $category
        );
        $context = new ProductSearchContext($this->context);

        $query = new ProductSearchQuery();

        $nProducts =  $nbr;//EgmulticatproductsBloc::getNbr('nbr');
       
        if ($nProducts < 0) {
            $nProducts = 12;
        }
        
        $query  
            ->setResultsPerPage($nProducts)
            ->setPage(1)
        ;

        if (EgmulticatproductsBloc::getData('active')) {
            $query->setSortOrder(SortOrder::random());
        } else {
            $query->setSortOrder(new SortOrder('product', 'position', 'asc'));
        }

        $result = $searchProvider->runQuery(
            $context,
            $query
        );

        $assembler = new ProductAssembler($this->context);
        $presenterFactory = new ProductPresenterFactory($this->context);
        $presentationSettings = $presenterFactory->getPresentationSettings();
        $presenter = new ProductListingPresenter(
            new ImageRetriever(
                $this->context->link
            ),
            $this->context->link,
            new PriceFormatter(),
            new ProductColorsRetriever(),
            $this->context->getTranslator()
        );
       

        $products_for_template = [];
       
        foreach ($result->getProducts() as $rawProduct) {
            $products_for_template[] = $presenter->present(
                $presentationSettings,
                $assembler->assembleProduct($rawProduct),
                $this->context->language
            );
         
        }
        return $products_for_template;
    
}
    public function getWidgetVariables($hookName = null, array $configuration = [])
    {
      
    }


}
