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
 * Class EgAdvancedMenuClass.
 */
class EgmulticatproductsClass extends ObjectModel
{
    /** @var int  */
    public $id_eg_multicat_products;

   /** @var string title */
   public $title;

   /** @var string description */
   public $description;

   /** @var  int sport position */
   public $position;

	/**
	 * @see ObjectModel::$definition
	 */
	public static $definition = array(
		'table' => 'eg_multicat_products',
		'primary' => 'id_eg_multicat_products',
        'multilang_shop' => true,
        'fields' => array(
            
            'position' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'title' => array('type' => self::TYPE_STRING, 'required' => true),
            'description' =>  array('type' => self::TYPE_STRING),
        ),
	);

    /**
     * Adds current sport as a new Object to the database
     *
     * @param bool $autoDate    Automatically set `date_upd` and `date_add` columns
     * @param bool $nullValues Whether we want to use NULL values instead of empty quotes values
     *
     * @return bool Indicates whether the Information has been successfully added
     * @throws
     * @throws
     */
    public function add($autoDate = true, $nullValues = false)
    {
        $this->position = (int) $this->getMaxPosition() + 1;
        return parent::add($autoDate, $nullValues);
    }

    /**
     * @return int MAX Position Information
     */
    public static function getMaxPosition()
    {
        $query = new DbQuery();
        $query->select('MAX(position)');
        $query->from('eg_advanced_menu', 'eg');

        $response = Db::getInstance()->getRow($query);

        if ($response['MAX(position)'] == null){
            return -1;
        }
        return $response['MAX(position)'];
    }

    /**
     * @param $way int
     * @param $position int Position Information
     * @return bool
     * @throws
     */
    public function updatePosition($way, $position)
    {
        $query = new DbQuery();
        $query->select('eg.`id_eg_multicat_products`, eg.`position`');
        $query->from('eg_multicat_products', 'eg');
        $query->orderBy('eg.`position` ASC');
        $tabs = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);

        if (!$tabs ) {
            return false;
        }

        foreach ($tabs as $tab) {
            if ((int) $tab['id_eg_multicat_products'] == (int) $this->id) {
                $moved_tab = $tab;
            }
        }

        if (!isset($moved_tab) || !isset($position)) {
            return false;
        }
        return (Db::getInstance()->execute('
            UPDATE `'._DB_PREFIX_.'eg_multicat_products`
            SET `position`= `position` '.($way ? '- 1' : '+ 1').'
            WHERE `position`
            '.($way
                    ? '> '.(int)$moved_tab['position'].' AND `position` <= '.(int)$position
                    : '< '.(int)$moved_tab['position'].' AND `position` >= '.(int)$position
                ))
            && Db::getInstance()->execute('
            UPDATE `'._DB_PREFIX_.'eg_multicat_products`
            SET `position` = '.(int)$position.'
            WHERE `id_eg_multicat_products` = '.(int)$moved_tab['id_eg_multicat_products']));
    }

    public static function getData($id = null)
    {
       
    $sql = 'SELECT * FROM `'._DB_PREFIX_.'eg_multicat_products`';
        $data = Db::getInstance()->executeS($sql);
        if (empty($data)) {
            return [];
        }

        return $data;
    }

    public static function getBlocs($id = null)
    {
        $sql = 'SELECT * FROM `'._DB_PREFIX_.'eg_multicat_products`';
        $data = Db::getInstance()->executeS($sql);
        if (empty($data)) {
            return [];
        }
        return $data;
    }

    public static function getCategs($idBloc = null)
    {
        $sql = 'SELECT * FROM `'._DB_PREFIX_.'eg_multicat_products_bloc` WHERE `id_eg_multicat_products` = '.(int)$idBloc;
        $data = Db::getInstance()->executeS($sql);
        if (empty($data)) {
            return [];
        }
        return $data;
    }


    
   
}

