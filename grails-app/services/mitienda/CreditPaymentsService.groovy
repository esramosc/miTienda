package mitienda

import groovy.sql.Sql

class CreditPaymentsService {

    def dataSource

    def getCustomer(String name) {
        def results = []
        def sql = new Sql(dataSource)
        def query = "select id, name, lastname from customer where name like '%"+name+"%' and status='ACTIVO' order by name,lastname asc limit 5"
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.name = it.name
            result.lastname = it.lastname
            results.add(result)
        }
        return results
    }

    def getDebt(String customerId){
        def sql = new Sql(dataSource)
        def result = 0.0
        def debt = 0.0
        def payments = 0.0
        def query = ""
        query = "select ifnull(sum(amount),0) as amount from mostrador where customer_id = ?"
        sql.eachRow(query,[customerId]){
            debt = it.amount
        }
        query = "select ifnull(sum(payment),0) as amount from credit_payments where customer_id = ?"
        sql.eachRow(query,[customerId]){
            payments = it.amount
        }
        result = debt - payments
        return result
    }

    def getCustomerName(String customerId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT name, lastname FROM customer WHERE id = ?"
        sql.eachRow(query,[customerId]){
            result = it.name +" "+ it.lastname
        }
        return result
    }

}
