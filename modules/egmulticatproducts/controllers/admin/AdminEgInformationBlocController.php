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

include_once(_PS_ROOT_DIR_ . '/modules/egmulticatproducts/classes/EgInformationBlocCls.php');

/**
 * @property EgInformationBlocCls $object
 */
class AdminEgInformationBlocController extends ModuleAdminController
{
    protected $position_identifier = 'id_eg_advanced_menu_bloc';
    public function __construct()
    {
        $this->bootstrap = true;
        $this->table = 'eg_advanced_menu_bloc';
        $this->className = 'EgInformationBlocCls';
        $this->_defaultOrderBy = 'position';
        $this->identifier = 'id_eg_advanced_menu_bloc';
        $this->toolbar_btn = null;
        $this->lang = true;
        $this->_defaultOrderWay = 'ASC';
        $this->addRowAction('edit');
        $this->addRowAction('delete');
        Shop::addTableAssociation($this->table, array('type' => 'shop'));

        parent::__construct();
        $this->bulk_actions = array(
            'delete' => array(
                'text' => $this->trans('Delete selected', array(), 'Modules.Egadvancedmenu.Admin'),
                'confirm' => $this->trans('Delete selected items?', array(), 'Modules.Egadvancedmenu.Admin'),
                'icon' => 'icon-trash'
            )
        );
        
        if (!($obj = $this->loadObject(true))) {
            return;
        }
        $this->_select = "a.id_category as category_id, a.id_eg_advanced_menu_bloc as id_eg_menu";
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        $this->_where = ' AND a.`id_eg_advanced_menu` = ' . $idInfoBloc;

        $this->fields_list = array(
            'id_eg_advanced_menu_bloc' => array(
                'title' => $this->trans('Id', array(), 'Modules.Egadvancedmenu.Admin')
            ),
            'title' => array(
                'title' => $this->trans('Title', array(), 'Modules.Egadvancedmenu.Admin'),
//                'filter_key' => 'b!label'
            ),
            'subtitle' => array(
                'title' => $this->trans('Subtitle', array(), 'Modules.Egadvancedmenu.Admin'),
//                'filter_key' => 'b!label'
            ),
            ' nbr' => array(
                'title' => $this->trans(' Number of products to be displayed', array(), 'Modules.Egadvancedmenu.Admin'),
//                'filter_key' => 'b!label'
            ),
           
            'active' => array(
                'title' => $this->trans('Randomly display featured products', array(), 'Modules.Egadvancedmenu.Admin'),
                'align' => 'center',
                'active' => 'status',
                'class' => 'fixed-width-sm',
                'type' => 'bool',
                'orderby' => false
            ),
            'position' => array(
                'title' => $this->trans('Position', array(), 'Modules.Egadvancedmenu.Admin'),
                'filter_key' => 'a!position',
                'position' => 'position',
                'align' => 'center',
                'class' => 'fixed-width-md',
            ),
        );
    }

    /**
     * AdminController::init() override
     * @see AdminController::init()
     */
    public function init()
    {
        parent::init();
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        $this->toolbar_btn['new'] = array(
            'href' => self::$currentIndex.'&id_eg_advanced_menu='.$idInfoBloc.'&add'.$this->table.'&token='.$this->token,
            'desc' => $this->l('Add New')
        );
    }

    /**
     * AdminController::postProcess() override
     * @see AdminController::postProcess()
     */
    public function postProcess()
    {
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        if ($this->action && $this->action == 'save') {
            $_POST['id_eg_advanced_menu'] = $idInfoBloc;
        }

        return parent::postProcess();
    }

    public function processAdd()
    {
        parent::processAdd();
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        if ($this->action && $this->action == 'save' && empty($this->errors)) {
            Tools::redirectAdmin(self::$currentIndex.'&id_eg_advanced_menu=' . $idInfoBloc . '&token='.$this->token);
        }
    }


    /**
     * @see AdminController::initPageHeaderToolbar()
     */
    public function initPageHeaderToolbar()
    {
        /*if (empty($this->display)) {
            $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
            $bloc = new EgAdvancedMenuClass($idInfoBloc);
            if (!empty($bloc->id_seo)) {
                $this->toolbar_title = $this->getTitlePage((int) $bloc->id_seo);
            } else {
                $cat = new Category((int)$bloc->id_category, 1);
                if (!empty($cat->name)) {
                    $this->toolbar_title = $cat->name;
                }
            }
        }*/
        parent::initPageHeaderToolbar();
    }

    public static function getTitlePage($value)
    {
        $idLang = Context::getContext()->language->id;
        $query = new DbQuery();
        $query->select('sl.`title`');
        $query->from('pm_advancedsearch_seo_lang', 'sl');
        $query->where('sl.`id_lang` =  '.(int) $idLang.' AND sl.`id_seo` ='.(int) $value);
        $pageTitle = Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue($query);
        return !empty($pageTitle) ? $pageTitle : '<b>-</b>';
    }

    /**
     * Change object status (active, inactive).
     *
     * @return ObjectModel|false
     *
     * @throws PrestaShopException
     */
    public function processStatus()
    {
        if (Validate::isLoadedObject($object = $this->loadObject())) {
            if ($object->toggleStatus() && empty($this->errors)) {
                $this->redirect_after = self::$currentIndex . '&token=' . $this->token. '&id_eg_advanced_menu=' . $object->id_eg_advanced_menu ?? 0;
            } else {
                $this->errors[] = $this->trans('An error occurred while updating the status.', [], 'Admin.Notifications.Error');
            }
        } else {
            $this->errors[] = $this->trans('An error occurred while updating the status for an object.', [], 'Admin.Notifications.Error') .
                ' <b>' . $this->table . '</b> ' .
                $this->trans('(cannot load object)', [], 'Admin.Notifications.Error');
        }

        return $object;
    }

