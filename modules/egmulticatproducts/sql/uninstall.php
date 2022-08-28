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

$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'eg_multicat_products`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'eg_multicat_products_lang`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'eg_multicat_products_shop`';


$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'eg_multicat_products_bloc`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'eg_multicat_products_bloc_lang`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'eg_multicat_products_bloc_shop`';



foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
