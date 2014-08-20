<%@ page import="mitienda.Role" %>


<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'roleName', 'error')} required form-group">
            <label for="roleName">
                Rol
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="roleName" required="" value="${roleInstance?.roleName}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'roleDescription', 'error')} required form-group">
            <label for="roleDescription">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="roleDescription" required="" value="${roleInstance?.roleDescription}" class="form-control"/>
        </div>
    </div>
</div>

