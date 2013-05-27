
<%@ page import="dd.project.wolverine.GameYouthA" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gameYouthA.label', default: 'GameYouthA')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gameYouthA" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gameYouthA" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gameYouthA">
			
				<g:if test="${gameYouthAInstance?.weekend}">
				<li class="fieldcontain">
					<span id="weekend-label" class="property-label"><g:message code="gameYouthA.weekend.label" default="Weekend" /></span>
					
						<span class="property-value" aria-labelledby="weekend-label"><g:fieldValue bean="${gameYouthAInstance}" field="weekend"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.opponentStadium}">
				<li class="fieldcontain">
					<span id="opponentStadium-label" class="property-label"><g:message code="gameYouthA.opponentStadium.label" default="Opponent Stadium" /></span>
					
						<span class="property-value" aria-labelledby="opponentStadium-label"><g:fieldValue bean="${gameYouthAInstance}" field="opponentStadium"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="gameYouthA.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${gameYouthAInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="gameYouthA.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:fieldValue bean="${gameYouthAInstance}" field="time"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeStadium}">
				<li class="fieldcontain">
					<span id="homeStadium-label" class="property-label"><g:message code="gameYouthA.homeStadium.label" default="Home Stadium" /></span>
					
						<span class="property-value" aria-labelledby="homeStadium-label"><g:link controller="homeStadium" action="show" id="${gameYouthAInstance?.homeStadium?.id}">${gameYouthAInstance?.homeStadium?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeTeamName}">
				<li class="fieldcontain">
					<span id="homeTeamName-label" class="property-label"><g:message code="gameYouthA.homeTeamName.label" default="Home Team Name" /></span>
					
						<span class="property-value" aria-labelledby="homeTeamName-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeTeamName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestTeamName}">
				<li class="fieldcontain">
					<span id="guestTeamName-label" class="property-label"><g:message code="gameYouthA.guestTeamName.label" default="Guest Team Name" /></span>
					
						<span class="property-value" aria-labelledby="guestTeamName-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestTeamName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.preview}">
				<li class="fieldcontain">
					<span id="preview-label" class="property-label"><g:message code="gameYouthA.preview.label" default="Preview" /></span>
					
						<span class="property-value" aria-labelledby="preview-label"><g:fieldValue bean="${gameYouthAInstance}" field="preview"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.report}">
				<li class="fieldcontain">
					<span id="report-label" class="property-label"><g:message code="gameYouthA.report.label" default="Report" /></span>
					
						<span class="property-value" aria-labelledby="report-label"><g:fieldValue bean="${gameYouthAInstance}" field="report"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="gameYouthA.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="gameCategory" action="show" id="${gameYouthAInstance?.category?.id}">${gameYouthAInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.imageDir}">
				<li class="fieldcontain">
					<span id="imageDir-label" class="property-label"><g:message code="gameYouthA.imageDir.label" default="Image Dir" /></span>
					
						<span class="property-value" aria-labelledby="imageDir-label"><g:fieldValue bean="${gameYouthAInstance}" field="imageDir"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.ddPictureUrl}">
				<li class="fieldcontain">
					<span id="ddPictureUrl-label" class="property-label"><g:message code="gameYouthA.ddPictureUrl.label" default="Dd Picture Url" /></span>
					
						<span class="property-value" aria-labelledby="ddPictureUrl-label"><g:fieldValue bean="${gameYouthAInstance}" field="ddPictureUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeScore}">
				<li class="fieldcontain">
					<span id="homeScore-label" class="property-label"><g:message code="gameYouthA.homeScore.label" default="Home Score" /></span>
					
						<span class="property-value" aria-labelledby="homeScore-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeQ1}">
				<li class="fieldcontain">
					<span id="homeQ1-label" class="property-label"><g:message code="gameYouthA.homeQ1.label" default="Home Q1" /></span>
					
						<span class="property-value" aria-labelledby="homeQ1-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeQ1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeQ2}">
				<li class="fieldcontain">
					<span id="homeQ2-label" class="property-label"><g:message code="gameYouthA.homeQ2.label" default="Home Q2" /></span>
					
						<span class="property-value" aria-labelledby="homeQ2-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeQ2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeQ3}">
				<li class="fieldcontain">
					<span id="homeQ3-label" class="property-label"><g:message code="gameYouthA.homeQ3.label" default="Home Q3" /></span>
					
						<span class="property-value" aria-labelledby="homeQ3-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeQ3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeQ4}">
				<li class="fieldcontain">
					<span id="homeQ4-label" class="property-label"><g:message code="gameYouthA.homeQ4.label" default="Home Q4" /></span>
					
						<span class="property-value" aria-labelledby="homeQ4-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeQ4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.homeOt}">
				<li class="fieldcontain">
					<span id="homeOt-label" class="property-label"><g:message code="gameYouthA.homeOt.label" default="Home Ot" /></span>
					
						<span class="property-value" aria-labelledby="homeOt-label"><g:fieldValue bean="${gameYouthAInstance}" field="homeOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestScore}">
				<li class="fieldcontain">
					<span id="guestScore-label" class="property-label"><g:message code="gameYouthA.guestScore.label" default="Guest Score" /></span>
					
						<span class="property-value" aria-labelledby="guestScore-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestQ1}">
				<li class="fieldcontain">
					<span id="guestQ1-label" class="property-label"><g:message code="gameYouthA.guestQ1.label" default="Guest Q1" /></span>
					
						<span class="property-value" aria-labelledby="guestQ1-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestQ1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestQ2}">
				<li class="fieldcontain">
					<span id="guestQ2-label" class="property-label"><g:message code="gameYouthA.guestQ2.label" default="Guest Q2" /></span>
					
						<span class="property-value" aria-labelledby="guestQ2-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestQ2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestQ3}">
				<li class="fieldcontain">
					<span id="guestQ3-label" class="property-label"><g:message code="gameYouthA.guestQ3.label" default="Guest Q3" /></span>
					
						<span class="property-value" aria-labelledby="guestQ3-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestQ3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestQ4}">
				<li class="fieldcontain">
					<span id="guestQ4-label" class="property-label"><g:message code="gameYouthA.guestQ4.label" default="Guest Q4" /></span>
					
						<span class="property-value" aria-labelledby="guestQ4-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestQ4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthAInstance?.guestOt}">
				<li class="fieldcontain">
					<span id="guestOt-label" class="property-label"><g:message code="gameYouthA.guestOt.label" default="Guest Ot" /></span>
					
						<span class="property-value" aria-labelledby="guestOt-label"><g:fieldValue bean="${gameYouthAInstance}" field="guestOt"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gameYouthAInstance?.id}" />
					<g:link class="edit" action="edit" id="${gameYouthAInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
