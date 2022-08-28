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
class EgAdvancedMenuClass extends ObjectModel
{
    /** @var int EdAdvanceMenuID */
    public $id_eg_advanced_menu;

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
		'table' => 'eg_advanced_menu',
		'primary' => 'id_eg_advanced_menu',
        'multilang_shop' => true,
        'fields' => array(
            
            'position' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'title' => array('type' => self::TYPE_STRING),
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
        $query->select('eg.`id_eg_advanced_menu`, eg.`position`');
        $query->from('eg_advanced_menu', 'eg');
        $query->orderBy('eg.`position` ASC');
        $tabs = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);

        if (!$tabs ) {
            return false;
        }

        foreach ($tabs as $tab) {
            if ((int) $tab['id_eg_advanced_menu'] == (int) $this->id) {
                $moved_tab = $tab;
            }
        }

        if (!isset($moved_tab) || !isset($position)) {
            return false;
        }
        return (Db::getInstance()->execute('
            UPDATE `'._DB_PREFIX_.'eg_advanced_menu`
            SET `position`= `position` '.($way ? '- 1' : '+ 1').'
            WHERE `position`
            '.($way
                    ? '> '.(int)$moved_tab['position'].' AND `position` <= '.(int)$position
                    : '< '.(int)$moved_tab['position'].' AND `position` >= '.(int)$position
                ))
            && Db::getInstance()->execute('
            UPDATE `'._DB_PREFIX_.'eg_advanced_menu`
            SET `position` = '.(int)$position.'
            WHERE `id_eg_advanced_menu` = '.(int)$moved_tab['id_eg_advanced_menu']));
    }

    /**
     * @param null $id
     */
    public static function getInformationsData($id = null)
    {
        if (empty($id)) {
            return [];
        }
        $idShop = Context::getContext()->shop->id;
        $query = new DbQuery();
        $query->select('ab.*');
        $query->from('eg_advanced_menu_bloc', 'ab');
        $query->rightJoin('eg_advanced_menu_bloc_shop', 'as', '`as`.`id_eg_advanced_menu_bloc` = ab.`id_eg_advanced_menu_bloc` AND `as`.id_shop = ' . $idShop);
        $query->where('ab.active = 1 AND id_eg_advanced_menu = ' . $id);
        $query->orderBy('ab.`position` ASC');
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
    }

    /**
     * @param $idCategory
     * @return array|bool|mysqli_result|PDOStatement|resource|null
     * @throws PrestaShopDatabaseException
     */
    public static function getDataByCategoryId($idCategory = null, $idSeo = null)
    {
        if (empty($idCategory) && empty($idSeo)) {
            return [];
        }
        $query = new DbQuery();
        $idShop = Context::getContext()->shop->id;
        $query->select('a.id_eg_advanced_menu');
        $query->from('eg_advanced_menu', 'a');
        $query->rightJoin('eg_advanced_menu_shop', 'as', '`as`.`id_eg_advanced_menu` = `a`.`id_eg_advanced_menu` AND `as`.id_shop = ' . $idShop);
        $query->where('a.active = 1');
        if (!empty($idSeo)) {
            $query->where('a.id_seo = ' . $idSeo);
        } elseif (!empty($idCategory)) {
            $query->where('a.id_category = ' . $idCategory);
        }
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue($query);
    }

    public static function getAllCategories()
    {
        $idShop = Context::getContext()->shop->id;
        $query = new DbQuery();
        $query->select('*');
        $query->from('category', 'c');
        $query->leftJoin('category_shop', 'cs', '`cs`.`id_category` = c.`id_category` AND `cs`.id_shop = ' . $idShop);
        $query->where('c.id_category != 1 AND c.active = 1');
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
    }

    public static function getNumberBloc($id)
    {
        $query = new DbQuery();
        $query->select('count(a.id_eg_advanced_menu)');
        $query->from('eg_advanced_menu_bloc', 'a');
        $query->where('a.id_eg_advanced_menu = ' . $id);
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue($query);
    }
}
