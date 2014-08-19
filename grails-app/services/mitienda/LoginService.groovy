package mitienda

import groovy.sql.Sql

class LoginService {

    def dataSource

    def isValidUser(String username, String password) {
        def sql = new Sql(dataSource)
        def result = false
        def query = ""
        query = "SELECT 1 FROM admin_user WHERE upper(username) = upper(?) AND password = ?"
        sql.eachRow(query,[username,password]){
            result = true
        }
        println "result: "+result
        return result
    }

}
