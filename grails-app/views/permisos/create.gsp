<%@ page import="mitienda.Permisos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
			<h3>Agregar / Quitar permisos</h3>
            <form method="POST" action="save" >
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <td>&nbsp;</td>
                        <g:each in="${roles}" var="rl">
                            <td>${rl.role_name}</td>
                        </g:each>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${accesos}" var="ac" >
                        <tr>
                            <td>${ac.acc_name}</td>
                            <g:each in="${roles}" var="rl">
                                <td><input type="checkbox" name="acceso${ac.acc_id}_role${rl.role_id}" value="${ac.acc_id}_${rl.role_id}"
                                    <g:each in="${permisos}" var="pe">
                                        <%if((int)ac.acc_id==Integer.parseInt(pe.acc_id) && (int)rl.role_id==Integer.parseInt(pe.role_id)){print "checked"} %>
                                    </g:each>/></td>

                            </g:each>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <input class="btn btn-success" type="submit" value="Guardar">
            </form>
		</div>
	</body>
</html>
