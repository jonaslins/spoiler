
<%@ page import="spoiler.Actor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actor.label', default: 'Actor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container">
        <ul class="nav nav-pills">
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>

        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="row">
            <div class="col-sm-6 col-md-6">
            <table class="table">

            <thead >
                    <tr >

                        <g:sortableColumn property="name" title="${message(code: 'actor.name.label', default: 'Name')}" />


                    </tr>
                </thead>
                <tbody>
                <g:each in="${actorInstanceList}" status="i" var="actorInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${actorInstance.id}">${fieldValue(bean: actorInstance, field: "name")}</g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            </div>
        </div>
        <div class="row">
            <g:paginate total="${actorInstanceCount ?: 0}" />
        </div>

	</div>
	</body>
</html>
