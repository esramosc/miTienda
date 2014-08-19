<%@ page import="mitienda.AdminUser" %>


<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'name', 'error')} required form-group">
            <label for="name">
                Nombre
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="name" required="" value="${adminUserInstance?.name}" class="form-control letters"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'lastname', 'error')} required form-group">
            <label for="lastname">
                Apellido
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="lastname" required="" value="${adminUserInstance?.lastname}" class="form-control letters"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'phone', 'error')} required form-group">
            <label for="phone">
                Tel&eacute;fono
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="phone" required="" value="${adminUserInstance?.phone}" class="form-control number"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'address', 'error')} required form-group">
            <label for="address">
                Direcci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="address" required="" value="${adminUserInstance?.address}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'branch', 'error')} required form-group">
            <label for="branch">
                Sucursal
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="branch" required="" value="${adminUserInstance?.branch}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'status', 'error')} required form-group">
            <label for="status">
                Estatus
                <span class="required-indicator">*</span>
            </label>
            <select name="status" id="status" class="form-control" required="required">
                <option value="">Seleccione</option>
                <option value="ACTIVO" <%if(adminUserInstance.status=="ACTIVO"){print "selected"}%> >ACTIVO</option>
                <option value="INACTIVO" <%if(adminUserInstance.status=="INACTIVO"){print "selected"}%> >INACTIVO</option>
                <option value="ELIMINADO" <%if(adminUserInstance.status=="ELIMINADO"){print "selected"}%> >ELIMINADO</option>
            </select>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'username', 'error')} required form-group">
            <label for="username">
                Nombre de usuario
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="username" required="" value="${adminUserInstance?.username}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'password', 'error')} required form-group">
            <label for="password">
                Contrase&ntilde;a
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="password" required="" value="${adminUserInstance?.password}" class="form-control"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'photo', 'error')} form-group">
            <label for="photo">
                Foto
            </label>
            <input type="file" name="photo" id="photo" class="form-control btn btn-success"/>
        </div>
    </div>
</div>