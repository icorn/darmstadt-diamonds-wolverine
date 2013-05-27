
<%@ page import="dd.project.wolverine.Story" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'story.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="otherImageFile" title="${message(code: 'story.otherImageFile.label', default: 'Other Image File')}" />
                        
                            <g:sortableColumn property="date" title="${message(code: 'story.date.label', default: 'Date')}" />
                        
                            <g:sortableColumn property="headline" title="${message(code: 'story.headline.label', default: 'Headline')}" />
                        
                            <g:sortableColumn property="newsImageFile" title="${message(code: 'story.newsImageFile.label', default: 'News Image File')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'story.text.label', default: 'Text')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${storyInstanceList}" status="i" var="storyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${storyInstance.id}">${fieldValue(bean: storyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "otherImageFile")}</td>
                        
                            <td><g:formatDate date="${storyInstance.date}" /></td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "headline")}</td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "newsImageFile")}</td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "text")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${storyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
