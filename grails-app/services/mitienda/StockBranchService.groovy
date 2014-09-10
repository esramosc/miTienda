package mitienda

import groovy.sql.Sql

class StockBranchService {

    def dataSource

    def getProdByName(String text) {
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select id, product from  products where product like '%"+text+"%' order by product asc limit 15"
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.product = it.product
            results.add(result)
        }
        return  results
    }

    def alreadyExists(String branchId, String prodId){
        def sql = new Sql(dataSource)
        def result = false
        def query = ""
        query = "SELECT 1 FROM stock_branch WHERE branch_id = ? AND product_id = ?"
        sql.eachRow(query,[branchId,prodId]){
            result = true
        }
        return result
    }

    def getProdName(String prodId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT product FROM products WHERE id = ?"
        sql.eachRow(query,[prodId]){
            result = it.product
        }
        return result
    }

    def getBranchName(String branchId){
        def sql = new Sql(dataSource)
        def result = ""
        def query = ""
        query = "SELECT branch from branch where id = ?"
        sql.eachRow(query,[branchId]){
            result = it.branch
        }
        return result
    }

    def getProdByDesc(String text){
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select id, branch_id, product_id, quantity from stock_branch where product_id in( "
        query += "select id from products where product like '%"+text+"%' order by product asc) limit 15 "
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.branchId = getBranchName(it.branch_id.toString())
            result.productId = getProdName(it.product_id.toString())
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

}
