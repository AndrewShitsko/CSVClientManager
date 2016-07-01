<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div id="show-client" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list client">
        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>

            <div class="property-value" aria-labelledby="name-label"><f:display bean="client" property="name"/></div>
        </li>
        <li class="fieldcontain">
            <span id="email-label" class="property-label">Email</span>

            <div class="property-value" aria-labelledby="email-label"><f:display bean="client" property="email"/></div>
        </li>
        <li class="fieldcontain">
            <span id="street-label" class="property-label">Street</span>

            <div class="property-value" aria-labelledby="street-label"><f:display bean="client"
                                                                                  property="street"/></div>
        </li>
        <li class="fieldcontain">
            <span id="zip-label" class="property-label">Zip</span>

            <div class="property-value" aria-labelledby="zip-label"><f:display bean="client" property="zip"/></div>
        </li>
    </ol>
    <g:form resource="${this.client}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.client}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
