package mitienda

class ReportSupplierPaymentsController {

    def reportSupplierPaymentsService
    def exportService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def result = reportSupplierPaymentsService.getPayments(session.username)
        [result:result]
    }

    def export(){
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Pagos_del_dia_${today}.${params.extension}")

            List fields = ["supplierId", "actualAmount", "payment", "amount", "username", "registerDate"]
            Map labels = ["supplierId": "Proveedor", "actualAmount": "Monto anterior","payment":"Pago", "amount":"Monto actual",
                          "username":"Usuario", "registerDate":"Fecha de transacción"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportSupplierPaymentsService.getPayments(session.username), fields, labels, formatters, parameters)
        }
    }

}
