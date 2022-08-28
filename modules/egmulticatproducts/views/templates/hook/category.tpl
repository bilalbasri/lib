{*
 * 2020  (c)  Egio digital
 *
 * MODULE EgAdvancedMenu
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */
*}
{if isset($bloc) && !empty($bloc)}

    <div  class="PM_ASBlockOutput PM_ASBlockOutputVertical advanced-filter-mobile">
        <div  class="filter-wrapper">
            <div  class="PM_ASCriterionsGroup PM_ASCriterionsGroupSubcategory filter-mod">
                <div  class="PM_ASCriterionsOutput">
                    <div  class="PM_ASCriterions PM_ASCriterionsToggleHover">
                        <p class="PM_ASCriterionsGroupTitle h4" >
                        <span class="PM_ASCriterionsGroupName">
                            Sous-catégories
                        </span>
                        </p>

                        <div class="PM_ASCriterionsGroupOuter">

                            <div class="PM_ASCriterionStepEnable">
                                <ul  class="bullet PM_ASCriterionGroupLink">

                                    {foreach from=$bloc item=info}
                                        <li>
                                            <a href="
                                            {if !empty($info.link)}
                                                {$info.link}
                                            {elseif !empty($info.id_category) && !empty($info.category_link)}
                                                {$info.category_link}
                                            {else}
                                                #
                                            {/if}" class="Linkfilter">
                                            <span class="PM_ASCriterionValue">
                                                {$info.label} </span>
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}

