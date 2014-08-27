<%@ page import="mitienda.Supplier" %>


<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'enterprise', 'error')} required form-group">
            <label for="enterprise">
                Empresa
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="enterprise" required="" value="${supplierInstance?.enterprise}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'description', 'error')} required form-group">
            <label for="description">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="description" required="" value="${supplierInstance?.description}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'phone', 'error')} form-group">
            <label for="phone">
                Tel&eacute;fono
            </label>
            <g:textField name="phone" value="${supplierInstance?.phone}" class="form-control number"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'address', 'error')} form-group">
            <label for="address">
                Direcci&oacute;n
            </label>
            <g:textArea name="address" value="${supplierInstance?.address}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">

    </div>
    <div class="col-md-4">

    </div>
</div>

