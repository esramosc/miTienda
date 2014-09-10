package mitienda

import groovy.sql.Sql

class ChartTopSalesService {

    def dataSource

    def getTodayTopSales(String username) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select product, sum(quantity) as quantity from sale_transaction a, mostrador b "
        query += "where a.id_mostrador = b.id_mostrador and a.status = 'ACTIVA' AND b.username = ? "
        query += "and date_format(b.transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and a.product in(select id from products where type='Pieza') "
        query += "group by product order by quantity desc limit 5"
        sql.eachRow(query,[username]){
            def result = new Expando()
            result.product = getProdName(it.product)
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def getTodayTopSales2(String username) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select product, sum(quantity)/1000 as quantity from sale_transaction a, mostrador b "
        query += "where a.id_mostrador = b.id_mostrador and a.status = 'ACTIVA' AND b.username = ? "
        query += "and date_format(b.transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and a.product in(select id from products where type='Kilogramo') "
        query += "group by product order by quantity desc limit 5"
        sql.eachRow(query,[username]){
            def result = new Expando()
            result.product = getProdName(it.product)
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def getTopSales(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select product, sum(quantity) as quantity from sale_transaction a , mostrador b "
        query += "where a.status = 'ACTIVA' and a.id_mostrador = b.id_mostrador and a.product in(select id from products where type='Pieza') "
        query += "and b.username in (select username from admin_user WHERE branch = ?) "
        query += "group by product order by quantity desc limit 5"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.product = getProdName(it.product)
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def getTopSales2(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select product, sum(quantity)/1000 as quantity from sale_transaction a , mostrador b  "
        query += "where a.status = 'ACTIVA' and a.id_mostrador = b.id_mostrador and a.product in(select id from products where type='Kilogramo') "
        query += "and b.username in (select username from admin_user WHERE branch = ?) "
        query += "group by product order by quantity desc limit 5"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.product = getProdName(it.product)
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def getProdName(String prodId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT product FROM products WHERE id = ?"
        sql.eachRow(query,[prodId]){
            result = it.product
        }
        return result
    }

}
