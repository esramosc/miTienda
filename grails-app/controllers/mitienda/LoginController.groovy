package mitienda

import org.springframework.dao.DataIntegrityViolationException

class LoginController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def loginService
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        if(session.auth=="yes"){
            redirect(action: "menu")
        }
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
        session.roleId = loginService.getRoleId(loginInstance.name)
        session.auth = "yes"
        session.username = loginInstance.name
        session.branchId = loginService.getBranchId(loginInstance.name)
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
        def day = new Date().format("dd")
        def month = loginService.getMonthInSP(new Date().format("MMMMM"))
        def cashSales = loginService.getCashSales(session.username)
        def creditSales = loginService.getCreditSales(session.username)
        def nameOfUser = loginService.getNameOfUser(session.username)
        def userImage = loginService.getImageOfUser(session.username)
        [day:day,month:month,cashSales:cashSales,creditSales:creditSales,nameOfUser:nameOfUser,userImage:userImage]
    }

    def logout(){
        session.roleId = null
        session.auth = null
        session.username = null
        redirect(uri: "/")
    }

    def denied(){

    }


}
