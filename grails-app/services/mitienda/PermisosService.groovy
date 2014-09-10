package mitienda

import groovy.sql.Sql

class PermisosService {

    def dataSource


    def getRoles()
    {
        def sql=new Sql(dataSource)
        def results = []
        def query = ""
        query = "select id,role_name from role"

        sql.eachRow(query)
        {
            def result= new Expando();
            result.role_id=it.id;
            result.role_name=it.role_name;
            results.add(result);
        }
        return results;
    }

    def getAccesos()
    {
        def sql= new Sql(dataSource)
        def results = []
        def query = "SELECT acc_id,acc_name from access"
        sql.eachRow(query)
        {
            def result= new Expando()
            result.acc_id=it.acc_id;
            result.acc_name=it.acc_name;
            results.add(result)
        }
        return results
    }

    def getPermisos()
    {
        def sql= new Sql(dataSource)
        def results = []
        def query = "SELECT acc,role from permisos"
        sql.eachRow(query)
        {
            def result= new Expando()
            result.acc_id=it.acc
            result.role_id=it.role
            results.add(result)
        }
        return results
    }

    def getAccessDesc(Long id)
    {
        def sql= new Sql(dataSource)
        def result
        def query="SELECT acc_description from access where acc_id= ?"
        sql.eachRow(query,[id])
        {
            result=it.acc_description
        }
        return result
    }

    def getRoleDesc(Long id)
    {
        def sql= new Sql(dataSource)
        def result
        def query="SELECT role_name from role where id=?"
        sql.eachRow(query,[id])
        {
            result=it.role_name
        }
        return result
    }

}
