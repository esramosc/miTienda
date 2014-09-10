package mitienda

class Branch {

    String  region
    String  branch
    String  description
    String  status //ACTIVA, INACTIVA
    Date    registerDate

    static constraints = {
        region blank: false, nullable: false
        branch blank: false, nullable: false, unique: true
        description blank: false, nullable: false
        status blank: false, nullable: false
        registerDate nullable: true
    }

}
