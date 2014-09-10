package mitienda

class ReportSupplierBuysController {
    def reportSupplierBuysService
    def exportService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def results = reportSupplierBuysService.getBuys(session.username)
        [results:results]
    }

    def export(){
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Compras_del_dia_${today}.${params.extension}")

            List fields = ["supplier", "buyDescription", "buyType", "buyAmount", "username", "buyDate"]
            Map labels = ["supplier": "Proveedor", "buyDescription": "Descripción","buyType":"Tipo de compra", "buyAmount":"Monto",
                    "username":"Usuario", "buyDate":"Fecha de transacción"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportSupplierBuysService.getBuys(session.username), fields, labels, formatters, parameters)
        }
    }

}
