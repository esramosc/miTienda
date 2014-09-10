package mitienda

import groovy.sql.Sql

class ReportSalesByCategoryService {

    def dataSource

    def getQuantityByPiece(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select d.name, sum(b.quantity) as quantity from mostrador a, sale_transaction b, products c, category d "
        query += "where a.id_mostrador = b.id_mostrador and b.product = c.id and c.type = 'Pieza' and c.category = d.id "
        query += "and a.username in (select username from admin_user where branch = ?) "
        query += "group by d.name order by quantity desc limit 5"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.name = it.name
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def getQuantityByKilo(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select d.name, sum(b.quantity)/1000 as quantity from mostrador a, sale_transaction b, products c, category d "
        query += "where a.id_mostrador = b.id_mostrador and b.product = c.id and c.type = 'Kilogramo' and c.category = d.id "
        query += "and a.username in (select username from admin_user where branch = ?) "
        query += "group by d.name order by quantity desc limit 5"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.name = it.name
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def getPriceByPiece(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select d.name, sum(b.total) as total from mostrador a, sale_transaction b, products c, category d "
        query += "where a.id_mostrador = b.id_mostrador and b.product = c.id and c.type = 'Pieza' and c.category = d.id "
        query += "and a.username in (select username from admin_user where branch = ?) "
        query += "group by d.name order by total desc limit 5"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.name = it.name
            result.total = it.total
            results.add(result)
        }
        return results
    }

    def getPriceByKilo(String branchId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select d.name, sum(b.total) as total from mostrador a, sale_transaction b, products c, category d "
        query += "where a.id_mostrador = b.id_mostrador and b.product = c.id and c.type = 'Kilogramo' and c.category = d.id "
        query += "and a.username in (select username from admin_user where branch = ?) "
        query += "group by d.name order by total desc limit 5"
        sql.eachRow(query,[branchId]){
            def result = new Expando()
            result.name = it.name
            result.total = it.total
            results.add(result)
        }
        return results
    }

}
