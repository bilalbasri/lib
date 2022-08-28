<?php
/**
 * 2020  (c) Egio digital
 *
 * MODULE EgJsValidator
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */

if (!defined('_PS_VERSION_')) {
	exit;
}

class EgJsValidator extends Module
{
	public function __construct() {
		$this->name = 'egjsvalidator';
		$this->tab = 'front_office_features';
		$this->version = '1.0.0';
		$this->author = 'Egio digital';
		$this->displayName = $this->l('Jquery Validator');
		$this->description = $this->l('Jquery Validator');
		$this->bootstrap = true;
		parent::__construct();
		$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
	}

	public function install()
	{
		if (!parent::install()) {
			return false;
		}
		if (!$this->registerHook('displayHeader')) {
			return false;
		}
		return true;
	}

	public function uninstall()
	{
		if (!parent::uninstall()) {
			return false;
		}
		return true;
	}

	public function hookDisplayHeader($param)
	{
            $this->context->controller->registerJavascript('jquery-validate', 'modules/'.$this->name.'/views/js/jquery.validate.js');
            $this->context->controller->registerJavascript('validator', 'modules/'.$this->name.'/views/js/eg-validator.js');
	}
}
