
<%@ page import="dd.project.wolverine.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-team" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list team">
			
				<g:if test="${teamInstance?.unused}">
				<li class="fieldcontain">
					<span id="unused-label" class="property-label"><g:message code="team.unused.label" default="Unused" /></span>
					
						<span class="property-value" aria-labelledby="unused-label"><g:fieldValue bean="${teamInstance}" field="unused"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.logoFile}">
				<li class="fieldcontain">
					<span id="logoFile-label" class="property-label"><g:message code="team.logoFile.label" default="Logo File" /></span>
					
						<span class="property-value" aria-labelledby="logoFile-label"><g:fieldValue bean="${teamInstance}" field="logoFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.history}">
				<li class="fieldcontain">
					<span id="history-label" class="property-label"><g:message code="team.history.label" default="History" /></span>
					
						<span class="property-value" aria-labelledby="history-label"><g:fieldValue bean="${teamInstance}" field="history"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.website}">
				<li class="fieldcontain">
					<span id="website-label" class="property-label"><g:message code="team.website.label" default="Website" /></span>
					
						<span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${teamInstance}" field="website"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.directions}">
				<li class="fieldcontain">
					<span id="directions-label" class="property-label"><g:message code="team.directions.label" default="Directions" /></span>
					
						<span class="property-value" aria-labelledby="directions-label"><g:fieldValue bean="${teamInstance}" field="directions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.stadium}">
				<li class="fieldcontain">
					<span id="stadium-label" class="property-label"><g:message code="team.stadium.label" default="Stadium" /></span>
					
						<span class="property-value" aria-labelledby="stadium-label"><g:fieldValue bean="${teamInstance}" field="stadium"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="team.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${teamInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.nickname}">
				<li class="fieldcontain">
					<span id="nickname-label" class="property-label"><g:message code="team.nickname.label" default="Nickname" /></span>
					
						<span class="property-value" aria-labelledby="nickname-label"><g:fieldValue bean="${teamInstance}" field="nickname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="team.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${teamInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teamInstance?.id}" />
					<g:link class="edit" action="edit" id="${teamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
