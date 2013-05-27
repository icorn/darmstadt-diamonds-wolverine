<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head profile="http://gmpg.org/xfn/11"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	    <title><g:layoutTitle default="Darmstadt Diamonds Football" /></title>

		<link rel="shortcut icon" type="image/x-icon" href="http://www.darmstadt-diamonds.de/images/system/favicon.ico"/>
		<link rel="alternate" type="application/rss+xml" title="RSS" href="http://www.darmstadt-diamonds.de/d/news/rss" />

	    <link id="main_stylesheet" rel="stylesheet" href="${resource(dir:'css', file:'style.css')}" type="text/css">
	    <link rel="stylesheet" href="${resource(dir:'css', file:'shortcodes.css')}" />
<%--
	    <link rel="stylesheet" href="${resource(dir:'css', file:'gallery.css')}" />
--%>
	    <!--[if lte IE 7]>
		<style type="text/css">
			html .jqueryslidemenu { height: 1%; }
		</style>
		<![endif]-->

	    <%-- Scripts --%>
	    <script type="text/javascript" src="${resource(dir:'js', file:'jquery.js')}"></script>
	    <script type="text/javascript" src="${resource(dir:'js', file:'jquery.min.js')}"></script>
	    <script type="text/javascript" src="${resource(dir:'js', file:'scripts.js')}"></script>
	    <script type="text/javascript" src="${resource(dir:'js', file:'jquery.easing.1.3.js')}"></script>
	    <script type="text/javascript" src="${resource(dir:'js', file:'jquery.scrollTo-min.js')}"></script>
	    <script type="text/javascript" src="${resource(dir:'js', file:'aktuals.js')}"></script>

	    <g:layoutHead />

	</head>

	<body class="blog">
	    <div class="container">
	        <g:render template="/layouts/header"/>

	        <div class="content-wrapper">
	            <div class="content">
	                <g:layoutBody />
					<g:render template="/layouts/rightColumn"/>
	            </div>
	        </div>

	        <div class="clear-footer"></div>
	    </div>

		<g:render template="/layouts/footer"/>

	</body>
</html>
