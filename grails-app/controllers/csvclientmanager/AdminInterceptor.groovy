package csvclientmanager


class AdminInterceptor {

    AdminInterceptor() {
        match(controller: "user").except(action: "login")
                                 .except(action: "authenticate")
                                 .except(action: "logout")
    }

    boolean before() {
        if (!session?.user?.admin) {
            flash.message = "Sorry, admin only"
            redirect(controller: "client")
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
