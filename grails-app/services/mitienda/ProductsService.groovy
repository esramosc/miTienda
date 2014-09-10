package mitienda

import groovy.sql.Sql

class ProductsService {

    def dataSource

    def getCategoryDesc(String categoryId) {
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT name FROM category WHERE id = ?"
        sql.eachRow(query,[categoryId]){
            result = it.name
        }
        return result
    }

    def getProdByDesc(String description){
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select * from products where product like '%"+description+"%' order by product asc limit 15"
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.barCode = it.bar_code
            result.buyPrice = it.buy_price
            result.description = it.description
            result.image = it.image
            result.minQuantity = it.min_quantity
            result.product = it.product
            result.salePrice = it.sale_price
            result.tax = it.tax
            result.type = it.type
            result.registerDate = it.register_date
            result.category = getCategoryDesc(it.category.toString())
            results.add(result)
        }
        return results
    }

}
