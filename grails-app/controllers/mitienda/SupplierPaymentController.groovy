package mitienda

import org.springframework.dao.DataIntegrityViolationException

class SupplierPaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def supplierBuyService
    def supplierPaymentService
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        params.max = Math.min(max ?: 10, 100)
        [supplierPaymentInstanceList: SupplierPayment.list(params), supplierPaymentInstanceTotal: SupplierPayment.count()]
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        [supplierPaymentInstance: new SupplierPayment(params)]
    }

    def save() {
        def supplierPaymentInstance = new SupplierPayment(params)
        println "params: "+params
        supplierPaymentInstance.validate()
        if(supplierPaymentInstance.hasErrors()){
            redirect(action: "create")
            return
        }
        supplierPaymentInstance.username = session.username
        supplierPaymentInstance.registerDate = new Date()

        if (!supplierPaymentInstance.save(flush: true)) {
            render(view: "create", model: [supplierPaymentInstance: supplierPaymentInstance])
            return
        }
        supplierPaymentService.updateAmount(supplierPaymentInstance.supplierId,supplierPaymentInstance.payment)
        flash.message = message(code: 'default.created.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), supplierPaymentInstance.id])
        redirect(action: "show", id: supplierPaymentInstance.id)
    }

    def show(Long id) {
        def supplierPaymentInstance = SupplierPayment.get(id)
        if (!supplierPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), id])
            redirect(action: "list")
            return
        }
        def supplierName = supplierBuyService.getSupplierName(supplierPaymentInstance.supplierId)
        [supplierPaymentInstance: supplierPaymentInstance,supplierName:supplierName]
    }

    def edit(Long id) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def supplierPaymentInstance = SupplierPayment.get(id)
        if (!supplierPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), id])
            redirect(action: "list")
            return
        }

        [supplierPaymentInstance: supplierPaymentInstance]
    }

    def update(Long id, Long version) {
        def supplierPaymentInstance = SupplierPayment.get(id)
        if (!supplierPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (supplierPaymentInstance.version > version) {
                supplierPaymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'supplierPayment.label', default: 'SupplierPayment')] as Object[],
                        "Another user has updated this SupplierPayment while you were editing")
                render(view: "edit", model: [supplierPaymentInstance: supplierPaymentInstance])
                return
            }
        }

        supplierPaymentInstance.properties = params

        if (!supplierPaymentInstance.save(flush: true)) {
            render(view: "edit", model: [supplierPaymentInstance: supplierPaymentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), supplierPaymentInstance.id])
        redirect(action: "show", id: supplierPaymentInstance.id)
    }

    def delete(Long id) {
        def supplierPaymentInstance = SupplierPayment.get(id)
        if (!supplierPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), id])
            redirect(action: "list")
            return
        }

        try {
            supplierPaymentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supplierPayment.label', default: 'SupplierPayment'), id])
            redirect(action: "show", id: id)
        }
    }

    def getSupplier(){
        def results = supplierBuyService.getSupplier(params.name)
        render(template: "supplierList",model: [results:results])
    }

    def getSupplierData(){
        def amount = supplierPaymentService.getSupplierAmount(params.supplierId,session.branchId)
        render(template: "supplierAmount",model: [amount:amount])
    }

}
