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
			    <g:if test="${year == 0}">
				    <h2>All-Time Scorerliste Herrenteam</h2>
			    </g:if>
			    <g:else>
				    <h2>Scorerliste Herrenteam ${year}</h2>
			    </g:else>

			    <div class="news-list-index" style="margin-top:10px">
			        <g:if test="${scorerList?.size() > 0}">
			            <table class="ddtable">
				            <tr class="ddtableHeader">
					            <th>Pos.</th>
					            <th style="text-align: left;" colspan="2">Spieler</th>
					            <th>TD</th>
					            <th>FG</th>
					            <th>PAT</th>
					            <th>Conv.</th>
					            <th>Saf.</th>
					            <th>Punkte</th>
				            </tr>

				            <g:set var="oldPosition" value="${-1}"/>
				            <g:set var="tdTotal" value="${0}"/>
				            <g:set var="fgTotal" value="${0}"/>
				            <g:set var="patTotal" value="${0}"/>
				            <g:set var="conTotal" value="${0}"/>
				            <g:set var="safTotal" value="${0}"/>
				            <g:set var="pointsTotal" value="${0}"/>

			                <g:each in="${scorerList}" var="scorer" status="i">
			                    <tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
				                    <g:if test="${oldPosition != scorer?.position}">
					                    <td>${scorer?.position}</td>
					                    <g:set var="oldPosition" value="${scorer?.position}"/>
				                    </g:if>
				                    <g:else>
					                    <td></td>
				                    </g:else>
				                    <td style="padding-right:0">
					                    <g:if test="${scorer?.player?.image?.length() > 0}">
					                        <img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathPlayersImages + scorer?.player?.image}" width="40"/>
						                </g:if>
					                    <g:else>
						                    <img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathUnknownPlayerImage}" width="40"/>
					                    </g:else>
				                    </td>
				                    <td style="padding-left:5; text-align: left">${scorer?.player?.firstname}<br/>${scorer?.player?.lastname}</td>
			                        <td>${scorer?.td}</td>
				                    <td>${scorer?.fg}</td>
				                    <td>${scorer?.pat}</td>
				                    <td>${scorer?.conv}</td>
				                    <td>${scorer?.saf}</td>
				                    <td>${scorer?.points}</td>

				                    <g:set var="tdTotal" value="${tdTotal + scorer?.td}"/>
				                    <g:set var="fgTotal" value="${fgTotal + scorer?.fg}"/>
				                    <g:set var="patTotal" value="${patTotal + scorer?.pat}"/>
				                    <g:set var="conTotal" value="${conTotal + scorer?.conv}"/>
				                    <g:set var="safTotal" value="${safTotal + scorer?.saf}"/>
				                    <g:set var="pointsTotal" value="${pointsTotal + scorer?.points}"/>
			                    </tr>
			                </g:each>

				            <tr class="ddtableHeader">
					            <th colspan="3"></th>
					            <th>${tdTotal}</th>
					            <th>${fgTotal}</th>
					            <th>${patTotal}</th>
					            <th>${conTotal}</th>
					            <th>${safTotal}</th>
					            <th>${pointsTotal}</th>
				            </tr>
			            </table>
			            <br/><br/>
			        </g:if>
			        <g:else>
			            <br/>
			            Für die Saison ${((System)application.getAttribute(Const.SYSTEM))?.currentYear} liegt derzeit keine Scorerliste vor.
			        </g:else>
				</div>
			</div>
	    </div>
    </body>
</html>
