package mitienda

import groovy.sql.Sql

class ReportSupplierBuysService {

    def dataSource

    def getBuys(String username) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select supplier_id, buy_description, buy_type, buy_amount, username, date_format(buy_date,'%d/%m/%Y %h:%i:%s %p') as buyDate "
        query += "from supplier_buy "
        query += "where date_format(buy_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') ANd username = ?"
        sql.eachRow(query,[username]){
            def result = new Expando()
            result.supplier = getSupplierName(it.supplier_id.toString())
            result.buyDescription = it.buy_description
            result.buyType = it.buy_type
            result.buyAmount = it.buy_amount
            result.username = it.username
            result.buyDate = it.buyDate
            results.add(result)
        }
        return  results
    }

    def getSupplierName(String supplierId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT enterprise FROM supplier WHERE id = ?"
        sql.eachRow(query,[supplierId]){
            result = it.enterprise
        }
        return result
    }

}
