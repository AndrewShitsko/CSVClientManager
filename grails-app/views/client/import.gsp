<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.import.label" args="[entityName]"/></title>
</head>

<body>
<div id="import-client">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form enctype="multipart/form-data" name="importForm">
        <div class="form-group">
            <label for="inputCsvFile">Choose CSV file</label>
            <input type="file" accept=".csv" id="inputCsvFile" name="file">
        </div>
        <input type="submit" class="btn btn-primary" value="Import" id="inputImport" disabled/>
    </g:form>
</div>
</body>
</html>