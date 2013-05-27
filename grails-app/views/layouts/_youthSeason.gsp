<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<div class="article-wrapper" style="margin-top:8px;">
	<h2>Spielplan ${youthname} ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>
	<div class="news-list-index" style="margin-top:10px">
		<g:if test="${!empty}">
			<table class="ddtable">
				<g:each in="${gameInstanceList}" var="schedule">
					<g:if test="${schedule.size() > 0}">
						<tr class="ddtableHeader">
							<th colspan="7" style="text-align: left">${schedule[0]?.category}e</th>
						</tr>
						<g:each in="${schedule}" var="gameInstance" status="i">
							<tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
								<td class="ddtableRightBorder"><dd:formatGameDate game="${gameInstance}"/><br/>${gameInstance.time ? gameInstance.time + "&nbsp;Uhr" : " "}</td>

								<td class="ddtableRightBorder">
									<g:if test="${gameInstance?.homeStadium}">
										${gameInstance?.homeStadium?.name}
									</g:if>
									<g:else>
										${gameInstance?.opponentStadium}
									</g:else>
								</td>

								<td style="padding-left:5; text-align: left">${gameInstance.homeTeamName}</td>
								<td>vs.</td>
								<td style="padding-left:5; text-align: left">${gameInstance.guestTeamName}</td>
								<td class="ddtableBigScore">${(gameInstance.homeScore == null) ? ("&nbsp;&nbsp;&mdash;&nbsp;&nbsp;") : (gameInstance.homeScore + ":" + gameInstance.guestScore)}</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</table>
		</g:if>
		<g:else>
			Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegt noch kein Spielplan vor.
		</g:else>
	</div>

	<br/><br/>

	<h2>Tabelle ${youthname}  ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>

	<div class="news-list-index" style="margin-top:10px">
		<g:if test="${leagueTableInstanceList?.size() > 0}">
			<g:set var="update" value="${null}"/>

			<table class="ddtable">
				<tr class="ddtableHeader">
					<th>Pos.</th>
					<th style="text-align: left;">Team</th>
					<th>Spiele</th>
					<th>Punkte</th>
					<th>S - N - U</th>
					<th>TD-Punkte</th>
				</tr>

				<g:each in="${leagueTableInstanceList}" var="leagueTableInstance" status="i">
					<g:set var="numGames"     value="${leagueTableInstance.wins.intValue() + leagueTableInstance.ties.intValue() + leagueTableInstance.losses.intValue()}"/>
					<g:set var="pointsPlus"   value="${(leagueTableInstance.wins.intValue() * 2) + leagueTableInstance.ties.intValue()}"/>
					<g:set var="pointsMinus"  value="${(leagueTableInstance.losses.intValue() * 2) + leagueTableInstance.ties.intValue()}"/>

					<g:if test="${update == null}">
						<g:set var="update" value="${new GregorianCalendar()}"/>
						${update.setTime(leagueTableInstance.stamp)}
					</g:if>

					<g:if test="${update.getTime().before(leagueTableInstance.stamp)}">
						${update.setTime(leagueTableInstance.stamp)}
					</g:if>

					<tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
						<td>${leagueTableInstance.position}</td>
						<td style="padding-left:5; text-align: left">${leagueTableInstance?.teamName}</td>
						<td>${numGames}</td>
						<td>${pointsPlus} : ${pointsMinus}</td>
						<td>${leagueTableInstance.wins} - ${leagueTableInstance.losses} - ${leagueTableInstance.ties}</td>
						<td>${leagueTableInstance.pointsMade} : ${leagueTableInstance.pointsOpp}</td>
					</tr>
				</g:each>
			</table>
			<br/>
			<div class="the-content">Letztes Update: ${update.get(Calendar.DATE)}.${update.get(Calendar.MONTH)+1}.${update.get(Calendar.YEAR)}</div>
			<br/><br/>
		</g:if>
		<g:else>
			Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegt derzeit keine Tabelle vor.
		</g:else>
	</div>
</div>