    public function processUpdate()
    {
        parent::processUpdate();
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        if ($this->action && $this->action == 'save' && empty($this->errors)) {
            Tools::redirectAdmin(self::$currentIndex.'&id_eg_advanced_menu=' . $idInfoBloc . '&token='.$this->token);
        }
    }


    public function processDelete()
    {
        if (Validate::isLoadedObject($object = $this->loadObject())) {
            parent::processDelete();
            if ($this->action && $this->action == 'delete' && empty($this->errors)) {
                Tools::redirectAdmin(self::$currentIndex.'&id_eg_advanced_menu=' . $object->id_eg_advanced_menu ?? 0 . '&token='.$this->token);
            }
        }
    }

    public function initToolbar()
    {
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        $this->toolbar_btn['new'] = array(
            'href' => self::$currentIndex.'&id_eg_advanced_menu='.$idInfoBloc.'&add'.$this->table.'&token='.$this->token,
            'desc' => $this->l('Add New')
        );
        if (Tools::isSubmit('id_eg_advanced_menu')) {
            $back = 'index.php?controller=AdminEgInformation' . '&token=' . Tools::getAdminTokenLite('AdminEgInformation');
            if (empty($back)) {
                $back = self::$currentIndex.'&token='.$this->token;
            }
            $this->toolbar_btn['back'] = array(
                'href' => $back,
                'desc' => $this->l('Back to list')
            );
        }
        return $this->toolbar_btn;
    }

    public function renderForm()
    {
        if (!($obj = $this->loadObject(true))) {
            return;
        }
        if ($this->display == 'edit') {
            $idSelected = (int) $obj->id_category;
        } else {
            $idSelected = 0;
        }
        
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        $this->fields_form = array(
            'tinymce' => true,
            'legend' => array(
                'title' => $this->trans('Page:', array(), 'Modules.Egadvancedmenu.Admin'),
                'icon' => 'icon-folder-close'
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->l('title'),
                    'name' => 'title',
                    'lang' => true,
                    'desc' => $this->l('Please enter a title for the menu.'),
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('subtitle'),
                    'name' => 'subtitle',
                    'lang' => true,
                    'desc' => $this->l('Please enter a title for the menu.'),
                ),
                array(
                    'type' => 'text',
                    'label' => $this->trans('Number of products to be displayed', array(), 'Modules.Egadvancedmenu.Admin'),
                    'name' => 'nbr',
                    'class' => 'fixed-width-xs',
                    'desc' => $this->trans('Set the number of products that you would like to display on 
                    homepage (default: 8).'),
                ),
                array(
                    'type' => 'categories',
                    'label' => $this->l('Category from which to pick products to be displayed '),
                    'name' => 'id_category',
                    'class' => 'fixed-width-xs',
                    'tree' => array(
                        'root_category' => 1,
                        'id' => 'id_category',
                        'name' => 'name_category',
                        'selected_categories' => array($idSelected),
                    ),
                    'desc' => $this->trans('Choose the category ID of the products that you would like to display on 
                        homepage (default: 2 for "Home").'),
                ),
                array(
                    'type' => 'hidden',
                    'label' => $this->trans('Label:', array(), 'Modules.Egadvancedmenu.Admin'),
                    'name' => 'id_eg_advanced_menu',
                    'value' => $idInfoBloc
                ),
                array(
                    'type' => 'switch',
                    'label' => $this->trans('Randomly display featured products '), array(), 'Modules.Egadvancedmenu.Admin',
                    'name' => 'active',
                    'is_bool' => true,
                    'values' => array(
                        array(
                            'id' => 'active_on',
                            'value' => 1,
                            'label' => $this->trans('Enabled', array(), 'Modules.Egadvancedmenu.Admin')
                        ),
                        array(
                            'id' => 'active_off',
                            'value' => 0,
                            'label' => $this->trans('Disabled', array(), 'Modules.Egadvancedmenu.Admin')
                        )
                    )
                ),
            ),
             'submit' => array(
                'title' => $this->trans('Save', array(), 'Modules.Egadvancedmenu.Admin'),
                'class' => 'btn btn-default pull-right'
            )
        );
        if (Shop::isFeatureActive()) {
            $this->fields_form['input'][] = array(
                'type' => 'shop',
                'label' => $this->trans('Shop association'),
                'name' => 'checkBoxShopAsso',
            );
        }
        return parent::renderForm();
    }

    /**
     * Update Positions
     */
    public function ajaxProcessUpdatePositions()
    {
        $way = (int)(Tools::getValue('way'));
        $idEgAdvancedMenu = (int)(Tools::getValue('id'));
        $positions = Tools::getValue($this->table);

        foreach ($positions as $position => $value){
            $pos = explode('_', $value);

            if (isset($pos[2]) && (int)$pos[2] === $idEgAdvancedMenu){
                if ($information = new EgInformationBlocCls((int)$pos[2])){
                    if (isset($position) && $information->updatePosition($way, $position)){
                        echo 'ok position '.(int)$position.' for tab '.(int)$pos[1].'\r\n';
                    } else {
                        echo '{"hasError" : true, "errors" : "Can not update tab '.(int)$idEgAdvancedMenu.' to position '.(int)$position.' "}';
                    }
                } else {
                    echo '{"hasError" : true, "errors" : "This tab ('.(int)$idEgAdvancedMenu.') can t be loaded"}';
                }
                break;
            }
        }
    }
}
