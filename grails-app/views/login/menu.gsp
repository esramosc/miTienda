<%@ page import="mitienda.Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="row">
            <div class="row">
                <div class="col-sm-1">&nbsp;</div>
                <div class="col-md-5">
                    <div class="panelNew panel-redNew">
                        <div>
                            <h3>Bienvenido: <strong>${nameOfUser}</strong></h3>
                        </div>
                        <div class="actual-date">
                            <div class="actual-day">
                                <img src="${resource(dir:'userPhotos',file:userImage)}" class="img-thumbnail" width="200px"/>
                            </div>
                            <div class="actual-month">&nbsp;</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="panelNew panel-redNew">
                        <div>
                            <h3>La fecha de hoy es:</h3>
                        </div>
                        <div class="actual-date">
                            <div class="actual-day">${day}</div>
                            <div class="actual-month">${month}</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1">&nbsp;</div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
                <div class="col-sm-1">&nbsp;</div>
                <div class="col-sm-4">
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>Ventas (Efectivo)</h3>
                        </div>
                        <div class="icon">
                            ${cashSales}
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    &nbsp;
                </div>
                <div class="col-sm-4">
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>Ventas (Cr&eacute;dito)</h3>
                        </div>
                        <div class="icon" style="text-align: center !important;">
                            ${creditSales}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
