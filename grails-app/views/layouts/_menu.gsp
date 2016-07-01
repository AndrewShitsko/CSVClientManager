<g:if test="${session.user}">
    <nav>
        <ul class="nav nav-pills">
            <g:if test="${session.user.admin}">
                <li role="presentation"><g:link controller="user" action="index">Users</g:link></li>
            </g:if>
            <li role="presentation"><g:link controller="client" action="imports">Import</g:link></li>
            <li role="presentation"><g:link controller="client" action="index">Clients</g:link></li>
            <li role="presentation"><g:link controller="client" action="map">Show map</g:link></li>
        </ul>
    </nav>
</g:if>