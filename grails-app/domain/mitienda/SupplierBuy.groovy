package mitienda

class SupplierBuy {

    String  supplierId
    String  buyDescription
    float   buyAmount
    float   actualAmount
    String  buyType
    Date    buyDate
    String  status //PAGADO, PENDIENTE
    String  username

    static constraints = {
        supplierId blank: false, nullable: false
        buyDescription blank: false, nullable: false
        buyAmount min: 1.0F
        actualAmount min: 0.0F
        buyType blank: false, nullable: false
        buyDate nullable: true
        status blank: true, nullable: true
        username blank: true, nullable: true
    }

}
