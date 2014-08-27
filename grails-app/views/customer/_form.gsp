<%@ page import="mitienda.Customer" %>


<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required form-group">
            <label for="name">
                Nombre(s)
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="name" required="" value="${customerInstance?.name}" class="form-control letters"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastname', 'error')} required form-group">
            <label for="lastname">
                Apellido(s)
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="lastname" required="" value="${customerInstance?.lastname}" class="form-control letters"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'phone', 'error')} required form-group">
            <label for="phone">
                Tel&eacute;fono
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="phone" required="" value="${customerInstance?.phone}" class="form-control number"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} required form-group">
            <label for="address">
                Direcci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="address" required="" value="${customerInstance?.address}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'status', 'error')} required form-group">
            <label for="status">
                Estatus
                <span class="required-indicator">*</span>
            </label>
            <select name="status" id="status" class="form-control" required="required">
                <option value="">Seleccione</option>
                <option value="ACTIVO" <%if(customerInstance.status=="ACTIVO"){print "selected"}%> >ACTIVO</option>
                <option value="INACTIVO" <%if(customerInstance.status=="INACTIVO"){print "selected"}%> >INACTIVO</option>
            </select>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'comment', 'error')} form-group ">
            <label for="comment">
                Comentarios
            </label>
            <g:textArea name="comment" value="${customerInstance?.comment}" class="form-control"/>
        </div>
    </div>
</div>












