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

<div class="block-contact col-md-4">
    <div>

        <div class="footer__logo">
            <a href="{$urls.base_url}" target="_blank">
                <img width="221" height="42" src="{$urls.img_url}logo-footer.png" alt="{$shop.name}">
            </a>
        </div>

        <div class="footer__alias">
            <ul>
{*              {if $contact_infos.phone}*}
                <li>
                    <i class="icon-phone"></i>
                    <div class="footer__alias--info">
                        <div class="footer__phone">
                            <a href="tel:05 22 20 22 26">
                                <strong>05 22 20 22 26</strong>
                            </a>
                        </div>
{*                      <div class="footer__phone">*}
{*                          <a href="tel:{$contact_infos.phone}">*}
{*                              <strong>{$contact_infos.phone}</strong>*}
{*                          </a>*}
{*                      </div>*}
                        <div class="footer__schedule">
                            Du lundi au vendredi
                            <br>
                            De 10h00 à 18h00
                        </div>
                    </div>
                </li>
{*              {/if}*}
                {if $urls.pages.contact && $contact_infos.email}
                    <li>
                        <i class="icon-envelop"></i>
                        <a href="{$urls.pages.contact}">
                            <strong>{l s="Contact" d="Shop.Theme.Global"}</strong>
                        </a>
                    </li>
                {/if}
            </ul>
        </div>

    </div>
</div>
