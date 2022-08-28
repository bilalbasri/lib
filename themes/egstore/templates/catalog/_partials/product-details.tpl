<div class="product-details"
     id="product-details"
     data-product="{$product.embedded_attributes|json_encode}"
>
    {block name='product_reference'}
        {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
            <div class="product-detail__item product-reference">
                <label class="label">{l s='Reference' d='Shop.Theme.Catalog'} </label>
                <span itemprop="sku">{$product.reference_to_display}</span>
            </div>
        {/if}
    {/block}
    {block name='product_availability'}
        <div class="product-detail__item product__available--product">
            {if $product.show_availability && $product.availability_message}
                {if $product.availability == 'available'}
                    <span class="label">{l s='Availability' d='Shop.Theme.Catalog'}</span>
                    <span class="value">{$product.availability_message}</span>
                {/if}
            {/if}
        </div>
    {/block}

    {block name='product_quantities'}
        {if $product.show_quantities}
            <div class="product-detail__item product-quantities">
                <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
                <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
            </div>
        {/if}
    {/block}

    {block name='product_availability_date'}
        {if $product.availability_date}
            <div class="product-detail__item product-availability-date">
                <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
                <span>{$product.availability_date}</span>
            </div>
        {/if}
    {/block}

    {block name='product_out_of_stock'}
        <div class="product-detail__item product-out-of-stock">
            {hook h='actionProductOutOfStock' product=$product}
        </div>
    {/block}

    {block name='product_features'}
        {if $product.grouped_features}
            {foreach from=$product.grouped_features item=feature}
                <div class="product-detail__item">
                    <span class="label">{$feature.name}</span>
                    <span class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</span>
                </div>
            {/foreach}
        {/if}
    {/block}
    {block name='product_dimensions'}
        {if $product.depth > 0}
            <div class="product-detail__item">
                <span class="label">{l s='Depth' d='Shop.Theme.Catalog'}</span>
                <span class="value">{sprintf("%.0f", $product.depth)}{Configuration::get('PS_DIMENSION_UNIT')}</span>
            </div>
        {/if}
        {if $product.width > 0}
        <div class="product-detail__item">
                <span class="label">{l s='Width' d='Shop.Theme.Catalog'}</span>
                <span class="value">{sprintf("%.0f", $product.width)}{Configuration::get('PS_DIMENSION_UNIT')}</span>
            </div>
        {/if}
        {if $product.height > 0}
            <div class="product-detail__item">
                <span class="label">{l s='Height' d='Shop.Theme.Catalog'}</span>
                <span class="value">
                    {sprintf("%.0f", $product.height)}{Configuration::get('PS_DIMENSION_UNIT')}
                </span>
            </div>
        {/if}
        {if $product.weight > 0}
            <div class="product-detail__item">
                <span class="label">{l s='Weight' d='Shop.Theme.Catalog'}</span>
                <span class="value">{sprintf("%.0f", $product.weight)}&nbsp{Configuration::get('PS_WEIGHT_UNIT')}</span>
            </div>
        {/if}
    {/block}

    {* if product have specific references, a table will be added to product details section *}
    {block name='product_specific_references'}
        {if !empty($product.specific_references)}
            <section class="product-features">
                <p class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</p>
                <dl class="data-sheet">
                    {foreach from=$product.specific_references item=reference key=key}
                        <dt class="name">{$key}</dt>
                        <dd class="value">{$reference}</dd>
                    {/foreach}
                </dl>
            </section>
        {/if}
    {/block}

    {block name='product_condition'}
        {if $product.condition}
            <div class="product-condition">
                <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
                <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                <span>{$product.condition.label}</span>
            </div>
        {/if}
    {/block}
</div>
