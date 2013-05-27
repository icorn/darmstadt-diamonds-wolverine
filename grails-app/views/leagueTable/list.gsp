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
			    <h2>Tabelle Herrenteam ${((System)application.getAttribute(Const.SYSTEM))?.currentYear}</h2>

			    <div class="news-list-index" style="margin-top:10px">
			        <g:if test="${leagueTableInstanceList?.size() > 0}">
						<g:set var="update" value="${null}"/>

			            <table class="ddtable">
				            <tr class="ddtableHeader">
					            <th>Pos.</th>
					            <th style="text-align: left;" colspan="2">Team</th>
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
				                    <td style="padding-right:0"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathTeamLogos + leagueTableInstance?.team?.logoFile}" width="40"/></td>
				                    <td style="padding-left:5; text-align: left">${leagueTableInstance?.team?.city}<br/>${leagueTableInstance?.team?.nickname}</td>
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
			            <br/>
			            &nbsp;&nbsp;&nbsp;Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegt derzeit keine Tabelle vor.
			        </g:else>
				</div>
			</div>
	    </div>
    </body>
</html>
