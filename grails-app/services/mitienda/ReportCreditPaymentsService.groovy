package mitienda

import groovy.sql.Sql

class ReportCreditPaymentsService {

    def dataSource

    def getTodayPayments(String username) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select customer_id, amount, payment, tran_date, username from credit_payments "
        query += "where date_format(tran_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') AND username = ?"
        sql.eachRow(query,[username]){
            def result = new Expando()
            result.customerId = getCustomerName(it.customer_id)
            result.amount = it.amount
            result.payment = it.payment
            result.tranDate = it.tran_date
            result.username = it.username
            results.add(result)
        }
        return results
    }

    def getCustomerName(String customerId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT name, lastname from customer where id = ?"
        sql.eachRow(query,[customerId]){
            result = it.name + " " + it.lastname
        }
        return result
    }

}
