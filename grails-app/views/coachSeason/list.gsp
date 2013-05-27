
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="column4Layout" />
</head>

<body>
	<div class="portfolio-wrapper portfolio-four">
		<div class="section-header">
			<h2>Coaches ${categoryName} ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>
		</div>

		<g:if test="${coachSeasonInstanceList?.size() > 0}">
			<ul>
				<g:each in="${coachSeasonInstanceList}" var="coachSeasonInstance" status="i">
					<li class="image">
						<g:if test="${coachSeasonInstance?.coach?.image}">
							<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathCoachesImages + coachSeasonInstance?.coach?.image}"/>
						</g:if>
						<g:else>
							<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathUnknownPlayerImage}"/>
						</g:else>

						<h2>${coachSeasonInstance?.coach?.firstname}<br/>${coachSeasonInstance?.coach?.lastname}</h2>
						<h3>${coachSeasonInstance?.title}</h3>

						<g:if test="${!hideText}">
							<g:if test="${coachSeasonInstance?.coach?.shorttext}">
								<p>${coachSeasonInstance?.coach?.shorttext}</p>
							</g:if>
							<g:else>
								<p>${coachSeasonInstance?.coach?.text}</p>
							</g:else>
						</g:if>
					</li>
					<g:if test="${(i+1) % 4 == 0}">
						<li class="spacer" style="width: 587px;">&nbsp;</li>
					</g:if>
				</g:each>
			</ul>
		</g:if>
		<g:else>
			Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegen derzeit keine Informationen zu Coaches vor.
		</g:else>
	</div>
</body>
</html>
