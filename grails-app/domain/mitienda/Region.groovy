package mitienda

class Region {

    String  region
    String  description
    Date    registerDate

    static constraints = {
        region blank: false, nullable: false
        description blank: false, nullable: false
        registerDate nullable: false
    }

}
