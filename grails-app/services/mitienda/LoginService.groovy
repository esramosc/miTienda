package mitienda

import groovy.sql.Sql

class LoginService {

    def dataSource

    def isValidUser(String username, String password) {
        def sql = new Sql(dataSource)
        def result = false
        def query = ""
        query = "SELECT 1 FROM admin_user WHERE upper(username) = upper(?) AND password = ? and status = 'ACTIVO' "
        query += "AND (select status from branch where id = admin_user.branch) = 'ACTIVA'"
        sql.eachRow(query,[username,password]){
            result = true
        }
        return result
    }

    def getRoleId(String username){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "SELECT role FROM admin_user WHERE username = ?"
        sql.eachRow(query,[username]){
            result = it.role
        }
        return result
    }

    def getTotalProducts(){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select count(*) as total from products "
        sql.eachRow(query){
            result = it.total
        }
        return result
    }

    def getTotalCustomers(){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select count(*) as total from customer where status = 'ACTIVO'"
        sql.eachRow(query){
            result = it.total
        }
        return result
    }

    def getTotalSuppliers(){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select count(*) as total from supplier"
        sql.eachRow(query){
            result = it.total
        }
        return result
    }

    def getTotalUsers(){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select count(*) as total from admin_user where status = 'ACTIVO'"
        sql.eachRow(query){
            result = it.total
        }
        return result
    }

    def getCashSales(String username){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select count(*) as total from mostrador where type = 'EFECTIVO' "
        query += "and date_format(transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and username = ?"
        sql.eachRow(query,[username]){
            result = it.total
        }
        return result
    }

    def getCreditSales(String username){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select count(*) as total from mostrador where type = 'CREDITO' "
        query += "and date_format(transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and username = ?"
        sql.eachRow(query,[username]){
            result = it.total
        }
        return result
    }

    def getMonthInSP(String month){
        def monthSp = ""
        if(month=="January")
            monthSp = "Enero"
        if(month=="February")
            monthSp = "Febrero"
        if(month=="March")
            monthSp = "Marzo"
        if(month=="April")
            monthSp = "Abril"
        if(month=="May")
            monthSp = "Mayo"
        if(month=="June")
            monthSp = "Junio"
        if(month=="July")
            monthSp = "Julio"
        if(month=="August")
            monthSp = "Agosto"
        if(month=="September")
            monthSp = "Septiembre"
        if(month=="October")
            monthSp = "Octubre"
        if(month=="November")
            monthSp = "Noviembre"
        if(month=="December")
            monthSp = "Diciembre"
        return monthSp
    }

    def getBranchId(String username){
        def sql = new Sql(dataSource)
        def result = 0
        def query = ""
        query = "select branch from admin_user where username = ?"
        sql.eachRow(query,[username]){
            result = it.branch
        }
        return result
    }

    def getNameOfUser(String username){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT name, lastname from admin_user where username = ?"
        sql.eachRow(query,[username]){
            result = it.name +" "+ it.lastname
        }
        return result
    }

    def getImageOfUser(String username){
        def sql = new Sql(dataSource)
        def result = "blue-user-icon.png"
        def query = ""
        query = "select photo from admin_user where username = ?"
        sql.eachRow(query,[username]){
            if(it.photo!="")
                result = it.photo
        }
        return  result
    }

}
