package mitienda

import groovy.sql.Sql

class AdminUserService {

    def dataSource

    def getBranchName(String branchId) {
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT branch FROM branch where id = ?"
        sql.eachRow(query,[branchId]){
            result = it.branch
        }
        return result
    }

    def getRoleName(String roleId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT role_name FROM role WHERE id = ?"
        sql.eachRow(query,[roleId]){
            result = it.role_name
        }
        return result
    }

}
