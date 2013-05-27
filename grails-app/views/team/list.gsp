
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="columnLayout" />
</head>

<body>
	<div class="full-width-header">
		<h2>Unsere Gegner ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>
	</div>

	<div class="portfolio-wrapper portfolio-three">
		<ul>
			<g:each in="${teamInstanceList}" var="teamInstance" status="i">
				<li class="image">
					<a href="http://${teamInstance?.website}" target="_blank"><g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamLogosBig + teamInstance?.logoFile}"/></a>
					<a href="http://${teamInstance?.website}" target="_blank"><h2>${teamInstance?.name}</h2></a>
					<p>${teamInstance?.history}</p>
				</li>

				<g:if test="${(i+1) % 3 == 0}">
					<li class="spacer">&nbsp;</li>
				</g:if>
			</g:each>
		</ul>
	</div>
</body>
</html>
