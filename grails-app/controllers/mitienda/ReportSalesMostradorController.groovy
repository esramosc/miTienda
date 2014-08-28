package mitienda

import org.springframework.dao.DataIntegrityViolationException

import java.util.zip.DataFormatException

class ReportSalesMostradorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def reportSalesMostradorService
    def exportService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def data = reportSalesMostradorService.getTodaySales()
        [data:data]
    }

    def export(){
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Ventas_del_dia_${today}.${params.extension}")

            List fields = ["username", "customer", "amount", "type", "registerDate", "product", "quantity","price","total"]
            Map labels = ["username": "Usuario", "customer": "Cliente","amount":"Monto Total","type":"Tipo de pago","registerDate":"Fecha de transacción"
                    ,"product":"Producto","quantity":"Cantidad","price":"Precio","total":"Total"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportSalesMostradorService.getTodaySales(), fields, labels, formatters, parameters)
        }
    }

}
