<%@ page import="mitienda.Products" %>


<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'category', 'error')} required form-group">
            <label for="category">
                Categor&iacute;a
                <span class="required-indicator">*</span>
            </label>
            <select name="category" id="category" class="form-control" required="required">
                <option value="">Seleccione</option>
                <g:each in="${categories}" var="cat">
                    <option value="${cat.id}"<%if(cat.id.toString()==productsInstance.category){print "selected"}%> >${cat.name}</option>
                </g:each>
            </select>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'product', 'error')} required form-group">
            <label for="product">
                Producto
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="product" required="" value="${productsInstance?.product}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'description', 'error')} required form-group">
            <label for="description">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="description" required="" value="${productsInstance?.description}" class="form-control"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'quantity', 'error')} required form-group">
            <label for="quantity">
                Cantidad
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="quantity" type="text" value="${productsInstance.quantity}" required="" class="form-control number"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'buyPrice', 'error')} required form-group">
            <label for="buyPrice">
                Precio de compra
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="buyPrice" value="${fieldValue(bean: productsInstance, field: 'buyPrice')}" required="" class="form-control price" />
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'salePrice', 'error')} required form-group">
            <label for="salePrice">
                Precio de venta
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="salePrice" value="${fieldValue(bean: productsInstance, field: 'salePrice')}" required="" class="form-control price"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'mayorPrice', 'error')} required form-group">
            <label for="mayorPrice">
                Precio mayorista
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="mayorPrice" value="${fieldValue(bean: productsInstance, field: 'mayorPrice')}" required="" class="form-control price"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'tax', 'error')} required form-group">
            <label for="tax">
                IVA
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="tax" value="${fieldValue(bean: productsInstance, field: 'tax')}" required="" class="form-control price"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'minQuantity', 'error')} required form-group">
            <label for="minQuantity">
                Cantidad m&iacute;nima en inventario
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="minQuantity" type="number" min="1" value="${productsInstance.minQuantity}" required="" class="form-control number"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'type', 'error')} required form-group">
            <label for="type">
                Tipo de unidad
                <span class="required-indicator">*</span>
            </label>
            <select name="type" id="type" class="form-control" required="required">
                <option value="">Seleccione</option>
                <option value="Pieza" <%if(productsInstance.type=="Pieza"){print "selected"}%> >Pieza</option>
                <option value="Kilogramo" <%if(productsInstance.type=="Kilogramo"){print "selected"}%> >Kilogramo</option>
            </select>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'barCode', 'error')} form-group">
            <label for="barCode">
                C&oacute;digo de barras
                <span class="required-indicator"></span>
            </label>
            <g:textField name="barCode" value="${productsInstance?.barCode}" class="form-control"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'image', 'error')} form-group">
            <label for="image">
                Imagen
            </label>
            <input type="file" name="image" id="image" class="form-control btn btn-success"/>
        </div>
    </div>
</div>






















