<%@ page import="mitienda.Login" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6">
                <h3>INGRESAR</h3>
                <g:hasErrors bean="${loginInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${loginInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <% if(error!=""){ %>
                    <div class="alert alert-success">
                        <ul>
                            <li>El usuario y/o contrase&ntilde;a son incorrectos.</li>
                        </ul>
                    </div>
                <% } %>
                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-warning" value="Entrar" />
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
