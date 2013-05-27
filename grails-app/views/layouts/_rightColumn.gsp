<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System; wolverine.DataService;" %>
<div class="right-side">

	<%-- Changing banner --%>
	<dd:showRandomLinkBanner/>

	<%-- Schedule --%>

	<div class="block-1">
		<h2>
			<span> Aktuelle Spiele</span>
		</h2>

		<g:set var="resultInstanceList" value="${wolverine.DataService.getResults(application)}"/>

		<div class="block-1-content" style="padding-top: 0px;">
			<div class="latest-articles">
				<div class="latest-article-item last">
					<div class="news-list-index">
						<g:if test="${resultInstanceList?.size() > 0}">
							<g:set var="oldLeague" value=""/>
							<table class="ddtableMini">
								<g:each in="${resultInstanceList}" var="resultInstance" status="i">
									<g:if test="${resultInstance?.league != oldLeague}">
										<tr style="line-height: 20px; vertical-align: bottom">
											<th colspan="5" style="text-align: left">
												${resultInstance?.league}
											</th>
										</tr>
									</g:if>
									<tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
										<td style="text-align: left;">
											<g:if test="${resultInstance?.date}">
												${resultInstance?.date?.getAt(Calendar.DATE)}.${resultInstance?.date?.getAt(Calendar.MONTH)+1}.
											</g:if>
											<g:else>
												&nbsp;
											</g:else>
										</td>
										<td style="text-align: left;">${resultInstance?.home}</td>
										<td>vs.</td>
										<td style="text-align: left;">${resultInstance?.guest}</td>
										<td>${resultInstance?.result}</td>
									</tr>

									<g:set var="oldLeague" value="${resultInstance?.league}"/>
								</g:each>
							</table>
						</g:if>
						<g:else>
							Derzeit keine aktuellen Spiele.
						</g:else>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- Fanshop banner --%>

	<div class="block-1" style="margin-bottom: 0px;">
		<g:link url="http://dd.2-K-5.de" target="_blank"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathInfoBanner + 'fanshop.jpg'}" class="right-banner-image-shadow"/></g:link>
	</div>

	<%-- Practice banner --%>

	<div class="block-1" style="margin-bottom: 0px;">
		<g:link controller="practice" action="list"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathInfoBanner + 'trainingstermine.jpg'}" class="right-banner-image-shadow"/></g:link>
	</div>

	<%-- League table --%>

	<div class="block-1">
		<h2>
			<span> Tabelle</span>
			<g:link controller="leagueTable" action="list">Komplette Tabelle</g:link>
		</h2>

		<g:set var="leagueTableInstanceList" value="${wolverine.DataService.getLeagueTable(application)}"/>

		<div class="block-1-content" style="padding-top: 0px;">
			<div class="latest-articles">
				<div class="latest-article-item last">
					<div class="news-list-index" style="margin-top:5px">
						<g:if test="${leagueTableInstanceList?.size() > 0}">
							<table class="ddtableMini">
								<g:each in="${leagueTableInstanceList}" var="leagueTableInstance" status="i">
									<g:set var="numGames"     value="${leagueTableInstance.wins.intValue() + leagueTableInstance.ties.intValue() + leagueTableInstance.losses.intValue()}"/>
									<g:set var="pointsPlus"   value="${(leagueTableInstance.wins.intValue() * 2) + leagueTableInstance.ties.intValue()}"/>
									<g:set var="pointsMinus"  value="${(leagueTableInstance.losses.intValue() * 2) + leagueTableInstance.ties.intValue()}"/>

									<tr class="${ (i % 2) == 0 ? 'ddtableRowOdd' : 'ddtableRowEven'}">
										<td>${leagueTableInstance.position}</td>
										<td style="text-align: left;">${leagueTableInstance.team.nickname}</td>
										<td>${numGames}</td>
										<td>${pointsPlus} : ${pointsMinus}</td>
									</tr>
								</g:each>
							</table>
						</g:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- Twitter timeline --%>

	<div class="block-1">
		<a class="twitter-timeline" href="https://twitter.com/diamonds_news" data-widget-id="300288383945687040" data-related="diamonds_news,diamonds_live">Tweets by @diamonds_news</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</div>

</div>



<%-- Unused stuff --%>

