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

if (!defined('_PS_VERSION_')) {
    exit;
}

include_once(dirname(__FILE__).'/classes/ImportFilesClass.php');

class EgConnectionFtp extends Module
{
    public function __construct()
    {
        $this->name = 'egconnectionftp';
        $this->tab = 'front_office_features';
        $this->author = 'Egio Digital';
        $this->version = '1.0.0';
        $this->need_instance = 0;
        $this->secure_key = Tools::encrypt($this->name);
        $this->bootstrap = true;

        parent::__construct();

        $this->domain = 'Modules.Egconnectionftp.Egconnectionftp';
        $this->displayName = $this->trans('EG Connect to Ftp)', array(), $this->domain);
        $this->description = $this->trans('EG Connect to Ftp', array(), $this->domain);
    }

    /**
     * @see Module::install()
     */
    public function install()
    {
        include(dirname(__FILE__) . '/sql/install.php');
        return parent::install();
    }

    /**
     * @see Module::uninstall()
     */
    public function uninstall()
    {
        include(dirname(__FILE__) . '/sql/uninstall.php');
        return parent::uninstall();
    }

    /**
     * getContent
     */
    public function getContent()
    {

        $this->connectToFtp();
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submit_connect_ftp')) == true) {
            $this->postProcess();
        }

        $this->context->smarty->assign('module_dir', $this->_path);
        return $this->renderForm();
    }

    /**
     * @return void
     */
    protected function postProcess()
    {
        $this->connectToFtp();
        // Save Config Form Values
        $form_values = $this->getConfigFormValues();
        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key));
        }
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     *
     * @return mixed
     */
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submit_connect_ftp';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );
        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     *
     * @return array[]
     */
    protected function getConfigForm(): array
    {
        return [
            'form' => [
                'legend' => [
                    'title' => $this->trans('Settings', [], $this->domain),
                    'icon' => 'icon-cogs',
                ],
                'input' => [
                    [
                        'type' => 'text',
                        'desc' => $this->trans('Host', [], $this->domain),
                        'name' => 'HOST_EG_CONNECT_FTP',
                        'label' => $this->trans('Host', [], $this->domain),
                    ],
                    [
                        'type' => 'text',
                        'desc' => $this->trans('Ftp user', [], $this->domain),
                        'name' => 'USER_EG_CONNECT_FTP',
                        'label' => $this->trans('User', [], $this->domain),
                    ],
                    [
                        'type' => 'text',
                        'desc' => $this->trans('Password Ftp', [], $this->domain),
                        'name' => 'PASSWORD_EG_CONNECT_FTP',
                        'label' => $this->trans('Password', [], $this->domain),
                    ],
                ],
                'submit' => [
                    'title' => $this->trans('Save', [], $this->domain),
                ],
            ],
        ];
    }

    /**
     * Set values for the inputs.
     *
     * @return array
     */
    protected function getConfigFormValues(): array
    {
        return [
            'HOST_EG_CONNECT_FTP' => Configuration::get('HOST_EG_CONNECT_FTP'),
            'USER_EG_CONNECT_FTP' => Configuration::get('USER_EG_CONNECT_FTP'),
            'PASSWORD_EG_CONNECT_FTP' => Configuration::get('PASSWORD_EG_CONNECT_FTP'),
        ];
    }

    public function connectToFtp()
    {
        $HOST_FTP     = Configuration::get('HOST_EG_CONNECT_FTP');
        $USER_FTP     = Configuration::get('USER_EG_CONNECT_FTP');
        $PASSWORD_FTP = Configuration::get('PASSWORD_EG_CONNECT_FTP');
        $dir_local   = _PS_UPLOAD_DIR_.'import/';
        $dateTime       = date('Y_m_d_H:i:s', time());
        $conn_id = ftp_connect($HOST_FTP);
        $importedFiles = ImportFilesClass::getIAllImportedFilesNames();
        if ($conn_id) {
            $login = ftp_login($conn_id, $USER_FTP, $PASSWORD_FTP);
            ftp_pasv($conn_id, true);
            $contents = ftp_nlist($conn_id, '/pub/O');
            if ($login && is_array($contents)) {
                foreach ($contents as $file) {
                    $localFile = str_replace('/pub/O/', '', $file);
                    if (!in_array($localFile, $importedFiles)) {
                        ftp_get($conn_id, $dir_local.$localFile, $file, FTP_BINARY);
                        $saveData = new ImportFilesClass();
                        $saveData->file_name = $localFile;
                        $saveData->date_add =  $dateTime;
                        $saveData->save();
                    }
                }
            }
        } else {
            echo 'Could not connect to ' . $HOST_FTP;
        }
    }
}