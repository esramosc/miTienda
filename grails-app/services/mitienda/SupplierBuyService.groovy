package mitienda

import groovy.sql.Sql

class SupplierBuyService {

    def dataSource

    def getSupplier(String text) {
        def sql = new Sql(dataSource)
        def results = []
        def query = "select id, enterprise from supplier WHERE enterprise like '%"+text+"%' order by enterprise asc limit 8"
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.enterprise = it.enterprise
            results.add(result)
        }
        return results
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
