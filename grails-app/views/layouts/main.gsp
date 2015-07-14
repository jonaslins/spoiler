<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Spoiler"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		%{--<asset:stylesheet src="application.css"/>--}%
		<asset:javascript src="application.js"/>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <style type="text/css" media="screen">
            .navbar-form-alt {padding: 8px 12px}
        </style>
		<g:layoutHead/>
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Spoiler</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
                    <div class="col-sm-6 col-md-6">

                        <form class="navbar-form-alt" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Filmes, Atores, Personagens..." name="srch-term" id="srch-term">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                            </div>
                        </div>
                        </form>
                    </div>
					<sec:ifLoggedIn>

						<form class="navbar-form navbar-right" action='${createLink( controller:'logout')}'method='POST'>
							<button type="submit" class="btn btn-success">
								Log out
							</button>
						</form>
                        <ul class="nav navbar-nav navbar-right">

                            <li><g:link controller="movie">Filmes</g:link></li>
                            <li><g:link controller="actor">Atores</g:link></li>
                            <li class="active"><a href="#"><sec:username/></a></li>
                        </ul>
					</sec:ifLoggedIn>
					<sec:ifNotLoggedIn>
					<form class="navbar-form navbar-right" action='${createLink(uri: '/j_spring_security_check')}'  method='POST'>
						<div class="form-group">
							<input type="text" placeholder="Username" class="form-control" name='j_username'>
						</div>
						<div class="form-group">
							<input type="password" placeholder="Password" class="form-control" name='j_password'>
						</div>
						<button type="submit" class="btn btn-success">
							Log in
						</button>
					</form>
					</sec:ifNotLoggedIn>
				</div><!--/.navbar-collapse -->
			</div>
		</nav>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>

		<g:layoutBody/>

        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	</body>
</html>
