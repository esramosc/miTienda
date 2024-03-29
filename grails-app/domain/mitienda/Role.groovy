package mitienda

class Role {

    String  roleName
    String  roleDescription
    Date    registerDate

    static constraints = {
        roleName blank: false, nullable: false, unique: true
        roleDescription blank: false, nullable: false
        registerDate nullable: true
    }

}
