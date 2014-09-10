package mitienda

class ReportSalesByCategoryController {

    def reportSalesByCategoryService
    def utilsService

    def indexQuantityByPiece() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def quantityByPiece(){
        def branchId = params.branchId
        def results = reportSalesByCategoryService.getQuantityByPiece(branchId)
        [results:results]
    }

    def indexQuantityByKilo() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def quantityByKilo(){
        def branchId = params.branchId
        def results = reportSalesByCategoryService.getQuantityByKilo(branchId)
        [results:results]
    }

    def indexPriceByPiece(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def priceByPiece(){
        def branchId = params.branchId
        def results = reportSalesByCategoryService.getPriceByPiece(branchId)
        [results:results]
    }

    def indexPriceByKilo(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def priceByKilo(){
        def branchId = params.branchId
        def results = reportSalesByCategoryService.getPriceByKilo(branchId)
        [results:results]
    }

}
