package mitienda

class Customer {

    String  name
    String  lastname
    String  phone
    String  address
    String  status //ACTIVO, INACTIVO
    String  comment
    Date    registerDate

    static constraints = {
        name blank: false, nullable: false
        lastname blank: false, nullable: false
        phone blank: false, nullable: false
        address blank: false, nullable: false
        status blank: false, nullable: false
        comment blank: true, nullable: true
        registerDate nullable: true
    }

}
