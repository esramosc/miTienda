<%@ page import="mitienda.Region" %>


<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'region', 'error')} required form-group">
            <label for="region">
                Regi&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="region" required="" value="${regionInstance?.region}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'description', 'error')} required form-group">
            <label for="description">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="description" required="" value="${regionInstance?.description}" class="form-control"/>
        </div>
    </div>
</div>
