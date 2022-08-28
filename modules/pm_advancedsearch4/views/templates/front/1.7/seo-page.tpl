{extends file='catalog/listing/category.tpl'}

{block name='product_list_header'}
    <div class="container">
        <div class="row banner-category  ">
            {hook h='displayCustomContent' title_seo=$as_seo_title}
        </div>
    </div>
{/block}

{block name='product_list_active_filters'}
    <div id="js-active-search-filters" class="hidden-sm-down">
        {$listing.rendered_active_filters nofilter}
    </div>
{/block}

{block name='content'}
    <div id="PM_ASearchResults" data-id-search="{$id_search|intval}">
        <div id="PM_ASearchResultsInner" class="PM_ASearchResultsInner_{$id_search|intval}">
            {$smarty.block.parent}
            {if isset($as_cross_links) && $as_cross_links && sizeof($as_cross_links)}
                <div id="PM_ASearchSeoCrossLinks" class="card-block">
                    <h4 class="h4">{$as_see_also_txt}</h4>
                    <ul class="bullet">
                    {foreach from=$as_cross_links item=as_cross_link}
                        <li>
                            <a href="{$as_cross_link.public_url nofilter}">{$as_cross_link.title}</a>
                        </li>
                    {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
        {if $as_seo_description}
            <div class="block-category card card-block hidden-sm-down">
                {if $as_seo_description}
                    <div id="category-description" class=" bottom-description text-muted">{$as_seo_description nofilter}</div>
                {/if}
            </div>
        {/if}
    </div>
{/block}