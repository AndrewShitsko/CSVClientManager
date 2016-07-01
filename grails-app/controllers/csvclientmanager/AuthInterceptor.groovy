package csvclientmanager


class AuthInterceptor {

    AuthInterceptor() {
        matchAll().excludes(controller: "user", action: "login")
                  .excludes(controller: "user", action: "authenticate")
                  .excludes(controller: "user", action: "logout")
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
