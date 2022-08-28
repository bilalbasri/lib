<?php

include_once '../../config/config.inc.php';
include_once(dirname(__FILE__).'/egadvancedmenu.php');


$categories = EgAdvancedMenuClass::getAllCategories();
foreach ($categories as $category) {
    $sql = [];
    $idShop = Context::getContext()->shop->id;
    $menu = new EgAdvancedMenuClass();
    $menu->id_category = $category['id_category'];
    $menu->active = $category['active'];
    if (!empty($category['id_category']) && $menu->add()) {
        $sql[] = " INSERT INTO `"._DB_PREFIX_."eg_advanced_menu_shop` (`id_eg_advanced_menu`, `id_shop`) VALUES ($menu->id, $idShop)";

        foreach ($sql as $query) {
            if (Db::getInstance()->execute($query) == false) {
                return false;
            }
        }
        echo 'category Id ' . $category['id_category'] . ' successful add <br>';
    }
}