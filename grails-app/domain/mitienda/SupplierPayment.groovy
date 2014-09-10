package mitienda

class SupplierPayment {

    String  supplierId
    float   actualAmount
    float   payment
    Date    registerDate
    String  username


    static constraints = {
        supplierId blank: false, nullable: false
        actualAmount min: 0.1F
        payment min: 0.1F
        registerDate nullable: true
        username blank: true, nullable: true
    }

}
