<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.search.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div id="list-client" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <h1><g:message code="default.search.label" args="[entityName]"/></h1>
    <f:table collection="${clients}" properties="['name', 'email', 'street', 'zip']"/>

    <div class="pagination">
        <g:paginate total="${clientCount ?: 0}"/>
    </div>
</div>
</body>
</html>