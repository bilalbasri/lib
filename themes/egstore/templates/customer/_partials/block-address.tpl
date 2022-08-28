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
{block name='address_block_item'}
    <article id="address-{$address.id}" class="address address-item" data-id-address="{$address.id}">
        <header class="h4">
            <label class="radio-block">
                <span class="address-alias h4">{$address.alias}</span>

                <div class="address">
                    {$address.formatted nofilter}
                    {* Display the extra field values added in an address from using hook 'additionalCustomerAddressFields' *}
                    {hook h='displayAdditionalCustomerAddressFields' address=$address}
                </div>

                {block name='address_block_item_actions'}
                    <div class="address-footer">
                        <a class="edit-address" href="{url entity=address id=$address.id}" data-link-action="edit-address">
                            <span>{l s='Update' d='Shop.Theme.Actions'}</span>
                        </a>
                        <a class="edit-address"
                            href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}"
                            data-link-action="delete-address">
                            <span>{l s='Delete' d='Shop.Theme.Actions'}</span>
                        </a>
                    </div>
                {/block}
            </label>
        </header>
    </article>
{/block}