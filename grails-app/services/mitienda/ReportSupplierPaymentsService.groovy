package mitienda

import groovy.sql.Sql

class ReportSupplierPaymentsService {

    def dataSource

    def getPayments(String username) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select supplier_id, actual_amount, payment, username, date_format(register_date,'%d/%m/%Y %h:%i:%s %p') as registerDate from supplier_payment "
        query += "where date_format(register_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') AND username = ?"
        sql.eachRow(query,[username]){
            def result = new Expando()
            result.supplierId = getSupplierName(it.supplier_id.toString())
            result.actualAmount = it.actual_amount
            result.payment = it.payment
            result.amount = it.actual_amount - it.payment
            result.username = it.username
            result.registerDate = it.registerDate
            results.add(result)
        }
        return results
    }

    def getSupplierName(String supplierId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = "select enterprise from supplier where id = ?"
        sql.eachRow(query,[supplierId]){
            result = it.enterprise
        }
        return  result
    }

}
