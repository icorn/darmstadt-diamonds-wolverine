
<%@ page import="dd.project.wolverine.PlayerSeason" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'playerSeason.label', default: 'PlayerSeason')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-playerSeason" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-playerSeason" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list playerSeason">
			
				<g:if test="${playerSeasonInstance?.player}">
				<li class="fieldcontain">
					<span id="player-label" class="property-label"><g:message code="playerSeason.player.label" default="Player" /></span>
					
						<span class="property-value" aria-labelledby="player-label"><g:link controller="player" action="show" id="${playerSeasonInstance?.player?.id}">${playerSeasonInstance?.player?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerSeasonInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="playerSeason.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${playerSeasonInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${playerSeasonInstance?.id}" />
					<g:link class="edit" action="edit" id="${playerSeasonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
