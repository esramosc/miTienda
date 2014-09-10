<%@ page import="mitienda.StockBranch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6">
                <h3>Agregar Stock a sucursal</h3>
                <g:hasErrors bean="${stockBranchInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${stockBranchInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:if test="${error}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <li>El producto ya ha sido dado de alta en la sucursal seleccionada, para editar el inventario busquelo en el listado</li>
                        </ul>
                    </div>
                </g:if>
                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-success" value="Enviar" />
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
