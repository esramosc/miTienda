package mitienda

class Products {

    String  category
    String  product
    String  description
    float   buyPrice
    float   salePrice
    float   tax
    int     minQuantity
    String  barCode
    String  type
    String  image
    Date    registerDate

    static constraints = {
        category blank: false, nullable: false
        product blank: false, nullable: false, unique: true
        description blank: false, nullable: false
        buyPrice null:false
        salePrice null:false
        tax null:true
        minQuantity null:false,min: 1
        barCode blank: true, nullable: true, unique: true
        type blank: false, nullable: false
        image blank: true, nullable: true
        registerDate nullable: true
    }

}
