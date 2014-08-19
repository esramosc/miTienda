package mitienda

class AdminUser {

    String  name
    String  lastname
    String  address
    String  phone
    String  branch
    String  status //ACTIVO, INACTIVO, ELIMINADO
    String  photo
    String  username
    String  password
    Date    registerDate

    static constraints = {
        name blank: false, nullable: false
        lastname blank: false, nullable: false
        address blank: false, nullable: false
        phone blank: false, nullable: false
        branch blank: false, nullable: false
        status blank: false, nullable: false
        photo blank: true, nullable: true
        username blank: false, nullable: false, unique: true
        password blank: false, nullable: false
        registerDate nullable: true
    }
}
