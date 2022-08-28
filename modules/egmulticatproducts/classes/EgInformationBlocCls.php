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
 * Class EgInformationBlocCls.
 */
class EgInformationBlocCls extends ObjectModel
{
    /** @var int id_eg_advanced_menu_bloc */
    public $id_eg_advanced_menu_bloc;

    /** @var int id_eg_advanced_menu */
    public $id_eg_advanced_menu;

    /** @var int category */
    public $category;

    /** @var string title */
    public $title;

    /** @var string subtitle */
	public $subtitle;

    /** @var  int sport nbr */
    public $nbr;

    /** @var  int sport position */
    public $position;

    /** @var int EdInformationID */
    public $id_category;

    /** @var bool Status*/
    public $active = true;

	/**
	 * @see ObjectModel::$definition
	 */
	public static $definition = array(
		'table' => 'eg_advanced_menu_bloc',
		'primary' => 'id_eg_advanced_menu_bloc',
        'multilang_shop' => true,
        'multilang' => true,
        'fields' => array(
            'position' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'id_eg_advanced_menu' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'position' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'id_category' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'title' =>    array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'lang' => true),
            'subtitle' =>   array('type' => self::TYPE_STRING, 'validate' => 'isCleanHtml', 'lang' => true),
            'nbr' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'active' =>  array('type' => self::TYPE_BOOL),
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
        $query->from('eg_advanced_menu_bloc', 'eg');

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
        $query->select('eg.`id_eg_advanced_menu_bloc`, eg.`position`');
        $query->from('eg_advanced_menu_bloc', 'eg');
        $query->orderBy('eg.`position` ASC');
        $tabs = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);

        if (!$tabs ) {
            return false;
        }

        foreach ($tabs as $tab) {
            if ((int) $tab['id_eg_advanced_menu_bloc'] == (int) $this->id) {
                $moved_tab = $tab;
            }
        }

        if (!isset($moved_tab) || !isset($position)) {
            return false;
        }
        return (Db::getInstance()->execute('
            UPDATE `'._DB_PREFIX_.'eg_advanced_menu_bloc`
            SET `position`= `position` '.($way ? '- 1' : '+ 1').'
            WHERE `position`
            '.($way
                    ? '> '.(int)$moved_tab['position'].' AND `position` <= '.(int)$position
                    : '< '.(int)$moved_tab['position'].' AND `position` >= '.(int)$position
                ))
            && Db::getInstance()->execute('
            UPDATE `'._DB_PREFIX_.'eg_advanced_menu_bloc`
            SET `position` = '.(int)$position.'
            WHERE `id_eg_advanced_menu_bloc` = '.(int)$moved_tab['id_eg_advanced_menu_bloc']));
    }
}
