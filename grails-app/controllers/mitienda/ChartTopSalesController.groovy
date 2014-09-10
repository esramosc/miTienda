package mitienda

class ChartTopSalesController {

    def chartTopSalesService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def results = chartTopSalesService.getTodayTopSales(session.username)
        [results:results]
    }

    def create(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def results = chartTopSalesService.getTodayTopSales2(session.username)
        [results:results]
    }

    def indexTopSalesTotal(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }
        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def topSalesTotal(){
        def branchId = params.branchId
        def results = chartTopSalesService.getTopSales(branchId)
        [results:results]
    }

    def indexTopSalesTotal2(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }
        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def topSalesTotal2(){
        def branchId = params.branchId
        def results = chartTopSalesService.getTopSales2(branchId)
        [results:results]
    }

}
