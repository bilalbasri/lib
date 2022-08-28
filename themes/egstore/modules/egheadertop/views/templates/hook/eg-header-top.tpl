{*
 * 2019 (c) Egio digital
 *
 * MODULE EgHeaderTop
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */
*}

{if isset($headerStatus) && $headerStatus== 1}
    {if isset($headerBackground)}
        <style>
            .eg_top_header{
                background-color: {$headerBackground} ;
            }
        </style>
    {/if}
    <nav class="header-nav eg_top_header">
        <div class="container">
            <div class="nav-top">
                <div class="empty"></div>
                <div class="faq-wrap">
                    {if isset($headerContent) && !empty($headerContent)}
                        {$headerContent nofilter}
                    {/if}
                </div>

            </div>
        </div>
    </nav>
{/if}
