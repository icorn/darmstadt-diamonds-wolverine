
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="newsLayout" />
</head>


<body>
	<div class="left-side">
		<div class="news-list-index" style="margin-top:0px">
			<div class="news-item" style="border-bottom:0px; padding: 0 0 0 0 ;margin: 0 0 20px 0;">
				<g:if test="${gameInstance}">
					<g:render template="/layouts/feature" model="[gameInstance: gameInstance, showGameLink: false]" />

					<%-- generate and show link-bar --%>

					<g:set var="prefix" value=""/>

					<div style="text-align: center;">
						<g:if test="${gameInstance?.preview}">
							<g:if test="${show == Const.SHOW_PREVIEW}">
								<b>Vorschau</b>
							</g:if>
							<g:else>
								<g:link controller="game" action="show" params="['id':gameInstance?.id, 'show': Const.SHOW_PREVIEW]">Vorschau</g:link>
							</g:else>
							<g:set var="prefix" value="&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;"/>
						</g:if>

						<g:if test="${gameInstance?.report}">
							<g:if test="${show == Const.SHOW_REPORT}">
								${prefix}<b>Spielbericht</b>
							</g:if>
							<g:else>
								${prefix}<g:link controller="game" action="show" params="['id':gameInstance?.id, 'show': Const.SHOW_REPORT]">Spielbericht</g:link>
							</g:else>
							<g:set var="prefix" value="&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;"/>
						</g:if>

						<g:if test="${gameInstance?.imageDir}">
							<g:if test="${show == Const.SHOW_PHOTOS}">
								${prefix}<b>Spielfotos</b>
							</g:if>
							<g:else>
								${prefix}<g:link controller="game" action="show" params="['id':gameInstance?.id, 'show': Const.SHOW_PHOTOS]">Spielfotos</g:link>
							</g:else>
							<g:set var="prefix" value="&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;"/>
						</g:if>

						<g:if test="${gameInstance?.statsFile}">
							<g:if test="${show == Const.SHOW_STATS}">
								${prefix}<b>Statistiken</b>
							</g:if>
							<g:else>
<%--
								${prefix}<g:link controller="game" action="show" params="['id':gameInstance?.id, 'show': Const.SHOW_STATS]" target="_blank">Statistiken</g:link>
--%>
								${prefix}<g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathStats + gameInstance?.statsFile}" target="_blank">Statistiken</g:link>
							</g:else>
							<g:set var="prefix" value="&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;"/>
						</g:if>

						<g:if test="${gameInstance?.teamzone}">
							${prefix}<g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamzone + gameInstance?.teamzone}" target="_blank">Teamzone-Magazin</g:link>
						</g:if>
					</div>

					<br/>

					<%-- showing the content --%>

					<g:if test="${show == Const.SHOW_PREVIEW}">
						<g:if test="${gameInstance?.preview && (gameInstance?.preview?.length() > 0)}">
							<dd:renderParagraphs text="${gameInstance?.preview}"/>
						</g:if>
					</g:if>
					<g:elseif test="${show == Const.SHOW_REPORT}">
						<g:if test="${gameInstance?.report && (gameInstance?.report?.length() > 0)}">
							<dd:renderParagraphs text="${gameInstance?.report}"/>
						</g:if>
					</g:elseif>
					<g:elseif test="${show == Const.SHOW_STATS}">
						<g:if test="${gameInstance?.statsFile && (gameInstance?.statsFile?.length() > 0)}">
							<g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathStats + gameInstance?.statsFile}">PDF-Datei mit den Spiel-Statistiken</g:link>
						</g:if>
						<g:else>
							Keine Statistiken verfügbar für diese Spiel.
						</g:else>
					</g:elseif>
<%--
					<g:elseif test="${show == Const.SHOW_PHOTOS}">
					</g:elseif>
--%>
				</g:if>
			</div>
		</div>
	</div>
</body>
</html>
