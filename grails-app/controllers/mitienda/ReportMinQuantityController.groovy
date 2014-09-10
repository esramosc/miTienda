package mitienda

class ReportMinQuantityController {

    def reportMinQuantityService
    def exportService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def list(){
        def branchId = params.branchId
        def results = reportMinQuantityService.getMinQty(branchId)
        [results:results,branchId:branchId]
    }

    def export(){
        def branchId = params.branchId
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=productos_por_agotarse_${today}.${params.extension}")

            List fields = ["product", "description", "minQuantity", "quantity"]
            Map labels = ["product": "Producto", "description": "Descripción","minQuantity":"Cantidad mínima","quantity":"Cantidad actual"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportMinQuantityService.getMinQty(branchId), fields, labels, formatters, parameters)
        }
    }

}
