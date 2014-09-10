package mitienda

import org.springframework.dao.DataIntegrityViolationException

class InitCashController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def initCashService
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        if(initCashService.alreadyOpen(session.username)){
            redirect(action: "show",params: [message:"La caja ya ha sido aperturada por el usuario: "+session.username])
            return
        }
        [initCashInstance: new InitCash(params)]
    }

    def save() {
        def initCashInstance = new InitCash(params)
        initCashInstance.validate()
        if(initCashInstance.hasErrors()){
            render(view: "create", model: [initCashInstance: initCashInstance])
            return
        }
        initCashInstance.username = session.username
        initCashInstance.registerDate = new Date()
        if (!initCashInstance.save(flush: true)) {
            render(view: "create", model: [initCashInstance: initCashInstance])
            return
        }

        redirect(action: "show", params: [message:"La caja ha sido aperturada con: \$"+initCashInstance.amount])
    }

    def show(Long id) {
        [message: params.message]
    }

}
