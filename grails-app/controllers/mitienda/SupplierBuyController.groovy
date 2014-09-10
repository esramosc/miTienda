package mitienda

import org.springframework.dao.DataIntegrityViolationException

class SupplierBuyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def supplierBuyService
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        [supplierBuyInstance: new SupplierBuy(params)]
    }

    def save() {
        def supplierBuyInstance = new SupplierBuy(params)
        supplierBuyInstance.validate()
        if(supplierBuyInstance.hasErrors()){
            render(view: "create", model: [supplierBuyInstance: supplierBuyInstance])
            return
        }
        supplierBuyInstance.buyDate = new Date()
        if(supplierBuyInstance.buyType=="CONTADO"){
            supplierBuyInstance.status = "PAGADO"
            supplierBuyInstance.actualAmount = 0
        }else{
            supplierBuyInstance.status = "PENDIENTE"
            supplierBuyInstance.actualAmount = supplierBuyInstance.buyAmount
        }
        supplierBuyInstance.username = session.username

        if (!supplierBuyInstance.save(flush: true)) {
            render(view: "create", model: [supplierBuyInstance: supplierBuyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'supplierBuy.label', default: 'SupplierBuy'), supplierBuyInstance.id])
        redirect(action: "show", id: supplierBuyInstance.id)
    }

    def show(Long id) {
        def supplierBuyInstance = SupplierBuy.get(id)
        if (!supplierBuyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "create")
            return
        }
        def supplierName = supplierBuyService.getSupplierName(supplierBuyInstance.supplierId.toString())
        [supplierBuyInstance: supplierBuyInstance,supplierName:supplierName]
    }

    def getSupplier(){
        def results = supplierBuyService.getSupplier(params.name)
        println "results: "+results
        render(template: "supplierList",model: [results:results])
    }

}
