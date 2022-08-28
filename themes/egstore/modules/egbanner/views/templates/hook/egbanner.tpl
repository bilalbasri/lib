{*
 * 2020  (c)  Egio digital
 *
 * MODULE EgBanner
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */
*}
 
{if isset($banners) && !empty($banners) && $status == 1}
    <div id="" class="container">
        {if $model == 1}
            <div class="row lanceurs md1">
        {elseif $model == 2}
            <div class="row lanceurs md2">
        {elseif $model == 3}
            <div class="row lanceurs md3">
        {elseif $model == 4}
            <div class="row lanceurs md4">
        {/if}
            <div class="block-title">
                <h2 class="title-light">
                    {l s='Title' d='Modules.Egbanner.Egbanner'}
                </h2>
                <p class="subtitle-bold">
                    {l s='Sub title' d='Modules.Egbanner.Egbanner'}
                </p>
            </div>
            <div class="col-md-12 pd0 _grid-Categorie wrapper-hp-bloc-slide">
                {*{foreach from=$banners item=banner}
                    <div class="col-md-4">
                        <div class="">
                            {if isset($banner.image) && !empty($banner.image)}
                                <img class="replace-2x img-responsive" src="{$uri}{$banner.image|escape:'html':'UTF-8'}"
                                    alt="{if $banner.alt}{$banner.alt|escape:'htmlall':'UTF-8'}{/if}"
                                    title="{if $banner.title}{$banner.title|escape:'htmlall':'UTF-8'}{/if}" width="100%;" />
                            {/if}
                        </div>
                        <div class="">
                            {if isset($banner.id_category) && !empty($banner.id_category)}
                                <div class="eg-banner-button">
                                    <a class="button whitetored medium-regular"
                                        href="{$link->getCategoryLink($banner.id_category)|escape:'html':'UTF-8'}">
                                        {$banner.category_name|escape:'htmlall':'UTF-8'}
                                    </a>
                                </div>
                            {/if}
                            {if isset($banner.description) && !empty($banner.description)}
                                <div class="eg-banner-desc">
                                    {$banner.description nofilter}
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}*}
                {if $model == 1}
                    {foreach from=$banners item=banner}
                        <div class="col-md-4 item-lanceur">
                            {assign var='linkBanner' value=''}
                            {if Module::isEnabled('egadvancedcms') &&
                            isset($banner.id_page_cms) &&
                            !empty($banner.id_page_cms)}
                                {assign var='linkBanner' value=EgCmsClass::getUrlCms($banner.id_page_cms)}
                            {else}
                                {assign var='linkBanner' value=$link->getCategoryLink($banner.id_category)}
                            {/if}
                            <a href="{$linkBanner}">
                                <div class="item-img">
                                    {if isset($banner.image) && !empty($banner.image)}
                                        <img
                                                class="replace-2x img-responsive"
                                                src="{$uri}{$banner.image|escape:'html':'UTF-8'}"
                                                alt="{if $banner.alt}{$banner.alt|escape:'htmlall':'UTF-8'}{/if}"
                                                title="{if $banner.title}{$banner.title|escape:'htmlall':'UTF-8'}{/if}"
                                                width="100%;" />
                                    {/if}
                                    {if isset($banner.id_category) && !empty($banner.id_category)}
                                        <div class="eg-banner-button">
                                            <button
                                                    class="btn btn-black action"
                                                    href="{$linkBanner}">
                                                <span>
                                                    {l s='Descover' d='Modules.Egbanner.Egbanner'}
                                                </span>
                                            </button>
                                        </div>
                                    {/if}
                                </div>
                            </a>
                            {if isset($banner.description) && !empty($banner.description)}
                                <div class="eg-banner-desc">
                                    {$banner.description nofilter}
                                </div>
                            {/if}
                        </div>
                    {/foreach}
                {elseif $model == 2}
                    {foreach from=$banners item=banner}
                        <div class="col-md-2 item-lanceur">
                            <div class="lanceur">
                                <a href="{$link->getCategoryLink($banner.id_category)|escape:'html':'UTF-8'}">
                                    <div class="item-img">
                                        {if isset($banner.image) && !empty($banner.image)}
                                            <img
                                                class="replace-2x img-responsive"
                                                src="{$uri}{$banner.image|escape:'html':'UTF-8'}"
                                                alt="{if $banner.alt}{$banner.alt|escape:'htmlall':'UTF-8'}{/if}"
                                                title="{if $banner.title}{$banner.title|escape:'htmlall':'UTF-8'}{/if}"
                                                width="100%;" />
                                        {/if}
                                    </div>
                                </a>
                                {if isset($banner.title) && !empty($banner.title)}
                                    <div class="eg-banner-desc">
                                        {$banner.title}
                                    </div>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                {elseif $model == 3}
                    {assign var='counter' value=1}
                    {foreach from=$banners item=banner}
                        <div class="item-categorie">
                            <a href="{$link->getCategoryLink($banner.id_category)|escape:'html':'UTF-8'}">
                                <div class="item-img">
                                    {if isset($banner.image) && !empty($banner.image)}
                                        <img
                                            class="replace-2x img-responsive"
                                            src="{$uri}{$banner.image|escape:'html':'UTF-8'}"
                                            alt="{if $banner.alt}{$banner.alt|escape:'htmlall':'UTF-8'}{/if}"
                                            title="{if $banner.title}{$banner.title|escape:'htmlall':'UTF-8'}{/if}"
                                            />
                                    {/if}
                                </div>
                                {if isset($banner.description) && !empty($banner.description)}
                                    <div class="eg-banner-desc">
                                        <h3 class="title-cat">{$banner.title}</h3>
                                        {* <div class="start">
                                            <span class="title">{l s='A partir de' d='Modules.Egbanner.Egbanner'}</span>
                                            <p class="price">{$banner.description nofilter}</p>
                                        </div> *}
                                    </div>
                                {/if}
                            </a>
                        </div>
                        {if $counter == 3}
                            {* <div class="help">
                                <div class="content-help">
                                    <div class="txt-content">
                                        <span class="title-help">{l s="Vous avez besoin d'aide ?" d='Modules.Egbanner.Egbanner'}</span>
                                        <div class="infos-categorie">
                                            <span class="callus">{l s='Appelez-nous au' d='Modules.Egbanner.Egbanner'}</span>
                                            {if $shop.phone}
                                                <a href="tel:{$shop.phone}" class="txt-tel">
                                                    <i class="icon-tel"></i>
                                                    {l s='%phone%'
                                                    sprintf=[
                                                    '%phone%' =>$shop.phone
                                                    ]
                                                    }
                                                </a>
                                            {/if}
        
                                            <p>{l s='Du lundi au samedi de 8h30 à 19h30' d='Modules.Egbanner.Egbanner'} <br>
                                                {l s='Le dimanche dee 10h30 à 19h30' d='Modules.Egbanner.Egbanner'}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="img-help">
                                        <img src="{$urls.img_url}oek.png" alt="oek-logo">
                                    </div>
                                </div>
                            </div> *}
                        {/if}
                        {assign var='counter' value=$counter+1}
                    {/foreach}
                {elseif $model == 4}
                    {foreach from=$banners item=banner}
                        <div class="col-md-4 espacement">
                            <a href="{$link->getCategoryLink($banner.id_category)|escape:'html':'UTF-8'}">
                            <div class="sous-category">
                                {if isset($banner.image) && !empty($banner.image)}
                                    <img class="replace-2x img-responsive" src="{$uri}{$banner.image|escape:'html':'UTF-8'}"
                                        alt="{if $banner.alt}{$banner.alt|escape:'htmlall':'UTF-8'}{/if}"
                                        title="{if $banner.title}{$banner.title|escape:'htmlall':'UTF-8'}{/if}" width="100%;" />
                                {/if}
                            </div>
                            <div class="description">
                                {if isset($banner.id_category) && !empty($banner.id_category)}
                                    <div class="eg-banner-button">
                                        <span class="button whitetored medium-regular"
                                            >
                                            {$banner.category_name|escape:'htmlall':'UTF-8'}
                                        </span>
                                    </div>
                                {/if}
                                {if isset($banner.description) && !empty($banner.description)}
                                    <div class="eg-banner-desc">
                                        {$banner.description nofilter}
                                    </div>
                                {/if}
                            </div>
                            </a>
                        </div>
                    {/foreach}
                {else}
                Default
                {/if}
            </div>
        </div>
    </div>
{/if}