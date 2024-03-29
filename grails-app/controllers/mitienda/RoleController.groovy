package mitienda

import org.springframework.dao.DataIntegrityViolationException

class RoleController {

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
        [roleInstanceList: Role.list(params), roleInstanceTotal: Role.count()]
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        [roleInstance: new Role(params)]
    }

    def save() {
        def roleInstance = new Role(params)
        roleInstance.validate()
        if(roleInstance.hasErrors()){
            render(view: "create", model: [roleInstance: roleInstance])
            return
        }
        roleInstance.registerDate = new Date()
        if (!roleInstance.save(flush: true)) {
            render(view: "create", model: [roleInstance: roleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
        redirect(action: "show", id: roleInstance.id)
    }

    def show(Long id) {
        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        [roleInstance: roleInstance]
    }

    def edit(Long id) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        [roleInstance: roleInstance]
    }

    def update(Long id, Long version) {
        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (roleInstance.version > version) {
                roleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'role.label', default: 'Role')] as Object[],
                        "Another user has updated this Role while you were editing")
                render(view: "edit", model: [roleInstance: roleInstance])
                return
            }
        }

        roleInstance.properties = params

        if (!roleInstance.save(flush: true)) {
            render(view: "edit", model: [roleInstance: roleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
        redirect(action: "show", id: roleInstance.id)
    }

    def delete(Long id) {
        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        try {
            roleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "show", id: id)
        }
    }
}
