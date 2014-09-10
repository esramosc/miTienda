<%@ page import="mitienda.Supplier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8">
                <h3>Editar proveedor</h3>
                <g:hasErrors bean="${supplierInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${supplierInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:form method="post" >
                    <g:hiddenField name="id" value="${supplierInstance?.id}" />
                    <g:hiddenField name="version" value="${supplierInstance?.version}" />
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:actionSubmit class="btn btn-success" action="update" value="Actualizar" />
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-2">&nbsp;</div>
		</div>
	</body>
</html>
