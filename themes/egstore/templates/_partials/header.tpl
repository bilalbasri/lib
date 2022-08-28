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

{block name='header_banner'}
    {hook h='displayBanner'}
{/block}

{block name='header_nav'}
    {hook h='displayNav1'}
{/block}

<div class="header__top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="header-nav">
                    <div id="_desktop_logo" class="header-nav-logo">
                        {if $page.page_name == 'index'}
                            <h1>
                                <a href="{$urls.base_url}">
                                    <img width="221" height="42" class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
                                </a>
                            </h1>
                        {else}
                            <a href="{$urls.base_url}">
                                <img width="221" height="42" class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
                            </a>
                        {/if}
                    </div>
                    {if $page.page_name != 'index'}
                        <div class="header__search">
                            {widget name="ps_searchbar"}
                        </div>
                    {/if}
                    <div class="header-nav-right">
                        {hook h='displayNav2'}
                        <div class="header__toggle">
                            <button class="header__toggle--button">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="header__nav">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                {block name='header_top'}
                    {hook h='displayNavFullWidth'}
                {/block}
            </div>
        </div>
    </div>
</div>
