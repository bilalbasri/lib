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

$sql = array();


/* Information on content EG Information */
$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'eg_multicat_products` (
        `id_eg_multicat_products` int(10) unsigned NOT NULL AUTO_INCREMENT,  
        `position` int(10) unsigned NOT NULL DEFAULT 0,
        `title` text NOT NULL,
        `description` varchar(250) NOT NULL,
        PRIMARY KEY (`id_eg_multicat_products`)
    ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;';


/* Structure table eg_advanced_menu shop */
$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'eg_multicat_products_shop` (
	`id_eg_multicat_products` int(10) unsigned NOT NULL, 
	`id_shop` int(10) unsigned NOT NULL ,
	PRIMARY KEY (`id_eg_multicat_products`, `id_shop`), 
	KEY `id_shop` (`id_shop`)
) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;';


$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'eg_multicat_products_bloc` (
        `id_eg_multicat_products_bloc` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `id_eg_multicat_products` int(10) unsigned NOT NULL, 
        `position` int(10) unsigned NOT NULL DEFAULT 0,
        `active` tinyint(1) unsigned NOT NULL DEFAULT 1, 
        `nbr` int(10) unsigned NOT NULL ,
        `id_category` int(10) unsigned NOT NULL DEFAULT 0,
       
        PRIMARY KEY (`id_eg_multicat_products_bloc`)
    ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;';

/* Localized EG Information infos */
$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'eg_multicat_products_bloc_lang` (
        `id_eg_multicat_products_bloc` int(10) unsigned NOT NULL, 
        `title` text NOT NULL,
        `subtitle` varchar(250) NOT NULL,
        `id_lang` int(10) unsigned NOT NULL, 
        `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
        PRIMARY KEY (`id_eg_multicat_products_bloc`, `id_shop`, `id_lang`)
    ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;';


/* Structure table eg_advanced_menu shop */
$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'eg_multicat_products_bloc_shop` (
	`id_eg_multicat_products_bloc` int(10) unsigned NOT NULL, 
	`id_shop` int(10) unsigned NOT NULL ,
	PRIMARY KEY (`id_eg_multicat_products_bloc`, `id_shop`), 
	KEY `id_shop` (`id_shop`)
) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
