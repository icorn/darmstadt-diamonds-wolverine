
<%@ page import="dd.project.wolverine.HomeStadium" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'homeStadium.label', default: 'HomeStadium')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-homeStadium" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-homeStadium" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'homeStadium.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="capacity" title="${message(code: 'homeStadium.capacity.label', default: 'Capacity')}" />
					
						<g:sortableColumn property="directions" title="${message(code: 'homeStadium.directions.label', default: 'Directions')}" />
					
						<g:sortableColumn property="imageDirections" title="${message(code: 'homeStadium.imageDirections.label', default: 'Image Directions')}" />
					
						<g:sortableColumn property="imageStadium" title="${message(code: 'homeStadium.imageStadium.label', default: 'Image Stadium')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'homeStadium.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${homeStadiumInstanceList}" status="i" var="homeStadiumInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${homeStadiumInstance.id}">${fieldValue(bean: homeStadiumInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: homeStadiumInstance, field: "capacity")}</td>
					
						<td>${fieldValue(bean: homeStadiumInstance, field: "directions")}</td>
					
						<td>${fieldValue(bean: homeStadiumInstance, field: "imageDirections")}</td>
					
						<td>${fieldValue(bean: homeStadiumInstance, field: "imageStadium")}</td>
					
						<td>${fieldValue(bean: homeStadiumInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${homeStadiumInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
