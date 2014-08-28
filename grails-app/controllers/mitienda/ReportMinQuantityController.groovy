package mitienda

class ReportMinQuantityController {

    def reportMinQuantityService
    def exportService

    def index() {
        redirect(action: "list")
    }

    def list(){
        def results = reportMinQuantityService.getMinQty()
        [results:results]
    }

    def export(){
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=productos_por_agotarse_${today}.${params.extension}")

            List fields = ["product", "description", "minQuantity", "quantity"]
            Map labels = ["product": "Producto", "description": "Descripción","minQuantity":"Cantidad mínima","quantity":"Cantidad actual"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportMinQuantityService.getMinQty(), fields, labels, formatters, parameters)
        }
    }

}
