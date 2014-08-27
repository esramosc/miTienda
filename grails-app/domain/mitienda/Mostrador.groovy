package mitienda

class Mostrador {

    String  customerId
    String  username
    String  transactionDate
    float   amount
    String  type //EFECTIVO , CREDITO
    String  idMostrador

    static constraints = {
        customerId blank: false, nullable: false
        username blank: true, nullable: true
        transactionDate nullable: true
        amount min: 0.1F
        type blank: true, nullable: true
        idMostrador blank: true, nullable: true
    }

}
