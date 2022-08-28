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

$sql = [];
$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'eg_custom_import_ftp` (
        `id_custom_import_ftp` int(10) unsigned NOT NULL AUTO_INCREMENT,  
        `file_name` varchar(255),
        `date_add` datetime DEFAULT "0000-00-00 00:00:00",
        PRIMARY KEY (`id_custom_import_ftp`)
    ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
