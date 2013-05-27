<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<table class="featuredGame">
	<tr>
		<td>
			<img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamLogos + gameInstance?.homeTeam?.logoFile}"/>
		</td>
		<td style="width: 100%;">
			<g:if test="${gameInstance?.category && (gameInstance?.categoryId != Const.GAME_CATEGORY_REGULAR_SEASON)}">
				<g:set var="category" value="${gameInstance?.category?.nameGerman}"/>
			</g:if>

			<g:if test="${(gameInstance?.categoryId == Const.GAME_CATEGORY_REGULAR_SEASON) || (gameInstance?.categoryId == Const.GAME_CATEGORY_PLAYOFFS)}">
				<g:if test="${gameInstance?.league}">
					<g:set var="league" value="${gameInstance?.league}"/>
				</g:if>
			</g:if>

			<g:if test="${league && category}">
				<div class="featuredGameText" style="padding-bottom: 4px">${league} (${category})</div>
			</g:if>
			<g:else>
				<g:if test="${league}">
					<div class="featuredGameText" style="padding-bottom: 4px">${league}</div>
				</g:if>

				<g:if test="${category}">
					<div class="featuredGameText" style="padding-bottom: 4px">${category}<br/></div>
				</g:if>
			</g:else>

			<div class="featuredGameTeam">${gameInstance?.homeTeamName}</div>
			<div class="featuredGameText">vs.<br/></div>
			<div class="featuredGameTeam">${gameInstance?.guestTeamName}</div><br/>

			<g:if test="${(gameInstance?.homeScore != null) && (gameInstance?.guestScore != null)}">
				<div class="featuredGameTeam">${gameInstance?.homeScore} : ${gameInstance?.guestScore}</div>

				<g:if test="${(gameInstance?.homeQ1 != null) && (gameInstance?.homeQ2 != null) && (gameInstance?.homeQ3 != null) && (gameInstance?.homeQ4 != null)}">
					<div class="featuredGameText">
						(${gameInstance?.homeQ1}:${gameInstance?.guestQ1}, ${gameInstance?.homeQ2}:${gameInstance?.guestQ2},
						${gameInstance?.homeQ3}:${gameInstance?.guestQ3}, ${gameInstance?.homeQ4}:${gameInstance?.guestQ4})<br/><br/>
					</div>
				</g:if>

				<g:if test="${gameInstance?.date}">
					<g:if test="${gameInstance?.time}">
						<div class="featuredGameText">
							<dd:formatGameDate game="${gameInstance}"/>
							${gameInstance?.time} Uhr
						</div>
					</g:if>
					<g:else>
						<div class="featuredGameText">
							<dd:formatGameDate game="${gameInstance}"/>
						</div>
					</g:else>
				</g:if>
			</g:if>
			<g:else>
				<g:if test="${gameInstance?.date}">
					<g:if test="${gameInstance?.time}">
						<div class="featuredGameText">
							<dd:formatGameDate game="${gameInstance}"/>,
							${gameInstance?.time} Uhr<br/>
						</div>
					</g:if>
					<g:else>
						<div class="featuredGameText">
							<dd:formatGameDate game="${gameInstance}"/>,
						</div>
					</g:else>
				</g:if>
			</g:else>

			<g:if test="${gameInstance?.homeStadium}">
				<%-- Diamonds home game --%>
				<div class="featuredGameText"><g:link controller="homeStadium" action="show" params="['id': gameInstance?.homeStadiumId]">${gameInstance?.homeStadium?.name}</g:link></div>
			</g:if>
			<g:elseif test="${(gameInstance?.homeTeam) && (gameInstance?.homeTeam?.id != 1)}">
				<%-- Diamonds road game --%>
				<g:if test="${gameInstance?.homeTeam?.stadium}">
					<div class="featuredGameText">${gameInstance?.homeTeam?.stadium}</div>
				</g:if>
			</g:elseif>

			<g:if test="${showGameLink}">
				<div class="featuredGameText"><br/><g:link controller="game" action="show" params="['id': gameInstance?.id]">Alles zum Spiel</g:link></div>
			</g:if>
		</td>
		<td>
			<img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamLogos + gameInstance?.guestTeam?.logoFile}"/>
		</td>
	</tr>
</table>
