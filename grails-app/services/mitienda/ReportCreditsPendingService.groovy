package mitienda

import groovy.sql.Sql

class ReportCreditsPendingService {

    def dataSource

    def getTotalCredits(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select customer_id, sum(amount) as amount "
        query += "from mostrador where type = 'CREDITO' "
        query += "and username in (select username from admin_user where branch = ?) "
        query += "group by customer_id"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.customerId = it.customer_id
            result.amount = it.amount
            results.add(result)
        }
        return results
    }

    def getCreditPayments(String customerId){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(payment),0) as payment from credit_payments "
        query += "where customer_id = ?"
        sql.eachRow(query,[customerId]){
            result = it.payment
        }
        return result
    }

    def getCustomerName(String customerId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT name, lastname FROM customer WHERE id = ?"
        sql.eachRow(query,[customerId]){
            result = it.name + " " + it.lastname
        }
        return result
    }

}
