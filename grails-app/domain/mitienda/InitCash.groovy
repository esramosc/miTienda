package mitienda

class InitCash {

    String  username
    Date    registerDate
    float   amount

    static constraints = {
        username blank: true, nullable: true
        registerDate nullable: true
        amount min: 0.1F
    }

}
