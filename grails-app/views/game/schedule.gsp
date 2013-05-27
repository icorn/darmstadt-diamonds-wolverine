
<%@ page import="dd.project.wolverine.System" %>
<%@ page import="dd.project.wolverine.Util" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="newsLayout" />
    </head>
    <body>
        <g:each in="${scheduleArray}" var="schedule">
            <g:if test="${schedule.size() > 0}">
                <h2 class="title">${schedule[0]?.category}e</h2>
              
                <table class="schedule">
                    <g:each in="${schedule}" var="game" status="i">
                        <tr class="${ (i % 2) == 0 ? 'odd' : 'even'}">                      
                            <td><dd:formatGameDate game="${game}"/><br/>${game.time ? game.time : " "}</td>
							<td>
                                <g:if test="${game.homeStadium}">
                                    <a href="stadium_iframe.jsp?stadium=${game.homeStadium.id}" onclick="openStadiumPopup(this.href); return false">${game.homeStadium?.name}</a></td>
                                </g:if>
                                <g:elseif test="${(game.homeTeam?.id != 1) && (game.homeTeam.stadium)}">
                                    <a href="stadium_iframe.jsp?team=${game.homeTeam.id}" onclick="openStadiumPopup(this.href); return false">${game.homeTeam.stadium}</a></td>
                                </g:elseif>
							</td>
							<td>${game.homeTeam.city}<br/>${game.homeTeam.nickname}</td>
                            <td>vs.</td>
							<td>${game.guestTeam.city}<br/>${game.guestTeam.nickname}</td>
							<td>${(game.homeScore == null) ? ("") : (game.homeScore + ":" + game.guestScore)}</td>
                            <td><a href="h_gamecenter.jsp?id=${game.id}"><img src="${resource(dir: 'images', file: 'frontend/info.png')}" alt=""/></a></td>
                        </tr>
                    </g:each>      
                </table>
                <br/>
            </g:if>
        </g:each>   
    </body>
</html>
