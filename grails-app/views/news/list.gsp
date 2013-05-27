
<%@ page import="dd.project.wolverine.Util; dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="newsLayout" />
    </head>

    <body>
        <g:if test="${isTitlePage}">
	        <g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages + 'sponsorenleiste_4logos.jpg'}" alt="Unsere Partner" style="margin-top:12px;"/>
        </g:if>

	    <div class="left-side">
	        <g:if test="${featuredGame}">

		        <%-- Show the featured game --%>

			    <table class="section-spacer" style="margin-bottom: 10px">
				    <tbody>
				    <tr>
					    <td class="left"></td>
					    <td class="middle">
						    <span>
							    Das aktuelle Spiel
						    </span>
					    </td>
					    <td class="right"></td>
				    </tr>
				    </tbody>
			    </table>

		        <g:render template="/layouts/feature" model="[gameInstance: featuredGame, showGameLink: true]" />
	        </g:if>

		    <table class="section-spacer" style="margin-bottom: 10px">
		        <tbody>
		        <tr>
		            <td class="left"></td>
		            <td class="middle">
		                <span>
		                    Aktuelle News ${title}
		                </span>
		            </td>
		            <td class="right"></td>
		        </tr>
		        </tbody>
		    </table>

		    <div class="news-list-index" style="margin-top:10px">
		        <g:each in="${newsInstanceList}" var="newsInstance" status="loop">

			        <g:if test="${featuredGame}">
						<%-- If a game is featured, there is no featured news-item --%>
				        <g:if test="${loop == newsInstanceList.size() - 1}">
					        <g:set var="style" value='style="border-bottom:0px; padding: 0 0 0 0 ;margin: 0 0 20px 0;"' />
				        </g:if>
				        <div class="news-item" ${style}>
					        <g:render template="shortnews" model="['newsInstance':newsInstance, 'headlineIsLink':true]" />
				        </div>
			        </g:if>
			        <g:else>
				        <%-- No featured game: Feature the first news-item (if it has a header-image --%>

				        <g:if test="${loop == 0 && newsInstanceList != null && newsInstanceList[0]?.imageHeaderFile?.length() > 0}">
					        <div class="top-stories-slider" style="padding: 0 0 15px 0; margin: 0 0 15px 0;">
								<span class="tag">&nbsp;</span>
								<span class="rounded-corners">&nbsp;</span>

								<div id="aktuals_field" style="overflow:hidden; position: relative;" onmouseover="set_hover_on()" onmouseout="set_hover_off()">
									<table>
										<tbody>
										<tr>
											<td>
												<div class="top-stories-item" id="aktuals1" style="background: url(${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsHeaderImages + newsInstanceList[0]?.imageHeaderFile}) 0 0 no-repeat;">
													<g:if test="${newsInstanceList[0]?.linkStory}">
														<g:link controller="story" action="show" id="${newsInstanceList[0]?.linkStory?.id}" class="title">
															<i><g:fieldValue bean="${newsInstanceList[0]}" field="headline" /></i>
															<u><dd:renderHeaderText text="${newsInstanceList[0]?.text}"/></u>
														</g:link>
													</g:if>
													<g:else>
														<g:link controller="news" action="show" id="${newsInstanceList[0]?.id}" class="title">
															<i><g:fieldValue bean="${newsInstanceList[0]}" field="headline" /></i>
															<u><dd:renderHeaderText text="${newsInstanceList[0]?.text}"/></u>
														</g:link>
													</g:else>
											        <div class="background"></div>
										        </div>
									        </td>
								        </tr>
								        </tbody>
							        </table>
						        </div>
						        <div class="top-stories-slider-image-shadow">
							        &nbsp;
						        </div>
					        </div>
					    </g:if>
				        <g:else>
					        <g:if test="${loop == newsInstanceList.size() - 1}">
						        <g:set var="style" value='style="border-bottom:0px; padding: 0 0 0 0 ;margin: 0 0 20px 0;"' />
					        </g:if>
				            <div class="news-item" ${style}>
					            <g:render template="shortnews" model="['newsInstance':newsInstance, 'headlineIsLink':true]" />
				            </div>
				        </g:else>
			        </g:else>
		        </g:each>
		    </div>

	        <div class="pagination">
	            <g:paginate total="${newsInstanceTotal}" />
	        </div>

		</div>
    </body>
</html>