<%--
    <div class="block-1" id="oxygen_triple_box-4">
        <div class="tabs-1">
            <table>
                <tbody>
                <tr>
                    <td>
                        <a href="http://www.orange-themes.com/oxygen/blog/#" class="tab-1 oxygen_triple_btn"
                           id="oxygen_triple_popular_btn_oxygen_triple_box-4"><i>&nbsp;</i><b><span>Popular</span></b><u>&nbsp;</u></a>
                    </td>
                    <td class="spacer"></td>
                    <td>
                        <a href="http://www.orange-themes.com/oxygen/blog/#" class="tab-1 tab-1-disabled oxygen_triple_btn"
                           id="oxygen_triple_recent_btn_oxygen_triple_box-4"><i>&nbsp;</i><b><span>Recent</span></b><u>&nbsp;</u></a>
                    </td>
                    <td class="spacer"></td>
                    <td>
                        <a href="http://www.orange-themes.com/oxygen/blog/#" class="tab-1 tab-1-disabled oxygen_triple_btn"
                           id="oxygen_triple_comments_btn_oxygen_triple_box-4"><i>&nbsp;</i><b><span>Comments</span></b><u>&nbsp;</u></a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="block-1-content">
            <div class="latest-activity">
                <div id="oxygen_triple_popular_oxygen_triple_box-4">
                    <div class="latest-activity-item ">
                        <table>
                            <tbody>
                            <tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/"><img src="./images/timthumb(6).php"
                                                                                                     alt="WordPress Theme elements post – test article for Oxygen"></a>
                                </td>
                                <td class="text">
                                    <h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/5/">WordPress Theme elements post – test article for Oxygen</a></h3>
                                    <h4>18.2.2011<span>|</span>
                                        <b>
                                            <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/#comments"
                                               title="Comment on WordPress Theme elements post – test article for Oxygen">4 comments</a>
                                        </b>
                                    </h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="latest-activity-item ">
                        <table>
                            <tbody>
                            <tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/">
                                        <img src="./images/timthumb(7).php" alt="Why does everyone start blogging, but only some continue?"></a>
                                </td>
                                <td class="text">
                                    <h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/">
                                        Why does everyone start blogging, but only some continue?</a>
                                    </h3>
                                    <h4>18.2.2011<span>|</span>
                                        <b>
                                            <a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/#comments"
                                               title="Comment on Why does everyone start blogging, but only some continue?">2 comments</a>
                                        </b>
                                    </h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="latest-activity-item last">
                        <table>
                            <tbody>
                            <tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">
                                        <img src="./images/timthumb(8).php" alt="Maecenas pretium facilisis lectus sed molestie"></a>
                                </td>
                                <td class="text">
                                    <h3>
                                        <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">
                                            Maecenas pretium facilisis lectus sed molestie</a>
                                    </h3>
                                    <h4>18.2.2011<span>|</span>
                                        <b>
                                            <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/#comments"
                                               title="Comment on Maecenas pretium facilisis lectus sed molestie">One comment</a>
                                        </b>
                                    </h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="oxygen_triple_recent_oxygen_triple_box-4" style="display: none;">
                    <div class="latest-activity-item ">
                        <table>
                            <tbody>
                            <tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/">
                                        <img src="./images/timthumb(6).php" alt="WordPress Theme elements post – test article for Oxygen"></a>
                                </td>
                                <td class="text">
                                    <h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/5/">WordPress Theme elements post – test article for Oxygen</a></h3>
                                    <h4>18.2.2011<span>|</span><b><a href="http://www.orange-themes.com/oxygen/2011/02/18/5/#comments"
                                                                     title="Comment on WordPress Theme elements post – test article for Oxygen">4 comments</a></b></h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="latest-activity-item ">
                        <table>
                            <tbody><tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/">
                                        <img src="./images/timthumb(7).php" alt="Why does everyone start blogging, but only some continue?"></a>
                                </td>
                                <td class="text">
                                    <h3>
                                        <a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/">Why
                                        does everyone start blogging, but only some continue?</a>
                                    </h3>
                                    <h4>18.2.2011<span>|</span>
                                        <b>
                                            <a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/#comments"
                                               title="Comment on Why does everyone start blogging, but only some continue?">2 comments</a>
                                        </b>
                                    </h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="latest-activity-item last">
                        <table>
                            <tbody>
                            <tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">
                                        <img src="./images/timthumb(8).php" alt="Maecenas pretium facilisis lectus sed molestie"></a>
                                </td>
                                <td class="text">
                                    <h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">Maecenas
                                    pretium facilisis lectus sed molestie</a></h3>
                                    <h4>18.2.2011<span>|</span>
                                        <b>
                                            <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/#comments"
                                               title="Comment on Maecenas pretium facilisis lectus sed molestie">One comment</a>
                                        </b>
                                    </h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="oxygen_triple_comments_oxygen_triple_box-4" style="display: none;">
                    <div class="latest-activity-item ">
                        <table>
                            <tbody>
                            <tr>
                                <td class="image">
                                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/"><img src="./images/timthumb(6).php"
                                                                                                     alt="WordPress Theme elements post – test article for Oxygen"></a>
                                </td>
                                <td class="text">
                                    <h3>
                                        <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/">WordPress Theme elements post – test article for Oxygen</a>
                                    </h3>
                                    <h4>18.2.2011<span>|</span>
                                        <b>
                                            <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/#comments"
                                               title="Comment on WordPress Theme elements post – test article for Oxygen">4 comments</a>
                                        </b>
                                    </h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<div class="block-1">
		<h2>
			<span> Featured articles</span>
			<a href="http://www.orange-themes.com/oxygen/category/ipsum/">show all</a>
		</h2>

		<div class="block-1-content">
			<div class="latest-articles">
				<div class="latest-article-item ">
					<table>
						<tbody>
						<tr>
							<td class="text">
								<h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/5/">WordPress Theme elements post – test article for Oxygen</a></h3>
								<a href="http://www.orange-themes.com/oxygen/2011/02/18/5/" class="more-link">Read more</a>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="latest-article-item ">
					<table>
						<tbody>
						<tr>
							<td class="image">
								<a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/">
									<img src="" width="50" height="50" alt="Why does everyone start blogging, but only some continue?"></a>
							</td>
							<td class="text">
								<h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/">Why
								does everyone start blogging, but only some continue?</a></h3>
								<a href="http://www.orange-themes.com/oxygen/2011/02/18/why-does-everyone-start-blogging-but-only-some-continue/" class="more-link">Read more</a>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="latest-article-item last">
					<table>
						<tbody>
						<tr>
							<td class="image">
								<a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">
									<img src="" width="50" height="50" alt="Maecenas pretium facilisis lectus sed molestie"></a>
							</td>
							<td class="text">
								<h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">Maecenas
								pretium facilisis lectus sed molestie</a></h3>
								<a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/" class="more-link">Read more</a>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="block-1">
		<table class="section-spacer">
			<tbody>
			<tr>
				<td class="left"></td>
				<td class="middle">
					<span>Latest Galleries</span>
				</td>
				<td class="right"></td>
			</tr>
			</tbody>
		</table>
		<div class="newest-galleries">
			<a href="http://www.orange-themes.com/oxygen/gallery/example-oxygen-gallery/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/duis-porta-dui-eu-aliquet-dapibus-mi-risus-porttitor-orci-id-fringilla-metus-enim-non-diam-3/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/suspendisse-vel-leo-lectus-vel-faucibus-arcu-etiam-a-neque-nulla-2/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/vivamus-sollicitudin-quam-ut-turpis-2/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-2/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/suspendisse-vel-leo-lectus-vel-faucibus-arcu-etiam-a-neque-nulla/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/vivamus-sollicitudin-quam-ut-turpis/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/duis-porta-dui-eu-aliquet-dapibus-mi-risus-porttitor-orci-id-fringilla-metus-enim-non-diam-2/">
				<img src="" alt="" width="55" height="55">
			</a>
			<a href="http://www.orange-themes.com/oxygen/gallery/duis-porta-dui-eu-aliquet-dapibus-mi-risus-porttitor-orci-id-fringilla-metus-enim-non-diam/">
				<img src="" alt="" width="55" height="55">
			</a>
		</div>
	</div>

    <div class="block-1">
        <h2>
            <span> Other Articles</span>
            <a href="http://www.orange-themes.com/oxygen/category/lorem/">show all</a>
        </h2>

        <div class="block-1-content">
            <div class="latest-events">
                <div class="latest-event-item ">
                    <h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/5/">WordPress Theme elements post – test article for Oxygen</a></h3>
                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/5/" class="more-link">Read more</a>
                </div>
                <div class="latest-event-item ">
                    <h3>
                        <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/">Maecenas
                        pretium facilisis lectus sed molestie</a>
                    </h3>
                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie-2/" class="more-link">Read more</a>
                </div>
                <div class="latest-event-item last">
                    <h3><a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie/">Maecenas pretium
                    facilisis lectus sed molestie</a>
                    </h3>
                    <a href="http://www.orange-themes.com/oxygen/2011/02/18/maecenas-pretium-facilisis-lectus-sed-molestie/" class="more-link">Read more</a>
                </div>
            </div>
        </div>
    </div>
--%>
