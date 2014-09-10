package mitienda

import org.springframework.dao.DataIntegrityViolationException

class SupplierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        params.max = Math.min(max ?: 10, 100)
        [supplierInstanceList: Supplier.list(params), supplierInstanceTotal: Supplier.count()]
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        [supplierInstance: new Supplier(params)]
    }

    def save() {
        def supplierInstance = new Supplier(params)
        supplierInstance.validate()
        if(supplierInstance.hasErrors()){
            render(view: "create", model: [supplierInstance: supplierInstance])
            return
        }
        supplierInstance.registerDate = new Date()
        if (!supplierInstance.save(flush: true)) {
            render(view: "create", model: [supplierInstance: supplierInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def show(Long id) {
        def supplierInstance = Supplier.get(id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
            redirect(action: "list")
            return
        }

        [supplierInstance: supplierInstance]
    }

    def edit(Long id) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def supplierInstance = Supplier.get(id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
            redirect(action: "list")
            return
        }

        [supplierInstance: supplierInstance]
    }

    def update(Long id, Long version) {
        def supplierInstance = Supplier.get(id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (supplierInstance.version > version) {
                supplierInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'supplier.label', default: 'Supplier')] as Object[],
                        "Another user has updated this Supplier while you were editing")
                render(view: "edit", model: [supplierInstance: supplierInstance])
                return
            }
        }

        supplierInstance.properties = params

        if (!supplierInstance.save(flush: true)) {
            render(view: "edit", model: [supplierInstance: supplierInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def delete(Long id) {
        def supplierInstance = Supplier.get(id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
            redirect(action: "list")
            return
        }

        try {
            supplierInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
            redirect(action: "show", id: id)
        }
    }
}
