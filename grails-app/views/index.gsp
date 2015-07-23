<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}
			h5{
				display:inline-block;
				width:100%;
				white-space: nowrap;
				overflow:hidden !important;
				text-overflow: ellipsis;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}

		</style>
	</head>
	<body>
	<div class="jumbotron">
		<div class="container">
		</div>
	</div>
    <div class="container">
		<sec:ifLoggedIn>
		<g:if test="${recentLikes?.size()>0}">
			<div class="row">
				<h4>Recent likes:</h4>

				<g:each var="rm" in="${recentLikes}">

					<div class="col-sm-6 col-md-2">

						<div class="thumbnail" >
							<asset:image src="movie.png" alt="Grails"/>
							<div class="caption">
								<h5>${rm.name}</h5>
							<p><a class="btn btn-default" href="${createLink(controller: "movie", action: "show", id: rm.id)}" role="button">View details »</a></p>
							</div>
						</div>
					</div>
				</g:each>
			</div>
		</g:if>
		<div class="row">
			<h4>Movies you might like:</h4>
			<g:each var="rm" in="${recommendedMovies}">
				<div class="col-sm-6 col-md-2">
					<div class="thumbnail" >
						<asset:image src="movie.png" alt="Grails"/>
						<div class="caption">
							<h5>${rm.name}</h5>
							<p><a class="btn btn-default" href="${createLink(controller: "movie", action: "show", id: rm.id)}" role="button">View details »</a></p>
						</div>
					</div>
				</div>
			</g:each>
		</div>
		</sec:ifLoggedIn>
		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
					</g:each>
				</ul>
			</div>
		</sec:ifAllGranted>

	</div>

	</body>
</html>
