package mitienda

import org.springframework.dao.DataIntegrityViolationException

class LoginController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def loginService

    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        def error = ""
        [loginInstance: new Login(params),error:error]
    }

    def save() {
        def loginInstance = new Login(params)
        loginInstance.validate()
        def error = ""
        if(loginInstance.hasErrors()){
            render(view: "create", model: [loginInstance: loginInstance,error:error])
            return
        }
        if(!loginService.isValidUser(loginInstance.name,loginInstance.password)){
            render(view: "create", model: [loginInstance: loginInstance,error:"error"])
            return
        }

        session.auth = "yes"
        session.username = loginInstance.name
        redirect(action: "menu")
    }

    def menu(){
        if(session.auth!="yes"){
            redirect(action: "create")
        }
        UserTransactions userTran = new UserTransactions()
        userTran.username = session.username
        userTran.transactionDesc = "Ingreso al sistema"
        userTran.transactionDate = new Date()
        userTran.save(flush: true)
    }


}
