<%--
  Created by IntelliJ IDEA.
  User: oli
  Date: 03.03.13
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>
<%@ page import="dd.project.wolverine.Util" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Calendar" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="newsLayout" />
	</head>
	<body>
		<div class="left-side">
			<div class="article-wrapper" style="margin-top:8px;">
				<h2>Spielplan Herrenteam ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>
				<div class="news-list-index" style="margin-top:10px">
					<g:if test="${gameInstanceList?.size() > 0}">
						<table class="ddtable">
							<g:each in="${gameInstanceList}" var="schedule">
								<g:if test="${schedule.size() > 0}">
									<tr class="ddtableHeader">
										<th colspan="7" style="text-align: left">${schedule[0]?.category}e</th>
									</tr>
									<g:each in="${schedule}" var="gameInstance" status="i">
										<tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
											<td class="ddtableRightBorder" style="padding-left: 3px;padding-right: 3px;">
												<dd:formatGameDate game="${gameInstance}"/><br/>
												${gameInstance.time ? gameInstance.time + " Uhr" : " "}<br/>

												<div style="font-size: 10px;">
													<g:if test="${gameInstance?.homeTeam?.id == Const.DIAMONDS_TEAM_ID}">
														${gameInstance?.homeStadium?.name}
													</g:if>
													<g:else>
														${gameInstance?.homeTeam?.stadium}
													</g:else>
												</div>
											</td>
											<td style="padding-right:0"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamLogos + gameInstance?.homeTeam?.logoFile}" width="40"/></td>
											<td style="padding-left:5; text-align: left">${gameInstance.homeTeam.city}<br/>${gameInstance.homeTeam.nickname}</td>
											<td>vs.</td>
											<td style="padding-right:0"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamLogos + gameInstance?.guestTeam?.logoFile}" width="40"/></td>
											<td style="padding-left:5; text-align: left">${gameInstance.guestTeam.city}<br/>${gameInstance.guestTeam.nickname}</td>
											<td class="ddtableBigScore">
												<g:if test="${gameInstance?.homeScore == null}">
													&nbsp;&nbsp;&mdash;&nbsp;&nbsp;
												</g:if>
												<g:else>
													<g:link controller="game" action="show" params="['id': gameInstance?.id]">${gameInstance.homeScore + ":" + gameInstance.guestScore}</g:link>
												</g:else>
											</td>
										</tr>
									</g:each>
								</g:if>
							</g:each>
						</table>
					</g:if>
					<g:else>
						<br/>
						&nbsp;&nbsp;&nbsp;Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegt noch kein Spielplan vor.
					</g:else>
				</div>
			</div>
		</div>
	</body>
</html>
