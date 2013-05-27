
<%@ page import="dd.project.wolverine.PushAndroid" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pushAndroid.label', default: 'PushAndroid')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pushAndroid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pushAndroid" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="deviceId" title="${message(code: 'pushAndroid.deviceId.label', default: 'Device Id')}" />
					
						<g:sortableColumn property="pushScores" title="${message(code: 'pushAndroid.pushScores.label', default: 'Push Scores')}" />
					
						<g:sortableColumn property="pushFinal" title="${message(code: 'pushAndroid.pushFinal.label', default: 'Push Final')}" />
					
						<g:sortableColumn property="createTime" title="${message(code: 'pushAndroid.createTime.label', default: 'Create Time')}" />
					
						<g:sortableColumn property="updateTime" title="${message(code: 'pushAndroid.updateTime.label', default: 'Update Time')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pushAndroidInstanceList}" status="i" var="pushAndroidInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pushAndroidInstance.id}">${fieldValue(bean: pushAndroidInstance, field: "deviceId")}</g:link></td>
					
						<td><g:formatBoolean boolean="${pushAndroidInstance.pushScores}" /></td>
					
						<td><g:formatBoolean boolean="${pushAndroidInstance.pushFinal}" /></td>
					
						<td><g:formatDate date="${pushAndroidInstance.createTime}" /></td>
					
						<td><g:formatDate date="${pushAndroidInstance.updateTime}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pushAndroidInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
