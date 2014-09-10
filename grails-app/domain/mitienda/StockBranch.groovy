package mitienda

class StockBranch {

    String  productId
    float   quantity
    String  branchId

    static constraints = {
        productId blank: false, nullable: false
        quantity min: 0.1F
        branchId blank: false, nullable: false
    }

}
