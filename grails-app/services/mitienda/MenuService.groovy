package mitienda

import groovy.sql.Sql

class MenuService {

    static transactional = true
    def dataSource

    def getMenuCat(int roleId) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "SELECT acc_id,acc_name FROM access WHERE acc_category = 'YES' AND acc_id IN(SELECT acc_id FROM permisos WHERE role_id = ?) ORDER BY acc_name "
        sql.eachRow(query,[roleId]){
            def result = new Expando()
            result.acc_id = it.acc_id
            result.acc_name = it.acc_name
            results.add(result)
        }
        return results
    }

    def getSubmenu(int catId, int roleId){
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "SELECT acc_name,acc_controller,acc_action FROM access WHERE acc_show= 'YES' AND acc_categoryId = ? AND acc_id IN(SELECT acc_id FROM permisos WHERE role_id = ?) ORDER BY acc_name"
        sql.eachRow(query,[catId,roleId]){
            def result = new Expando()
            result.acc_name = it.acc_name
            result.acc_controller = it.acc_controller
            result.acc_action = it.acc_action
            results.add(result)
        }
        return results
    }

}
