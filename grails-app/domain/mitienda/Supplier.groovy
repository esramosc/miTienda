package mitienda

class Supplier {

    String  enterprise
    String  description
    String  phone
    String  address
    Date    registerDate

    static constraints = {
        enterprise blank: false, nullable: false
        description blank: false, nullable: false
        phone blank: true, nullable: true
        address blank: true, nullable: true
        registerDate nullable: true
    }

}
