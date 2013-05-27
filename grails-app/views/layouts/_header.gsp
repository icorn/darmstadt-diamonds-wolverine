<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<div class="header-wrapper">
	<div class="header">
		<h1><g:link controller="news" action="list"><g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages + 'logo-diamonds-top.png'}" alt="Darmstadt Diamonds"/></g:link></h1>
		<div class="header-right">
			<%-- Gelöschtes Suchfeld --%>
		</div>
	</div>
</div>

<div id="menu_wrapper" class="menu-primary-wrapper menu-primary-color-light">
	<div id="menu1" class="menu-primary jqueryslidemenu menu-primary-slidemenu">
		<div class="social">
			<g:link controller="news" action="rss"><img src="${resource(dir:'images/decoration', file:'ico-rss-1.png')}" alt="RSS"></g:link>
			<a href="http://www.twitter.com/diamonds_news"><img src="${resource(dir:'images/decoration', file:'ico-twitter-1.png')}" alt="Twitter"></a>
			<a href="http://www.facebook.com/darmstadtdiamonds"><img src="${resource(dir:'images/decoration', file:'ico-facebook-1.png')}" alt="Facebook"></a>
		</div>

		<ul id="menu-menu" class="">
			<li id="menu-item-100" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-100">
				<a href="#"><span>Herrenteam</span></a>
				<ul class="sub-menu">
					<li id="menu-item-101" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-101">
						<g:link controller="practice" action="showFirstInfo">Informationen</g:link></li>
					<li id="menu-item-102" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-102">
						<g:link controller="news" action="listFirst">News</g:link></li>
					<li id="menu-item-103" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-103">
						<g:link controller="game" action="list">Spielplan</g:link></li>
					<li id="menu-item-104" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-104">
						<g:link controller="leagueTable" action="list">Tabelle</g:link></li>
					<li id="menu-item-105" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-105">
						<g:link controller="score" action="list">Scorer</g:link></li>
					<li id="menu-item-106" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106">
						<g:link controller="playerSeason" action="list">Spieler</g:link></li>
					<li id="menu-item-107" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107">
						<g:link controller="team" action="list">Gegner</g:link></li>
					<li id="menu-item-108" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-108">
						<g:link controller="coachSeason" action="list" params="['id': 1]">Coaches</g:link></li>
					<li id="menu-item-109" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-109">
						<g:link controller="news" action="showMedicine">Med. Betreuung</g:link></li>
<%--
					<li id="menu-item-110" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-110">
						<g:link controller="news" action="list">Fotos</g:link></li>
--%>
				</ul>
			</li>

			<li id="menu-item-200" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-200">
				<a href="#"><span>Jugendteams</span></a>
				<ul class="sub-menu">
					<li id="menu-item-201" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-67 current_page_item current_page_parent menu-item-201">
						<g:link controller="practice" action="showYouthInfo">Informationen</g:link></li>
					<li id="menu-item-207" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-67 current_page_item current_page_parent menu-item-201">
						<g:link controller="news" action="listYouth">News</g:link></li>
<%--
					<li id="menu-item-206" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-67 current_page_item current_page_parent menu-item-206">
						<g:link controller="news" action="list">Fotos</g:link></li>
--%>
					<li id="menu-item-202" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-202">
						<g:link controller="news" action="list"><span>A-Jugend</span></g:link>
						<ul class="sub-menu">
							<li id="menu-item-2021"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2021">
								<g:link controller="gameYouthA" action="list">Tabelle / Spielplan</g:link></li>
							<li id="menu-item-2022"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2022">
								<g:link controller="coachSeason" action="list" params="['id': 2]">Coaches</g:link></li>
<%--
							<li id="menu-item-2023"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2023">
								<a href="http://www.orange-themes.com/oxygen/blog/#">Spieler</a></li>
