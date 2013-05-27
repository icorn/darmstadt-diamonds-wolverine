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
				<h2>Score-Check Herrenteam</h2>
				<div class="news-list-index" style="margin-top:10px">
					<g:if test="${gameInstanceList?.size() > 0}">
						<g:each in="${gameInstanceList}" var="game">
							<span style="font-weight: bold">${game.date} (Game-ID ${game.id}, ${game.category.nameGerman})</span><br/>
							${game.homeTeamName} vs. ${game.guestTeamName} ${game.homeScore} - ${game.guestScore} <br/>

							<g:if test="${(game.homeQ1 != null) && (game.homeQ2 != null) && (game.homeQ3 != null) && (game.homeQ4 != null) && (game.homeScore != null) && (game.guestQ1 != null) && (game.guestQ2 != null) && (game.guestQ3 != null) && (game.guestQ4 != null)}">

								Home-Score-Check:

								<g:if test="${game.homeOt != null}">
									<g:set var="homeQuarterTotal" value="${game.homeOt + game.homeQ1 + game.homeQ2 + game.homeQ3 + game.homeQ4}"/>
								</g:if>
								<g:else>
									<g:set var="homeQuarterTotal" value="${game.homeQ1 + game.homeQ2 + game.homeQ3 + game.homeQ4}"/>
								</g:else>

								<g:if test="${homeQuarterTotal == game.homeScore}">PASSED</g:if>
								<g:else><span style="color:red">FAILED: ${game.homeScore} != ${homeQuarterTotal}</span></g:else>

								<br/>Guest-Score-Check:

								<g:if test="${game.guestOt}">
									<g:set var="guestQuarterTotal" value="${game.guestOt + game.guestQ1 + game.guestQ2 + game.guestQ3 + game.guestQ4}"/>
								</g:if>
								<g:else>
									<g:set var="guestQuarterTotal" value="${game.guestQ1 + game.guestQ2 + game.guestQ3 + game.guestQ4}"/>
								</g:else>

								<g:if test="${guestQuarterTotal == game.guestScore}">PASSED</g:if>
								<g:else><span style="color:red">FAILED: ${game.guestScore} != ${guestQuarterTotal}</span></g:else>
							</g:if>
							<g:else>
								<span style="color:red">Quarterly scores missing or incomplete</span>
							</g:else>

							<br/>Scorers:<br/>

							<g:set var="ddIsHomeTeam" value="${true}"/>
							<g:if test="${game.homeTeam.id != 1}">
								<g:set var="ddIsHomeTeam" value="${false}"/>
							</g:if>

							<g:set var="scorerTotal" value="${0}"/>
							<g:if test="${game.scores.size() > 0}">
								<g:each in="${game.scores}" var="score">
									<g:set var="scorerTotal" value="${scorerTotal + score.scoreType.points}"/>
									- ${score.scoreType.shortName} ${score.player.firstname} ${score.player.lastname} (${score.scoreType.points} Punkte)<br/>
								</g:each>
							</g:if>
							<g:else>keine<br/></g:else>

							Scorer-Test:

							<g:if test="${ddIsHomeTeam}">
								<g:if test="${scorerTotal == game.homeScore}">PASSED</g:if>
								<g:else><span style="color:red">FAILED: ${game.homeScore} != ${scorerTotal}</span></g:else>
							</g:if>
							<g:else>
								<g:if test="${scorerTotal == game.guestScore}">PASSED</g:if>
								<g:else><span style="color:red">FAILED: ${game.guestScore} != ${scorerTotal}</span></g:else>
							</g:else>

							<br/><br/>
						</g:each>
					</g:if>
					<g:else>
						<br/>
						&nbsp;&nbsp;&nbsp;Es gibt keine Spiele in der Datenbank!
					</g:else>
				</div>
			</div>
		</div>
	</body>
</html>
