package csvclientmanager


class AuthInterceptor {

    AuthInterceptor() {
        match(controller: "client")
    }

    boolean before() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
