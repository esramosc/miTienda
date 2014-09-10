package mitienda

class CreditPayments {

    String  customerId
    float   amount
    float   payment
    Date    tranDate
    String  username

    static constraints = {
        customerId blank: false, nullable: false
        amount min: 0.1F
        payment min: 0.1F
        tranDate nullable: true
        username blank: true, nullable: true
    }

}
