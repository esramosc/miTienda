package mitienda

import groovy.sql.Sql

class ReportMinQuantityService {

    def dataSource

    def getMinQty(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select product, description, min_quantity, (select quantity from stock_branch where product_id = products.id and branch_id = ?) AS quantity from products "
        query += "where (select quantity from stock_branch where product_id = products.id and branch_id = ?) <= min_quantity"
        sql.eachRow(query,[branchId,branchId]){
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
