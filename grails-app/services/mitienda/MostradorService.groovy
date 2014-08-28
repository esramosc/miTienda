package mitienda

import groovy.sql.Sql

class MostradorService {

    def dataSource

    def getCustomer(String name) {
        def results = []
        def sql = new Sql(dataSource)
        def query = "select id, name, lastname from customer where name like '%"+name+"%' and status='ACTIVO' order by name,lastname asc limit 5"
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.name = it.name
            result.lastname = it.lastname
            results.add(result)
        }
        return results
    }

    def getProductByCode(String code){
        def sql = new Sql(dataSource)
        def result = [id:"",product:"",description:"",image:"",salePrice:"",tax:"",type:""]
        def query = ""
        query = "SELECT id, product, description, image, sale_price, tax, type FROM products WHERE bar_code = ?"
        sql.eachRow(query,[code]){
            result.id = it.id
            result.product = it.product
            result.description = it.description
            result.image = it.image
            result.salePrice = it.sale_price
            result.tax = it.tax
            result.type = it.type
        }
        return result
    }

    def getProdByName(String name){
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "select id, product from products where product like '%"+name+"%' order by product asc limit 10"
        sql.eachRow(query){
            def result = new Expando()
            result.id = it.id
            result.product = it.product
            results.add(result)
        }
        return results
    }

    def getProductById(String prodId){
        def sql = new Sql(dataSource)
        def result = [id:"",product:"",description:"",image:"",salePrice:"",tax:"",type:""]
        def query = ""
        query = "SELECT id, product, description, image, sale_price, tax, type FROM products WHERE id = ?"
        sql.eachRow(query,[prodId]){
            result.id = it.id
            result.product = it.product
            result.description = it.description
            result.image = it.image
            result.salePrice = it.sale_price
            result.tax = it.tax
            result.type = it.type
        }
        return result
    }

    def isAlreadyUse(String randomString){
        def sql = new Sql(dataSource)
        def result = false
        def query = ""
        query = "SELECT 1 FROM sale_transaction where id_mostrador = ?"
        sql.eachRow(query,[randomString]){
            result = true
        }
        return result
    }

    def getTotal(String randomString){
        def sql = new Sql(dataSource)
        def result = 0.0
        def query = ""
        query = "SELECT sum(total) as total from sale_transaction where id_mostrador = ?"
        sql.eachRow(query,[randomString]){
            result = it.total
        }
        return result
    }

    def getSaleProds(String randomString){
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "SELECT product,quantity from sale_transaction where status = 'ACTIVA' AND id_mostrador = ?"
        sql.eachRow(query,[randomString]){
            def result = new Expando()
            result.product = it.product
            result.quantity = it.quantity
            results.add(result)
        }
        return results
    }

    def updateQuantity(String product, Float quantity){
        def sql = new Sql(dataSource)
        def typeProd = ""
        def quantityTmp = 0.0
        def query = ""
        query = "SELECT type FROM products where id = ?"
        sql.eachRow(query,[product]){
            typeProd = it.type
        }
        if(typeProd=="Kilogramo"){
            quantityTmp = quantity / 1000
            quantity = quantityTmp
        }
        query = "UPDATE products set quantity = quantity - ? WHERE id = ?"
        sql.executeUpdate(query,[quantity,product])
        return
    }

    def consProdByName(String text){
        def sql = new Sql(dataSource)
        def results = []
        def query = ""
        query = "SELECT product, sale_price, image FROM products WHERE product like '%"+text+"%' order by product asc limit 10"
        sql.eachRow(query){
            def result = new Expando()
            result.product = it.product
            result.salePrice = it.sale_price
            result.image = it.image
            results.add(result)
        }
        return  results
    }

}
