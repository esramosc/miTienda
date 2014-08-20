<%@ page import="mitienda.Access" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <script src="${resource(dir:'js',file:'functions.js')}"></script>
        <script type="text/javascript">
            <%
                if(errorSubcat!=""){
                    print "alert('Seleccione un Id de categoria');"
                }
            %>
        </script>
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8">
                <h3>Agregar acceso</h3>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${accessInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${accessInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-success" value="Enviar" />
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-2">&nbsp;</div>
		</div>
        <script>
            $(document).ready(function () {

                $('#category').change(function () {
                    var selectoption = $(this).find('option:selected');
                    /*  alert(selectoption.text());  */
                    if (selectoption.text() == "SI") {
                        $('#control').val("#");
                        $('#act').val("#");

                    }

                    else {
                        $('#control').val("");
                        $('#act').val("");

                    }

                });
            });

        </script>
	</body>
</html>
