package mitienda

class ReportCreditPaymentsController {

    def reportCreditPaymentsService
    def exportService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def results = reportCreditPaymentsService.getTodayPayments(session.username)
        [results:results]
    }

    def export(){
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Abonos_a_creditos_del_dia_${today}.${params.extension}")

            List fields = ["customerId", "amount", "payment", "tranDate", "username"]
            Map labels = ["customerId": "Cliente", "amount": "Monto anterior","payment":"Abono", "tranDate":"Fecha de abono",
                    "username":"Usuario"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportCreditPaymentsService.getTodayPayments(session.username), fields, labels, formatters, parameters)
        }
    }

}
