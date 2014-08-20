<%@ page import="mitienda.Branch" %>


<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'region', 'error')} required form-group">
            <label for="region">
                Regi&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <select name="region" id="region" class="form-control" required="required">
                <option value="">Seleccione</option>
                <g:each in="${regions}" var="reg">
                    <option value="${reg.id}" <%if(reg.id.toString()==branchInstance.region){print "selected"}%> >${reg.region}</option>
                </g:each>
            </select>
        </div>
    </div>
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branch', 'error')} required form-group">
            <label for="branch">
                Nombre de la sucursal
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="branch" required="" value="${branchInstance?.branch}" class="form-control"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'description', 'error')} required form-group">
            <label for="description">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="description" required="" value="${branchInstance?.description}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'status', 'error')} required form-group">
            <label for="status">
                Estatus
                <span class="required-indicator">*</span>
            </label>
            <select name="status" id="status" class="form-control" required="required">
                <option value="">Seleccione</option>
                <option value="ACTIVA" <%if(branchInstance.status=="ACTIVA"){print "selected"}%> >ACTIVA</option>
                <option value="INACTIVA" <%if(branchInstance.status=="INACTIVA"){print "selected"}%> >INACTIVA</option>
                <option value="ELIMINADA" <%if(branchInstance.status=="ELIMINADA"){print "selected"}%> >ELIMINADA</option>
            </select>
        </div>
    </div>
</div>


