
<ul style="margin-top: 5px;margin-left: -3px;">
    <g:if test="${newsInstance?.linkGame}">      <g:link controller="game"       action="show" id="${newsInstance?.linkGame?.id}"      class="more-link" >Alle Infos zum Spiel</g:link><br/></g:if>
    <g:if test="${newsInstance?.linkYouthAGame}"><g:link controller="gameYouthA" action="show" id="${newsInstance?.linkYouthAGame?.id}"class="more-link">Alle Infos zum Spiel</g:link><br/></g:if>

	<g:if test="${showStoryLink}">
		<g:if test="${newsInstance?.linkStory}">     <g:link controller="story"      action="show" id="${newsInstance?.linkStory?.id}"     class="more-link">${newsInstance?.linkStoryTitle}</g:link><br/></g:if>
	</g:if>

    <g:if test="${newsInstance?.linkEvent}">     <g:link controller="event"      action="show" id="${newsInstance?.linkEvent?.id}"     class="more-link">${newsInstance?.linkEventTitle}</g:link><br/></g:if>
    <g:if test="${newsInstance?.linkMisc}">      <g:link controller="miscLink"   action="show" id="${newsInstance?.linkMisc?.id}"      class="more-link">${newsInstance?.linkMiscTitle}</g:link><br/></g:if>
    <g:if test="${newsInstance?.linkExtern}">    <a href="${newsInstance?.linkExtern}" target="_blank" class="more-link">${newsInstance?.linkExternTitle}</a><br/></g:if>
</ul>

