package mitienda

class Products {

    String  category
    String  product
    String  description
    int     quantity
    float   buyPrice
    float   salePrice
    float   mayorPrice
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
        quantity null:false,min: 1
        buyPrice null:false
        salePrice null:false
        mayorPrice null:false
        tax null:true
        minQuantity null:false,min: 1
        barCode blank: true, nullable: true, unique: true
        type blank: false, nullable: false
        image blank: true, nullable: true
        registerDate nullable: true
    }

}
