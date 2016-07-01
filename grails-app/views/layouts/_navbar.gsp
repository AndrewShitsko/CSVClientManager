<g:if test="${session.user}">
    <li>
        <a class="btn">Hello, ${session.user.login}</a>
    </li>
    <li>
        <g:link controller="user" action="logout">Logout</g:link>
    </li>
</g:if>