
<%@ page import="dd.project.wolverine.Player" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-player" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-player" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nickname" title="${message(code: 'player.nickname.label', default: 'Nickname')}" />
					
						<g:sortableColumn property="dateOfBirth" title="${message(code: 'player.dateOfBirth.label', default: 'Date Of Birth')}" />
					
						<g:sortableColumn property="position" title="${message(code: 'player.position.label', default: 'Position')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'player.number.label', default: 'Number')}" />
					
						<g:sortableColumn property="height" title="${message(code: 'player.height.label', default: 'Height')}" />
					
						<g:sortableColumn property="weight" title="${message(code: 'player.weight.label', default: 'Weight')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${playerInstanceList}" status="i" var="playerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${playerInstance.id}">${fieldValue(bean: playerInstance, field: "nickname")}</g:link></td>
					
						<td><g:formatDate date="${playerInstance.dateOfBirth}" /></td>
					
						<td>${fieldValue(bean: playerInstance, field: "position")}</td>
					
						<td>${fieldValue(bean: playerInstance, field: "number")}</td>
					
						<td>${fieldValue(bean: playerInstance, field: "height")}</td>
					
						<td>${fieldValue(bean: playerInstance, field: "weight")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${playerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