--%>
						</ul>
					</li>
					<li id="menu-item-203" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-203">
						<g:link controller="news" action="list"><span>B-Jugend</span></g:link>
						<ul class="sub-menu">
							<li id="menu-item-2031"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2031">
								<g:link controller="gameYouthB" action="list">Tabelle / Spielplan</g:link></li>
							<li id="menu-item-2032"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2032">
								<g:link controller="coachSeason" action="list" params="['id': 3]">Coaches</g:link></li>
						</ul>
					</li>
					<li id="menu-item-204" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-203">
						<g:link controller="news" action="list"><span>C-Jugend</span></g:link>
						<ul class="sub-menu">
							<li id="menu-item-2041"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2041">
								<g:link controller="gameYouthC" action="list">Tabelle / Spielplan</g:link></li>
							<li id="menu-item-2042"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2042">
								<g:link controller="coachSeason" action="list" params="['id': 6]">Coaches</g:link></li>
						</ul>
					</li>
					<li id="menu-item-205" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-203">
						<g:link controller="news" action="list"><span>Flag-Jugend</span></g:link>
						<ul class="sub-menu">
							<li id="menu-item-2051"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2051">
								<g:link controller="gameYouthD" action="list">Tabelle / Spielplan</g:link></li>
							<li id="menu-item-2052"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2052">
								<g:link controller="coachSeason" action="list" params="['id': 4]">Coaches</g:link></li>
						</ul>
					</li>
				</ul>
			</li>

			<li id="menu-item-300" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-300">
				<a href="#"><span>Danceteam</span></a>
				<ul class="sub-menu">
					<li id="menu-item-301" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-301">
						<g:link controller="practice" action="showDanceteamInfo">Informationen</g:link></li>
					<li id="menu-item-303" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-303">
						<g:link controller="news" action="showDanceteamBooking">Booking / Referenzen</g:link></li>
<%--
					<li id="menu-item-302" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-302">
						<g:link controller="news" action="list">Fotos</g:link></li>
--%>
				</ul>
			</li>

			<li id="menu-item-400" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-400">
				<a href="#"><span>Verein</span></a>
				<ul class="sub-menu">
					<li id="menu-item-401" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-401">
						<g:link controller="news" action="showImpressum">Impressum</g:link></li>
					<li id="menu-item-402" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-402">
						<g:link controller="news" action="showManagement">Vorstand</g:link></li>
					<li id="menu-item-406" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-402">
						<g:link controller="news" action="showTSG">TSG</g:link></li>
					<li id="menu-item-403" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-403">
						<g:link controller="news" action="showPartners">Partner</g:link></li>
					<li id="menu-item-404" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-404">
						<g:link controller="news" action="showContact">Kontakt</g:link></li>
					<li id="menu-item-405" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-405">
						<g:link controller="news" action="showDonations">Spenden</g:link></li>
					<li id="menu-item-407" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-405">
						<g:link controller="practice" action="list">Trainingstermine</g:link></li>
					<li id="menu-item-408" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-405">
						<g:link controller="news" action="showFoerdervereinInfo">Förderverein</g:link></li>
				</ul>
			</li>

			<li id="menu-item-500" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-500">
				<a href="#"><span>Gameday</span></a>
				<ul class="sub-menu">
					<li id="menu-item-3030" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-203">
						<g:link controller="news" action="list"><span>Anfahrt</span></g:link>
						<ul class="sub-menu">
							<li id="menu-item-3031"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2031">
								<g:link controller="homeStadium" action="show" params="['id':1]">Böllenfalltor-Stadion</g:link></li>
							<li id="menu-item-3032"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2032">
								<g:link controller="homeStadium" action="show" params="['id':2]">Bürgerpark-Nord</g:link></li>
							<li id="menu-item-3033"
							    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2032">
								<g:link controller="homeStadium" action="show" params="['id':3]">Darmstädter TSG 1846</g:link></li>
						</ul>
					</li>
					<li id="menu-item-502" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-502">
						<g:link controller="news" action="showTickets">Tickets</g:link></li>
					<li id="menu-item-503" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-503">
						<g:link controller="news" action="showRules">Football-Regeln</g:link></li>
					<li id="menu-item-505" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-505">
						<g:link controller="news" action="showFanshop">Fanshop</g:link></li>
				</ul>
			</li>

			<li id="menu-item-600" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-600">
				<a href="#"><span>Presse</span></a>
				<ul class="sub-menu">
					<li id="menu-item-603" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-603">
						<g:link controller="news" action="showPressInfo">Informationen</g:link></li>
					<li id="menu-item-601" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-601">
						<g:link controller="news" action="showPressPhotos">Presse-Fotos / Logos</g:link></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

