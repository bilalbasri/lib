<?php
/**
 * 2020 (c) Egio digital
 *
 * MODULE Eg Import Data
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */

class ImportFilesClass extends ObjectModel

{
    /** @var  int id_custom_import_ftp */
    public $id_custom_import_ftp;

    /** @var  string file_name */
    public $file_name;

    /** @var  string date_add */
    public $date_add;

    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'eg_custom_import_ftp',
        'primary' => 'id_custom_import_ftp',
        'fields' => [
            'file_name' => array('type' => self::TYPE_STRING),
            'date_add' => array('type' => self::TYPE_DATE),
        ]
    );

    /**
     * @return array
     * @throws
     */
    public static function getIAllImportedFilesNames()
    {
        $fileName = [];
        $query = new DbQuery();
        $query->select('file_name');
        $query->from('eg_custom_import_ftp');
        $names = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
        foreach ($names as $name) {
            $fileName[] = $name['file_name'];
        }
        return $fileName;
    }
}
