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
			<h1>Hello, world!</h1>
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
			%{--<p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>--}%
			%{--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more »</a></p>--}%
		</div>
	</div>
    <div class="container">

        <div class="row">


            <div class="col-sm-6 col-md-2">
                <h4>Recent likes:</h4>
                <div class="thumbnail">
                    <img width="162" height="240" src="http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1._SY317_.jpg" class="postim wp-post-image" alt="Fifty-Shades-of-Grey">
                    <div class="caption">
                        <h4>Iron Man 3</h4>
                        <p>When Tony Stark's world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.</p>
                        <p><a class="btn btn-default" href="#" role="button">View details »</a></p>
                    </div>
                </div>

            </div>
            <div class="col-sm-6 col-md-2">
                <br><br>
                <div class="thumbnail">
                    <img width="162" height="240" src="http://ia.media-imdb.com/images/M/MV5BMTYxMjA5NDMzNV5BMl5BanBnXkFtZTcwOTk2Mjk3NA@@._V1_SX214_AL_.jpg" class="postim wp-post-image" alt="Fifty-Shades-of-Grey">
                    <div class="caption">
                        <h4>Thor</h4>
                        <p>The powerful but arrogant god Thor is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.</p>
                        <p><a class="btn btn-default" href="#" role="button">View details »</a></p>
                    </div>
                </div>
            </div>
            <h4>Movies you might like:</h4>
			<div class="col-sm-6 col-md-2">
				<div class="thumbnail">
					<img width="162" height="240" src="http://www.coverwhiz.com/content/The-Avengers.jpg" class="postim wp-post-image" alt="Fifty-Shades-of-Grey">
					<div class="caption">
						<h4>The Avengers</h4>
						<p>Earth's mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity</p>
						<p><a class="btn btn-default" href="#" role="button">View details »</a></p>
					</div>
				</div>
			</div>
        </div>
    </div>

	</body>
</html>
