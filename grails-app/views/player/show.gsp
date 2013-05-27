
<%@ page import="dd.project.wolverine.Player" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-player" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-player" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list player">
			
				<g:if test="${playerInstance?.nickname}">
				<li class="fieldcontain">
					<span id="nickname-label" class="property-label"><g:message code="player.nickname.label" default="Nickname" /></span>
					
						<span class="property-value" aria-labelledby="nickname-label"><g:fieldValue bean="${playerInstance}" field="nickname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="player.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${playerInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="player.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${playerInstance}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="player.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${playerInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="player.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${playerInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="player.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${playerInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="player.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${playerInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="player.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${playerInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="player.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${playerInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.scores}">
				<li class="fieldcontain">
					<span id="scores-label" class="property-label"><g:message code="player.scores.label" default="Scores" /></span>
					
						<g:each in="${playerInstance.scores}" var="s">
						<span class="property-value" aria-labelledby="scores-label"><g:link controller="score" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.seasons}">
				<li class="fieldcontain">
					<span id="seasons-label" class="property-label"><g:message code="player.seasons.label" default="Seasons" /></span>
					
						<g:each in="${playerInstance.seasons}" var="s">
						<span class="property-value" aria-labelledby="seasons-label"><g:link controller="playerSeason" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${playerInstance?.id}" />
					<g:link class="edit" action="edit" id="${playerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
