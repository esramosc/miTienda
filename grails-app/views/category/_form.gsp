<%@ page import="mitienda.Category" %>


<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required form-group">
            <label for="name">
                Categor&iacute;a
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="name" required="" value="${categoryInstance?.name}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'description', 'error')} required form-group">
            <label for="description">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="description" required="" value="${categoryInstance?.description}" class="form-control"/>
        </div>
    </div>
</div>


