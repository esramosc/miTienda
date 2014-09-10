package mitienda

import org.springframework.dao.DataIntegrityViolationException

class CreditPaymentsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def mostradorService
    def creditPaymentsService
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        params.max = Math.min(max ?: 10, 100)
        [creditPaymentsInstanceList: CreditPayments.list(params), creditPaymentsInstanceTotal: CreditPayments.count()]
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def customerName = ""
        def error = ""
        [creditPaymentsInstance: new CreditPayments(params),customerName:customerName,error:error]
    }

    def save() {
        def customerName = ""
        def amountDebt = ""
        def error = ""
        customerName = params.customerName
        def creditPaymentsInstance = new CreditPayments(params)
        if(creditPaymentsInstance.payment>creditPaymentsInstance.amount){
            render(view: "create", model: [creditPaymentsInstance: creditPaymentsInstance,customerName:customerName,error:"El pago debe ser menor o igual al monto"])
            return
        }
        creditPaymentsInstance.validate()
        if(creditPaymentsInstance.hasErrors()){
            render(view: "create", model: [creditPaymentsInstance: creditPaymentsInstance,customerName:customerName,error:error])
            return
        }
        creditPaymentsInstance.username = session.username
        creditPaymentsInstance.tranDate = new Date()
        if (!creditPaymentsInstance.save(flush: true)) {
            render(view: "create", model: [creditPaymentsInstance: creditPaymentsInstance,customerName:customerName,error:error])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), creditPaymentsInstance.id])
        redirect(action: "show", id: creditPaymentsInstance.id)
    }

    def show(Long id) {
        def creditPaymentsInstance = CreditPayments.get(id)
        if (!creditPaymentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), id])
            redirect(action: "list")
            return
        }
        def customerName = creditPaymentsService.getCustomerName(creditPaymentsInstance.customerId.toString())
        [creditPaymentsInstance: creditPaymentsInstance,customerName:customerName]
    }

    def edit(Long id) {
        def creditPaymentsInstance = CreditPayments.get(id)
        if (!creditPaymentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), id])
            redirect(action: "list")
            return
        }

        [creditPaymentsInstance: creditPaymentsInstance]
    }

    def update(Long id, Long version) {
        def creditPaymentsInstance = CreditPayments.get(id)
        if (!creditPaymentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (creditPaymentsInstance.version > version) {
                creditPaymentsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'creditPayments.label', default: 'CreditPayments')] as Object[],
                        "Another user has updated this CreditPayments while you were editing")
                render(view: "edit", model: [creditPaymentsInstance: creditPaymentsInstance])
                return
            }
        }

        creditPaymentsInstance.properties = params

        if (!creditPaymentsInstance.save(flush: true)) {
            render(view: "edit", model: [creditPaymentsInstance: creditPaymentsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), creditPaymentsInstance.id])
        redirect(action: "show", id: creditPaymentsInstance.id)
    }

    def delete(Long id) {
        def creditPaymentsInstance = CreditPayments.get(id)
        if (!creditPaymentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), id])
            redirect(action: "list")
            return
        }

        try {
            creditPaymentsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'creditPayments.label', default: 'CreditPayments'), id])
            redirect(action: "show", id: id)
        }
    }

    def getCustomers(){
        def results = mostradorService.getCustomer(params.name)
        render(template: "customerList",model: [results:results])
    }

    def getDebt(){
        println "params: "+params
        def result = creditPaymentsService.getDebt(params.customerId)
        println "result: "+result
        render(template: "debt",model: [result:result])
    }

}
