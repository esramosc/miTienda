package mitienda

import groovy.sql.Sql

class CustomerService {

    def dataSource

    def getCustomerByName(String text) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "SELECT id, name, lastname, phone, address, status, comment, register_date "
        query += "FROM customer WHERE name like '%"+text+"%' order by name, lastname asc limit 15"
        println "query: "+query
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.name = it.name
            result.lastname = it.lastname
            result.phone = it.phone
            result.address = it.address
            result.status = it.status
            result.comment = it.comment
            result.registerDate = it.register_date
            results.add(result)
        }
        return results
    }

}
