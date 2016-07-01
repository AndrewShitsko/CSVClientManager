package csvclientmanager

class User {
    String login
    String password
    String salt = "x!@"
    String role = "user"

    static constraints = {
        login(blank: false, nullable: false, unique: true)
        password(blank: false, password: true)
        salt()
        role(inList: ["admin", "user"])
    }

    static mapping = {
        table "[user]"
    }

    static transients = ['admin']

    boolean isAdmin() {
        role == "admin"
    }

    def beforeInsert = {
        salt = UUID.randomUUID().toString().replace("-", "")
        password = (password + salt).encodeAsSHA256WithSalt()
    }

    def beforeUpdate = {
        beforeInsert()
    }
}
