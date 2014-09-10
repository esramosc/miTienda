package mitienda

import org.apache.commons.lang.RandomStringUtils

class CreditSaleController {

    def mostradorService
    def initCashService
    def utilsService

    def index() {
        redirect(action: "create")
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

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

        session.randomString =  randomString
        [mostradorInstance: new Mostrador(params)]
    }

    def completeSale(){
        if(session.randomString==null){
            redirect(action: "create")
            return
        }
        Mostrador most = new Mostrador()
        most.idMostrador = params.randomString
        most.customerId = params.customerSaleId
        most.username = params.username
        most.amount = Float.parseFloat(params.totalVenta)
        most.transactionDate = new Date()
        most.type = "CREDITO"
        if (!most.save(flush: true)){
            redirect(action: "create")
        }
        def prods = mostradorService.getSaleProds(session.randomString)
        prods.each {
            def res = mostradorService.updateQuantity(it.product.toString(),it.quantity,session.branchId)
        }
        session.randomString = null
        [total:params.totalVenta]
    }

}
