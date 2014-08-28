package mitienda

import groovy.sql.Sql

class ReportMinQuantityService {

    def dataSource

    def getMinQty() {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select product, description, min_quantity, quantity from products "
        query += "where quantity <= min_quantity"
        sql.eachRow(query){
            def result = new Expando()
            result.product = it.product
            result.description = it.description
            result.minQuantity = it.min_quantity
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

}
