package mitienda

class Permisos {

    String  acc
    String  role

    static constraints = {
        acc blank: false, nullable: false
        role blank: false, nullable: false
    }

}
