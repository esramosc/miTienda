package mitienda

import groovy.sql.Sql

class BranchService {

    def dataSource

    def getRegionName(String regionId) {
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT region FROM region WHERE id = ?"
        sql.eachRow(query,[regionId]){
            result = it.region
        }
        return result
    }

}
