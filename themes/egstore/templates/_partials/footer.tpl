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

{block name='hook_footer_before'}
    {hook h='displayFooterBefore'}
{/block}

<div class="footer__container">

    <div class="footer__links">
        <div class="container">
            <div class="row">
                {block name='hook_footer'}
                    {hook h='displayFooter'}
                {/block}
            </div>
        </div>
    </div>

    {block name='hook_footer_after'}
        {hook h='displayFooterAfter'}
    {/block}

    <div class="footer__desc">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p>{l s="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing softwarem Ipsum." d='Shop.Theme.Global'}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="footer__copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-4"></div>
                <div class="col-md-12 col-lg-4">
                    <p>
                        {block name='copyright_link'}
                            <span>{l s='<strong>ALALIBRAIRIE.MA</strong> - Tous droits réservés %year%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date] d='Shop.Theme.Global'}</span>
                        {/block}
                    </p>
                </div>
                <div class="col-md-12 col-lg-4">
                    <div class="developper">
                        <span>{l s='Réalisation' d='Shop.Theme.Global'}</span>
                        <a href="https://www.egiodigital.com/" target="_blank">
                            <img width="71" height="26" class="egio-logo" src="{$urls.img_url}logo-egio.svg" alt="Egio">
                        </a>
                        <span>{l s='Agence e-commerce Maroc' d='Shop.Theme.Global'}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="go-to-top">
    <i class="icon-chevron-right"></i>
</div>
