package mitienda

import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.lang.RandomStringUtils

class MostradorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def mostradorService
    def initCashService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mostradorInstanceList: Mostrador.list(params), mostradorInstanceTotal: Mostrador.count()]
    }

    def create() {
        if(!initCashService.alreadyOpen(session.username)){
            redirect(controller: "initCash")
        }
        String charset = (('A'..'Z') + ('0'..'9')).join()
        Integer length = 9
        def flag = true
        String randomString = ""
        while (flag){
            randomString = RandomStringUtils.random(length, charset.toCharArray())
            if(!mostradorService.isAlreadyUse(randomString)){
                flag = false
            }
        }

        println "randomString: "+randomString
        session.randomString =  randomString
        [mostradorInstance: new Mostrador(params)]
    }

    def save() {
        def mostradorInstance = new Mostrador(params)
        if (!mostradorInstance.save(flush: true)) {
            render(view: "create", model: [mostradorInstance: mostradorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mostrador.label', default: 'Mostrador'), mostradorInstance.id])
        redirect(action: "show", id: mostradorInstance.id)
    }

    def getCustomers(){
        def results = mostradorService.getCustomer(params.name)
        render(template: "customerList",model: [results:results])
    }

    def searchProduct(){
        if(params.code!=""){
            def price = 0.0
            def total = 0.0
            def totalTmp = 0.0
            def result = mostradorService.getProductByCode(params.code)
            def detail = [id:"",product:"",quantity:"",price:"",total:"",flag:"",image:""]
            if(result.id!=""){
                detail.flag = true
                detail.product = result.product
                detail.id = result.id
                detail.quantity = params.quantity
                detail.image = result.image
                if(result.type=="Pieza"){
                    price = result.salePrice * (1+(result.tax/100))
                    total = price * Float.parseFloat(params.quantity)
                    println "price1: "+price
                    println "total1: "+total
                    detail.price = price
                    detail.total = total
                }
                if(result.type=="Kilogramo"){
                    price = result.salePrice * (1+(result.tax/100))
                    total = price * Float.parseFloat(params.quantity) / 1000
                    println "price2: "+price
                    println "total2: "+total
                    detail.price = price
                    detail.total = total
                }
            }else{
                detail.flag = false
            }
            SaleTransaction saleTran = new SaleTransaction()
            saleTran.idMostrador = session.randomString
            saleTran.product = detail.id
            saleTran.price = price
            saleTran.quantity = params.quantity
            saleTran.total = total
            saleTran.status = "ACTIVA"
            if(saleTran.save(flush: true)){
                totalTmp = mostradorService.getTotal(session.randomString)
                render(template: "productList",model: [detail:detail,totalTmp:totalTmp.toString()])
            }
        }
    }

    def getProductsByName(){
        def results = mostradorService.getProdByName(params.name)
        render(template: "products",model: [results:results])
    }

    def searchProductById(){
        if(params.id!=""){
            def price = 0.0
            def total = 0.0
            def totalTmp = 0.0
            def result = mostradorService.getProductById(params.id)
            def detail = [id:"",product:"",quantity:"",price:"",total:"",flag:"",image:""]
            if(result.id!=""){
                detail.flag = true
                detail.product = result.product
                detail.id = result.id
                detail.quantity = params.quantity
                detail.image = result.image
                if(result.type=="Pieza"){
                    price = result.salePrice * (1+(result.tax/100))
                    total = price * Float.parseFloat(params.quantity)
                    println "price1: "+price
                    println "total1: "+total
                    detail.price = price
                    detail.total = total
                }
                if(result.type=="Kilogramo"){
                    price = result.salePrice * (1+(result.tax/100))
                    total = price * Float.parseFloat(params.quantity) / 1000
                    println "price2: "+price
                    println "total2: "+total
                    detail.price = price
                    detail.total = total
                }
            }else{
                detail.flag = false
            }
            SaleTransaction saleTran = new SaleTransaction()
            saleTran.idMostrador = session.randomString
            saleTran.product = detail.id
            saleTran.price = price
            saleTran.quantity = Integer.parseInt(params.quantity)
            saleTran.total = total
            saleTran.status = "ACTIVA"
            if(saleTran.save(flush: true)){
                totalTmp = mostradorService.getTotal(session.randomString)
                render(template: "productList2",model: [detail:detail,totalTmp:totalTmp])
            }
        }
    }

    def completeSale(){
        Mostrador most = new Mostrador()
        most.idMostrador = params.randomString
        most.customerId = params.customerSaleId
        most.username = params.username
        most.amount = Float.parseFloat(params.totalVenta)
        most.transactionDate = new Date()
        most.type = "EFECTIVO"
        if (!most.save(flush: true)){
            redirect(action: "create")
        }
        def cambio = Float.parseFloat(params.pago) - Float.parseFloat(params.totalVenta)
        session.randomString = null
        [cambio:cambio,total:params.totalVenta,pago:params.pago]
    }

}
