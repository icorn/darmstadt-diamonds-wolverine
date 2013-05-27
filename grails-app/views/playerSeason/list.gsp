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
		<h2>Spieler Herrenteam ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>

		<div class="news-list-index" style="margin-top:10px">
			<g:if test="${playerSeasonInstanceList?.size() > 0}">
				<table class="ddtable">
					<tr class="ddtableHeader">
						<th>Nr.</th>
						<th style="text-align: left;" colspan="2">Spieler</th>
						<th>Pos.</th>
						<th>Gewicht</th>
						<th>Größe</th>
						<th>Jahrgang</th>
						<th>Spitzname</th>
					</tr>

					<g:each in="${playerSeasonInstanceList}" var="playerSeason" status="i">
						<tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
							<td class="ddtableBigScore">${playerSeason?.player?.number}</td>
							<td style="padding-right:0">
								<g:if test="${playerSeason?.player?.image?.length() > 0}">
									<img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathPlayersImages + playerSeason?.player?.image}" width="40"/>
								</g:if>
								<g:else>
									<img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathUnknownPlayerImage}" width="40"/>
								</g:else>
							</td>
							<td style="padding-left:5; text-align: left">${playerSeason?.player?.firstname}<br/>${playerSeason?.player?.lastname}</td>
							<td>${playerSeason?.player?.position}</td>
							<td>${playerSeason?.player?.weight}</td>
							<td>${playerSeason?.player?.height}</td>

							<g:if test="${playerSeason?.player?.dateOfBirth != null}">
								<td>${1900 + playerSeason?.player?.dateOfBirth?.getYear()}</td>
							</g:if>
							<g:else>
								<td></td>
							</g:else>

							<td>${playerSeason?.player?.nickname}</td>
						</tr>
					</g:each>
				</table>
				<br/><br/>
			</g:if>
			<g:else>
				<br/>
				Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegt derzeit keine Spielerliste vor.
			</g:else>
		</div>
	</div>
</div>
</body>
</html>
