package mitienda

import groovy.sql.Sql

class ReportSalesMostradorService {

    def dataSource

    def getTodaySales() {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select a.id_mostrador,a.username,a.customer_id,a.amount,a.type,date_format(a.transaction_date,'%d/%m/%Y %h:%i:%s %p') as registerDate, "
        query += "b.product,b.quantity,b.price,b.total from mostrador a, sale_transaction b "
        query += "where a.id_mostrador = b.id_mostrador "
        query += "and b.status = 'ACTIVA' "
        query += "and date_format(a.transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "order by a.transaction_date asc"
        sql.eachRow(query){
            def result = new Expando()
            result.idMostrador = it.id_mostrador
            result.username = it.username
            result.customer = getCustomerName(it.customer_id)
            result.amount = it.amount
            result.type = it.type
            result.registerDate = it.registerDate
            result.product = getProductName(it.product)
            result.quantity = it.quantity
            result.price = it.price
            result.total = it.total
            results.add(result)
        }
        return results
    }

    def getCustomerName(String idCust){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT name, lastname FROM customer where id = ?"
        sql.eachRow(query,[idCust]){
            result = it.name +" "+ it.lastname
        }
        return result
    }

    def getProductName(String prodId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT product FROM products where id = ?"
        sql.eachRow(query,[prodId]){
            result = it.product
        }
        return result
    }

}
