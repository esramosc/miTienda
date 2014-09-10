<%--
  Created by IntelliJ IDEA.
  User: Eulogio
  Date: 11/5/13
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="row">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6" style="text-align: center;">
                <div>
                    <img src="${resource(dir:'images',file:'error404.png')}" class="img-circle" width="350"/>
                </div>
                <div>
                    <h2>Ha ocurrido un error inesperado.</h2></br>
                    <h3>Intente ir a la pagina de inicio</h3></br>
                </div>
                <div>
                    <g:link controller="login" action="create" class="btn btn-lg btn-danger">INICIO</g:link>
                </div>
                <br/><br/>
            </div>
            <div class="col-md-3">&nbsp;</div>
        </div>
    </body>
</html>