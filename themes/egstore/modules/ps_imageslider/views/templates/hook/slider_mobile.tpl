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
* @author PrestaShop SA <contact@prestashop.com>
    * @copyright 2007-2019 PrestaShop SA and Contributors
    * @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
    * International Registered Trademark & Property of PrestaShop SA
    *}

{if $homeslider.slides}
    <div id="hpSlider" class="slide">
        <div class="slick-slider">
            {foreach from=$homeslider.slides item=slide name='homeslider'}
                <div class="item {if $smarty.foreach.homeslider.first}active{/if}" role="listbox" aria-hidden="{if $smarty.foreach.homeslider.first}false{else}true{/if}">
                    <a href="{$slide.url}">
                        <img
                                class="slider-mob"
                                src="{if isset($slide.image_url_mobile) && !empty($slide.image_url_mobile)}{$slide.image_url_mobile}{else}{$slide.image_url}{/if}"
                                alt="{$slide.legend|escape}">
                        {* {if $slide.title || $slide.description}
                            <div class="infos">
                                <h2 class="title">{$slide.title}</h2>
                                <div class="desc">{$slide.description nofilter}</div>
                                <span class="btn action decouvrir btn-orange">{$slide.legend}</span>
                            </div>
                        {/if} *}
                    </a>
                </div>
            {/foreach}
        </div>
    </div>
    <script>
        var hsinterval = {$homeslider.speed};
        var hswrap = {$homeslider.wrap};
        var hspause = "{$homeslider.pause}";
    </script>
{/if}