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

/**
 * @property EgAdvancedMenuClass $object
 */
class AdminEgInformationController extends ModuleAdminController
{
    protected $position_identifier = 'id_eg_advanced_menu';
    public function __construct()
    {
        $this->bootstrap = true;
        $this->table = 'eg_advanced_menu';
        $this->className = 'EgAdvancedMenuClass';
        $this->_defaultOrderBy = 'position';
        $this->identifier = 'id_eg_advanced_menu';
        $this->toolbar_btn = null;
        $this->_defaultOrderWay = 'ASC';
        $this->list_no_link = true;
        
        $this->addRowAction('view');
        $this->addRowAction('edit');
        $this->addRowAction('delete');
        Shop::addTableAssociation($this->table, array('type' => 'shop'));

        parent::__construct();
        $this->bulk_actions = array(
            'delete' => array(
                'text' => $this->trans('Delete selected', array(), 'Modules.Egadvancedmenu.Admin'),
                'confirm' => $this->trans('Delete selected items?', array(), 'Modules.Egadvancedmenu.Admin'),
                'icon' => 'icon-trash'
            ),
        );
        
        $this->fields_list = array(
            'id_eg_advanced_menu' => array(
                'title' => $this->trans('Id', array(), 'Modules.Egadvancedmenu.Admin'),
                'align' => 'center',
            ),
            'title' => array(
                'title' => $this->trans('Title', array(), 'Modules.Egadvancedmenu.Admin'),
                'align' => 'center',
                
                
            ),
            'description' => array(
                'title' => $this->trans('Description', array(), 'Modules.Egadvancedmenu.Admin'),
                'align' => 'center',
               
                
                
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
     * @param $idCategory
     * @return string
     */
    

    /**
     * @param $id
     * @return false|int|string|null
     */
    

    

    public function renderView()
    {
        $idInfoBloc = (int) Tools::getValue('id_eg_advanced_menu');
        Tools::redirectAdmin($this->context->link->getAdminLink('AdminEgInformationBloc', true, [], ['id_eg_advanced_menu' => $idInfoBloc]));

        return parent::renderView();
    }

    /**
     * AdminController::init() override
     * @see AdminController::init()
     */
    public function init()
    {
        parent::init();
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

        $idLang = (int) Context::getContext()->language->id;
        
        $this->fields_form = array(
            'tinymce' => true,
            'legend' => array(
                'title' => $this->trans('Page:', array(), 'Modules.Egadvancedmenu.Admin'),
                'icon' => 'icon-folder-close'
            ),
            'input' => array(
                
                array(
                    'type' => 'text',
                    'label' => $this->l('Title'),
                    'name' => 'title',
                    'class' => 'fixed-width-xll',
                    
                ),
                array(
                    'type' => 'textarea',
                    'label' => $this->l('Description'),
                    'name' => 'description',
                    
                    'autoload_rte' => true,
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
        $idEgInformation = (int)(Tools::getValue('id'));
        $positions = Tools::getValue($this->table);

        foreach ($positions as $position => $value){
            $pos = explode('_', $value);

            if (isset($pos[2]) && (int)$pos[2] === $idEgInformation){
                if ($information = new EgAdvancedMenuClass((int)$pos[2])){
                    if (isset($position) && $information->updatePosition($way, $position)){
                        echo 'ok position '.(int)$position.' for tab '.(int)$pos[1].'\r\n';
                    } else {
                        echo '{"hasError" : true, "errors" : "Can not update tab '.(int)$idEgInformation.' to position '.(int)$position.' "}';
                    }
                } else {
                    echo '{"hasError" : true, "errors" : "This tab ('.(int)$idEgInformation.') can t be loaded"}';
                }
                break;
            }
        }
    }
}
