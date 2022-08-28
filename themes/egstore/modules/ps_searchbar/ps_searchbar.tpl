{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}


<div id="search_widget" class="search-widgets" data-search-controller-url="{$search_controller_url}">
    <div class="container">
        <div class="row">
            <div class="col-md-12 p-0">
                {if $page.page_name == 'index'}
                    <div class="search__title">
                        <div class="title">
                            {l
                                s='ici, ce n\'est pas [1]amazon[/1]' d='Shop.Theme.Global'
                                sprintf=[
                                    '[1]' => "<span class=\"yellow\">",
                                    '[/1]' => "</span>"
                                ]
                            }
                        </div>
                        <div class="title__sub">
                            {l
                                s='mais tous les livres [1]de nos librairies au [2]Maroc[/2][1] sont à portée de clic' d='Shop.Theme.Global'
                                sprintf=[
                                    '[1]' => "<br/>",
                                    '[2]' => "<span class=\"red\">",
                                    '[/2]' => "</span>"
                                ]
                            }
                        </div>
                    </div>
                {/if}
                <form method="get" action="{$search_controller_url}" id="search-form">
                    <input type="hidden" name="controller" value="search">
                    <div class="c-input__holder search">
                        <div class="control">
                            <input type="text" name="s" value="{$search_string}" placeholder="{l s='Rechercher un livre, un auteur, une collection ...' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
                            <button class="button--red">
                                <i class="icon-search"></i> {l s='Rechercher' d='Shop.Theme.Catalog'}
                            </button>
                        </div>
                    </div>
                    {if $page.page_name == 'index'}
                        <div class="c-input__holder choice">
                            <div class="control">
                                <input type="radio" name="lang" id="fr">
                                <label for="fr">{l s='Francais' d='Shop.Theme.Catalog'}</label>
                                <input type="radio" name="lang" id="ar">
                                <label for="ar">{l s='Arabe' d='Shop.Theme.Catalog'}</label>
                                <input type="radio" name="lang" id="en">
                                <label for="en">{l s='Anglais' d='Shop.Theme.Catalog'}</label>
                            </div>
                        </div>
                    {/if}
                </form>
            </div>
        </div>
    </div>
</div>
