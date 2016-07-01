<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div id="list-client" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form action="search" class="form-inline">
        <div class="form-group">
            <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        </div>

        <div class="pull-right">
            <div class="input-group">
                <input type="text" id="inputSearch" name="q" class="form-control" placeholder="Search for..."/>

                <div class="input-group-btn">
                    <g:submitButton name="buttonSearch" class="btn btn-default" value="Search"/>
                </div>
            </div>
        </div>
    </g:form>
    <f:table collection="${clientList}" properties="['name', 'email', 'street', 'zip']"/>

    <div class="pagination">
        <g:paginate total="${clientCount ?: 0}"/>
    </div>
</div>
</body>
</html>