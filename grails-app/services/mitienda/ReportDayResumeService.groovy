package mitienda

import groovy.sql.Sql

class ReportDayResumeService {

    def dataSource

    def getInitCash(String username) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(amount,0) as amount from init_cash "
        query += "where date_format(register_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username = ?"
        sql.eachRow(query,[username]){
            result = it.amount
        }
        return result
    }

    def getTodaySales(String username) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(amount),0.0) as amount from mostrador where type='EFECTIVO' "
        query += "and date_format(transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username = ?"
        sql.eachRow(query,[username]){
            result = it.amount
        }
        return result
    }

    def getTodaySalesCredit(String username) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(amount),0.0) as amount from mostrador where type='CREDITO' "
        query += "and date_format(transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username = ?"
        sql.eachRow(query,[username]){
            result = it.amount
        }
        return result
    }

    def getCashBuy(String username){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(buy_amount),0) as amount from supplier_buy "
        query += "where date_format(buy_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and buy_type = 'CONTADO' AND username = ?"
        sql.eachRow(query,[username]){
            result = it.amount
        }
        return result
    }

    def getCreditBuy(String username){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(buy_amount),0) as amount from supplier_buy "
        query += "where date_format(buy_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and buy_type = 'CREDITO' AND username = ?"
        sql.eachRow(query,[username]){
            result = it.amount
        }
        return result
    }

    def getTodayPayments(String username){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(payment),0) as amount from supplier_payment "
        query += "where date_format(register_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username = ?"
        sql.eachRow(query,[username]){
            result = it.amount
        }
        return result
    }

    def getCreditPayments(String username){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(payment),0) as payments from credit_payments "
        query += "where date_format(tran_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username = ?"
        sql.eachRow(query, [username]){
            result = it.payments
        }
        return result
    }

    def getInitCashByBranch(String branchId) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(amount,0) as amount from init_cash "
        query += "where date_format(register_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username in(select username from admin_user where branch = ?)"
        sql.eachRow(query,[branchId]){
            result = it.amount
        }
        return result
    }

    def getTodaySalesByBranch(String branchId) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(amount),0.0) as amount from mostrador where type='EFECTIVO' "
        query += "and date_format(transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query,[branchId]){
            result = it.amount
        }
        return result
    }

    def getTodaySalesCreditByBranch(String branchId) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(amount),0.0) as amount from mostrador where type='CREDITO' "
        query += "and date_format(transaction_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query,[branchId]){
            result = it.amount
        }
        return result
    }

    def getCashBuyByBranch(String branchId){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(buy_amount),0) as amount from supplier_buy "
        query += "where date_format(buy_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and buy_type = 'CONTADO' AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query,[branchId]){
            result = it.amount
        }
        return result
    }

    def getCreditBuyByBranch(String branchId){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(buy_amount),0) as amount from supplier_buy "
        query += "where date_format(buy_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "and buy_type = 'CREDITO' AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query,[branchId]){
            result = it.amount
        }
        return result
    }

    def getTodayPaymentsByBranch(String branchId){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(payment),0) as amount from supplier_payment "
        query += "where date_format(register_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query,[branchId]){
            result = it.amount
        }
        return result
    }

    def getCreditPaymentsByBranch(String branchId){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select ifnull(sum(payment),0) as payments from credit_payments "
        query += "where date_format(tran_date,'%d/%m/%Y') = date_format(now(),'%d/%m/%Y') "
        query += "AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query, [branchId]){
            result = it.payments
        }
        return result
    }

}
