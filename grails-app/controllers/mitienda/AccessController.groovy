package mitienda

import org.springframework.dao.DataIntegrityViolationException

class AccessController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def accessService
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        params.max = Math.min(max ?: 10, 100)
        [accessInstanceList: Access.list(params), accessInstanceTotal: Access.count()]
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }
        def errorSubcat = ""
        def categories = accessService.getCategories()
        [accessInstance: new Access(params),errorSubcat:errorSubcat,categories:categories]
    }

    def save() {
        def accessInstance = new Access(params)
        def toProceed=true
        def categories=accessService.getCategories()
        def errorSubcat =""

        if (accessInstance.subcategory=="SI")  {
            if (accessInstance.categoryId=="" || accessInstance.categoryId=="null"){
                errorSubcat="ERROR"
                toProceed=false
            }
        }
        accessInstance.validate()
        if (!accessInstance.hasErrors() && toProceed) {
            if(accessInstance.category=="SI" || accessInstance.subcategory=="SI"){
                accessInstance.show = "SI"
            }else{
                accessInstance.show = "NO"
            }
            if(accessInstance.subcategory==""){
                accessInstance.subcategory = "NO"
            }

        }
        if (!accessInstance.save(flush: true)) {
            render(view: "create", model: [accessInstance: accessInstance,errorSubcat:errorSubcat,categories:categories])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'access.label', default: 'Access'), accessInstance.id])
        redirect(action: "show", id: accessInstance.id)
    }

    def show(Long id) {
        def accessInstance = Access.get(id)
        if (!accessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'access.label', default: 'Access'), id])
            redirect(action: "list")
            return
        }

        [accessInstance: accessInstance]
    }

    def edit(Long id) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def accessInstance = Access.get(id)
        if (!accessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'access.label', default: 'Access'), id])
            redirect(action: "list")
            return
        }
        def categories = accessService.getCategories()
        [accessInstance: accessInstance,categories:categories]
    }

    def update(Long id, Long version) {
        def accessInstance = Access.get(id)
        def toProceed = true
        def categories = accessService.getCategories()
        def errorSubcat = ""
        if (!accessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'access.label', default: 'Access'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (accessInstance.version > version) {
                accessInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'access.label', default: 'Access')] as Object[],
                        "Another user has updated this Access while you were editing")
                render(view: "edit", model: [accessInstance: accessInstance])
                return
            }
        }

        accessInstance.properties = params

        if(accessInstance.subcategory=="SI"){
            if(accessInstance.categoryId=="" || accessInstance.categoryId==null){
                errorSubcat = "ERROR"
                toProceed = false
            }
        }
        if(params.subcategory==null)
            accessInstance.subcategory = ""
        if(params.categoryId==null)
            accessInstance.categoryId = ""

        if(accessInstance.category=="SI" || accessInstance.subcategory=="SI"){
            accessInstance.show = "SI"
        }else{
            accessInstance.show = "NO"
        }
        if(accessInstance.subcategory==""){
            accessInstance.subcategory = "NO"
        }

        if (!accessInstance.save(flush: true)) {
            render(view: "edit", model: [accessInstance: accessInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'access.label', default: 'Access'), accessInstance.id])
        redirect(action: "show", id: accessInstance.id)
    }

}
