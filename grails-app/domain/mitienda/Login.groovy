package mitienda

class Login {

    String  name
    String  password

    static constraints = {
        name blank: false, nullable: false
        password blank: false, nullable: false
    }
}
