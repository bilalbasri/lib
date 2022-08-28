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

<div class="block_newsletter" id="blockEmailSubscription_{$hookName}">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div id="block-newsletter-label">Inscrivez-vous à la newsletter <br> Pour être informé de nos nouveautés</div>
                <div class="col-md-12">
                    <form action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post" id="form-newsletter">
                        <div class="row">
                            <div class="col-xs-12 p-0">
                                <div class="c-input__holder">
                                    <div class="control">
                                        <div class="input-wrapper">
                                            <input
                                                name="email"
                                                type="email"
                                                value="{$value}"
                                                placeholder="{l s='Votre email' d='Shop.Forms.Labels'}"
                                                aria-labelledby="block-newsletter-label"
                                                required>
                                        </div>
                                        <input
                                            class="button--red"
                                            name="submitNewsletter"
                                            type="submit"
                                            value="{l s='Inscription' d='Shop.Theme.Actions'}">
                                    </div>
                                </div>
                                <input type="hidden" name="blockHookName" value="{$hookName}" />
                                <input type="hidden" name="action" value="0">
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12">
                                <h3>Restez connecter</h3>
                                <ul class="social-medias">
                                    <li>
                                        <a href="" title="">
                                            <i class="icon-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" title="">
                                            <i class="icon-instagram"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" title="">
                                            <i class="icon-youtube">
                                                <span class="path1"></span>
                                                <span class="path2"></span>
                                            </i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
