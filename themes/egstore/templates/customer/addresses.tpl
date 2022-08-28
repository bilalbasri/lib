text/x-generic addresses.tpl ( HTML document, ASCII text )
{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
    {l s='Your addresses' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <div class="grid-adress_customer">
        {foreach $customer.addresses as $address}
            {block name='customer_address'}
                {include file='customer/_partials/block-address.tpl' address=$address}
            {/block}
        {/foreach}
        <div class="clearfix"></div>
        <a href="{$urls.pages.address}" data-link-action="add-address" class="add-adress-customer">
            <div class="add-new-adress">
                <p class="add-address address-alias">
                    {l s='Create new address' d='Shop.Theme.Actions'}
                </p>
            </div>
        </a>
    </div>
{/block}