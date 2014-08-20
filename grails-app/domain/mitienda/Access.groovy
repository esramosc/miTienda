package mitienda

class Access {

    String  name
    String  description
    String  category
    String  subcategory
    String  categoryId
    String  control //controller
    String  act //action
    String  show

    static constraints = {
        name blank: false, nullable: false
        description blank: false, nullable: false
        category blank: false, nullable: false
        subcategory blank: true, nullable: true
        categoryId blank: true, nullable: true
        control blank: false, nullable: false
        act blank: false, nullable: false
        show blank: true, nullable: true
    }

    static mapping = {
        table 'access'
        version false
        columns{
            id            column:'acc_id'
            name          column:'acc_name'
            description   column:'acc_description'
            category      column:'acc_category'
            subcategory   column:'acc_subcategory'
            categoryId    column:'acc_categoryId'
            control       column:'acc_controller'
            act           column:'acc_action'
            show          column:'acc_show'
        }
    }

}
