<g:if test="${session.user}">
    <li>
        <a class="btn">Hello, ${session.user.login}</a>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Functions <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <g:if test="${session.user.admin}">
                <li><g:link controller="user" action="index">Users</g:link></li>
            </g:if>
            <li><g:link controller="client" action="index">Clients</g:link></li>
        </ul>
    </li>
    <li>
        <g:link controller="user" action="logout">Logout</g:link>
    </li>
</g:if>