<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title></title>
    </head>
    <body>
        <div class="row alert alert-warning">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-10">
                <%if (Integer.parseInt(contadorPermisos)==1){ %>
                <p class="text-left text-info"> ${permisos}</p>
                <%}
                else{ %>
                <g:each in="${permisos}" var="pe">
                    <p class="text-left text-info">${pe}</p>
                </g:each>
                <%}%>
            </div>
            <div class="col-md-1">&nbsp;</div>
        </div>

    </body>
</html>