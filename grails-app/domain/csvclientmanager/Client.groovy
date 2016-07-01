package csvclientmanager

class Client {
    String name
    String email
    String street
    String zip
    double latitude
    double longitude

    static constraints = {
        name(blank: false, nullable: false)
        email(blank: false, nullable: false, unique: true)
        street(blank: false, nullable: false)
        zip(blank: false, nullable: false)
        latitude()
        longitude()
    }


}
