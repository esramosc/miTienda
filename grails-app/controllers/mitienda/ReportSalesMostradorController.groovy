package mitienda

import org.springframework.dao.DataIntegrityViolationException

import java.util.zip.DataFormatException

class ReportSalesMostradorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def reportSalesMostradorService
    def exportService
    def utilsService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def data = reportSalesMostradorService.getTodaySales(session.username)
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
            exportService.export(params.format, response.outputStream,reportSalesMostradorService.getTodaySales(session.username), fields, labels, formatters, parameters)
        }
    }

    def indexByBranch(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def listByBranch(){
        def branchId = params.branchId

        def data = reportSalesMostradorService.getTodaySalesByBranch(branchId)
        [data:data,branchId:branchId]
    }

    def exportByBranch(){
        def branchId = params.branchId
        if(params?.format && params.format != "html"){
            def today = new Date().format("dd-MM-yyyy_HH-mm-ss")
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=Ventas_del_dia_Por_Sucursal-${today}.${params.extension}")

            List fields = ["username", "customer", "amount", "type", "registerDate", "product", "quantity","price","total"]
            Map labels = ["username": "Usuario", "customer": "Cliente","amount":"Monto Total","type":"Tipo de pago","registerDate":"Fecha de transacción"
                    ,"product":"Producto","quantity":"Cantidad","price":"Precio","total":"Total"]

            Map formatters = [:]
            Map parameters = [:]
            exportService.export(params.format, response.outputStream,reportSalesMostradorService.getTodaySalesByBranch(branchId), fields, labels, formatters, parameters)
        }
    }

}
