<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Mi Tienda</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.png')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir:'css/owl',file:'owl.carousel.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir:'css/owl',file:'owl.theme.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir:'css/owl',file:'owl.transitions.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir:'css',file:'styles.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir:'css',file:'menu.css')}" type="text/css">
        <g:javascript library="jquery" plugin="jquery"/>
        <style>
            body {

                background-color: #98cc84;
            }
        </style>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
        <div class="container">
            <div class="content">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-2">
                                <img src="${resource(dir:'images',file:'tienda-online.png')}" class="img-rounded" width="180px"/>
                            </div>
                            <div class="col-md-10">
                                <div style="height: 100px;">
                                    <div id="owl-demo" class="owl-carousel">
                                        <div class="item"><img src="${resource(dir:'images',file:'banner1.png')}"></div>
                                        <div class="item"><img src="${resource(dir:'images',file:'banner2.png')}"></div>
                                        <div class="item"><img src="${resource(dir:'images',file:'banner3.png')}"></div>
                                        <div class="item"><img src="${resource(dir:'images',file:'banner4.png')}"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <%
                                def roleId = session.roleId
                                if(roleId!=null){
                            %>
                            <g:menu roleId="${roleId}"/>
                            <%
                                }
                            %>
                        </div>
                        <div class="row">
                            <g:layoutBody/>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <small>Desarrollado por: <strong>ESR.</strong> Contactar a: <a href="mailto:esramosc@hotmail.com">esramosc@hotmail.com</a>, tel&eacute;fono celular: <a href="tel:+529211848994">+52 921 - 184 8994</a>. </small>
                    </div>
                </div>

            </div>
        </div>
        <script src="${resource(dir:'js',file:'jquery.alphanumeric.pack.js')}"></script>
        <script src="${resource(dir:'js/owl',file:'owl.carousel.js')}"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#owl-demo").owlCarousel({
                    navigation : false,
                    singleItem : true,
                    transitionStyle : "fade",
                    autoPlay : true,
                    pagination : false,
                    slideSpeed : 1000
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.number').numeric({allow: "9"});
                $('.letters').alpha({allow: " "});
                $('.price').numeric({allow:"."});
            });
        </script>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
