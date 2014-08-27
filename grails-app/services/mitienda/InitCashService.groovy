package mitienda

import groovy.sql.Sql


class InitCashService {

    def dataSource

    def alreadyOpen(String username) {
        def sql = new Sql(dataSource)
        def today = new Date().format("dd/MM/yyyy")
        println "today: "+today
        def result = false
        def query = "select 1 from init_cash where date_format(register_date,'%d/%m/%Y') = ? and username = ?"
        sql.eachRow(query,[today,username]){
            result = true
        }
        print "result: "+result
        return result
    }

}
