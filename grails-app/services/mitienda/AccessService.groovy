package mitienda

import groovy.sql.Sql

class AccessService {

    def dataSource

    def getCategories() {
        def sql = new Sql(dataSource)
        def results = []
        def query = "SELECT acc_id,acc_name FROM access WHERE acc_category = 'SI'"
        sql.eachRow(query) {
            def result = new Expando()
            result.acc_id = it.acc_id
            result.acc_name = it.acc_name
            results.add(result)
        }
        return results
    }

}
