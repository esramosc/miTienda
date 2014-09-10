package mitienda

class ReportCreditsPendingController {

    def reportCreditsPendingService
    def exportService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def create(){
        def amount = 0.0
        def payments = 0.0
        def debt = 0.0
        if(params.branchId==""){
            redirect(action: "index")
            return
        }
        def branchId = params.branchId
        def credits = reportCreditsPendingService.getTotalCredits(branchId)
        def results = []
        credits.each {
            def result = new Expando()
            amount = it.amount
            payments = reportCreditsPendingService.getCreditPayments(it.customerId)
            debt = amount - payments
            result.customer = reportCreditsPendingService.getCustomerName(it.customerId)
            result.amount = amount
            result.payments = payments
            result.debt = debt
            if(debt>0.0)
                results.add(result)
        }
        [results:results,branchId:branchId]
    }

    def export(){
        def amount = 0.0
        def payments = 0.0
        def debt = 0.0
        def branchId = params.branchId
        def credits = reportCreditsPendingService.getTotalCredits(branchId)
        def results = []

        credits.each {
            def result = new Expando()
            amount = it.amount
            payments = reportCreditsPendingService.getCreditPayments(it.customerId)
            debt = amount - payments
            result.customer = reportCreditsPendingService.getCustomerName(it.customerId)
            result.amount = amount
            result.payments = payments
            result.debt = debt
            if(debt>0.0)
                results.add(result)
        }
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Creditos_pendientes_al_${today}.${params.extension}")

            List fields = ["customer", "amount", "payments", "debt"]
            Map labels = ["customer": "Cliente", "amount": "Deuda total","payments":"Abonos", "debt":"Deuda actual"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,results, fields, labels, formatters, parameters)
        }
    }

}
