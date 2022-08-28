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

class EgConnectionFtpRunModuleFrontController extends ModuleFrontController
{
    public function __construct()
    {
        parent::__construct();
        $this->context = Context::getContext();
    }

    public function init()
    {
        if (ob_get_length() > 0) {
            ob_clean();
        }
        //header('X-Robots-Tag: noindex, nofollow', true);
        //header('Content-type: application/json');
        $run = $this->module->connectToFtp();
        die(json_encode($run));
    }
}