package mitienda

class Category {

    String  name
    String  description
    Date    registerDate

    static constraints = {
        name blank: false, nullable: false
        description blank: false, nullable: false
        registerDate nullable: true
    }

}
