
<table style="margin-top:10px;">
	<tr>
		<td style="vertical-align: top;">
			<a href="http://twitter.com/share" class="twitter-share-button" data-count="none" data-text="${newsInstance?.headline}" data-via="diamonds_news" data-related="diamonds_live:Live-Scores von den Diamonds-Spielen" data-lang="de" data-url="${linkUrl}">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
		</td>
		<td style="vertical-align: top;">
			<g:set var="encodedLinkUrl" value="${java.net.URLEncoder.encode(linkUrl, 'UTF-8')}"/>
			&nbsp;&nbsp;<iframe src="//www.facebook.com/plugins/like.php?href=${encodedLinkUrl}&amp;send=false&amp;layout=button_count&amp;width=140&amp;show_faces=false&amp;font=arial&amp;colorscheme=light&amp;action=like&amp;height=21&amp;appId=206516389365804" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:140px; height:21px;" allowTransparency="true"></iframe>
		</td>
	</tr>
</table>

