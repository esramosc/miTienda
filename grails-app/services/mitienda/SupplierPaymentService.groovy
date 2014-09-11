package mitienda

import groovy.sql.Sql

class SupplierPaymentService {

    def dataSource

    def getSupplierAmount(String supplierId,String branchId) {
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "select sum(actual_amount) as actualAmount from supplier_buy where status = 'PENDIENTE' and supplier_id = ? "
        query += "AND username in (select username from admin_user where branch = ?)"
        sql.eachRow(query, [supplierId,branchId]){
            result =  it.actualAmount
        }
        return  result
    }

    def updateAmount(String supplierId,float payment){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        def query2 = ""
        def buyId = 0
        def amount = 0.0
        def status = ""
        def amountToPay = 0.0
        query = "select id, actual_amount  from supplier_buy where status = 'PENDIENTE' and supplier_id = ? order by buy_date asc"
        sql.eachRow(query,[supplierId]){
            buyId = it.id
            amount = it.actual_amount
            if(amount<payment){
                status = "PAGADO"
                payment = payment - amount
                amountToPay = amount
            }else{
                status = "PENDIENTE"
                amountToPay = payment
                payment = 0.0
            }
            updateActualAmount(buyId.toString(),amountToPay,status)
            if(payment==0.0)
                return
        }
    }

    def updateActualAmount(String buyId, float payment, String status){
        def sql = new Sql(dataSource)
        def query = ""
        query = "UPDATE supplier_buy set actual_amount = actual_amount - ?, status = ? WHERE id = ?"
        sql.executeUpdate(query,[payment,status,buyId])
        return
    }



}
