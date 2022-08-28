
{*    Add active class when you want to active the popup*}
<div class="popup">
    <div class="popup-inner">
        <div class="popup-close"></div>
        <div class="popup-header"></div>
        <div class="popup-content">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">{l s='Librairie' d='Shop.Theme.Catalog'}</th>
                        <th scope="col">{l s='Ville' d='Shop.Theme.Catalog'}</th>
                        <th scope="col">{l s='Prix' d='Shop.Theme.Catalog'}</th>
                        <th scope="col">{l s='Diponiblitité' d='Shop.Theme.Catalog'}</th>
                        <th scope="col">{l s='Retrait magasin' d='Shop.Theme.Catalog'}</th>
                        <th scope="col">{l s='Livraison' d='Shop.Theme.Catalog'}</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td>X</td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td>X</td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td><i class="icon-check"></i></td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td>X</td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td>X</td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td><i class="icon-check"></i></td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td>X</td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    <tr>
                        <td>{l s='Librairie A' d='Shop.Theme.Catalog'}</td>
                        <td>{l s='Rabat' d='Shop.Theme.Catalog'}</td>
                        <td><div class="price">590 DH</div></td>
                        <td>
                            {block name='product_availability'}
                                <span class="product__available">
                                    {if $product.show_availability && $product.availability_message}
                                        {if $product.availability == 'available'}
                                            <i></i>
                                            {$product.availability_message}
                                        {/if}
                                    {/if}
                                    </span>
                            {/block}
                        </td>
                        <td><i class="icon-check"></i></td>
                        <td>X</td>
                        <td><button class="btn btn-primary add-to-cart">{l s='Ajouter au panier' d='Shop.Theme.Catalog'}</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>