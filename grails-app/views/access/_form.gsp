<%@ page import="mitienda.Access" %>


<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'name', 'error')} required form-group">
            <label for="name">
                Nombre
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="name" required="" value="${accessInstance?.name}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'description', 'error')} required form-group">
            <label for="description">
                Descripci&oacute;n
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="description" required="" value="${accessInstance?.description}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'category', 'error')} required form-group">
            <label for="category">
                Categor&iacute;a?
                <span class="required-indicator">*</span>
            </label>
            <select name="category" id="category" class="form-control" required="required" onchange="enable1(this.value);">
                <option value="">Seleccione</option>
                <option value="SI" <%if(accessInstance.category=="SI"){print "selected"}%> >SI</option>
                <option value="NO" <%if(accessInstance.category=="NO"){print "selected"}%> >NO</option>
            </select>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'subcategory', 'error')} form-group">
            <label for="subcategory">
                Sub-categor&iacute;a?

            </label>
            <select name="subcategory" id="subcategory" class="form-control" onchange="enable3(this.value);" <% if (accessInstance.category != "NO") {print "disabled"} %>>
                <option value="">Seleccione</option>
                <option value="SI" <%if(accessInstance.subcategory=="SI"){print "selected"}%> >SI</option>
                <option value="NO" <%if(accessInstance.subcategory=="NO"){print "selected"}%> >NO</option>
            </select>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'categoryId', 'error')} form-group">
            <label for="categoryId">
                Id de categor&iacute;a
            </label>
            <select name="categoryId" id="categoryId" class="form-control" <% if (accessInstance.subcategory != "SI") {print "disabled"} %>>
                <option value="">Seleccione</option>
                <g:each in="${categories}" var="cat">
                    <option value="${cat.acc_id}" <%if(cat.acc_id.toString()==accessInstance.categoryId){print "selected"}%> >${cat.acc_name}</option>
                </g:each>
            </select>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'control', 'error')} required form-group">
            <label for="control">
                Controller
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="control" required="" value="${accessInstance?.control}" class="form-control"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: accessInstance, field: 'act', 'error')} required form-group">
            <label for="act">
                Action
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="act" required="" value="${accessInstance?.act}" class="form-control"/>
        </div>
    </div>
</div>






