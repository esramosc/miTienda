<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <link href="${resource(dir:'css',file: 'chartStyle.css')}" rel="stylesheet"/>
    <script src="${resource(dir:'js',file: 'chartScript.js')}"></script>
</head>
<body>
<%
    def cellsColor = ["#0DA068","#194E9C","#ED9C13","#ED5713","#057249"];
%>
<div class="row alert alert-warning">
    <h3 style="margin-left: 150px;">Los 5 productos m&aacute;s vendidos por pieza (Monto)</h3>
    <div id="container">
        <canvas id="chart" width="500" height="500"></canvas>
        <table id="chartData">
            <tr>
                <th>Categor&iacute;a</th>
                <th>Monto</th>
            </tr>
            <g:each in="${results}" var="res" status="i">
                <tr style="color:${cellsColor[i]}">
                    <td>${res.name}</td>
                    <td>${res.total}</td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
<script type="text/javascript">
    $( document ).ready(function() {
        // Run the code when the DOM is ready
        $( pieChart );
    });
</script>
</body>
</html>
