package mitienda

class ReportDayResumeController {

    def reportDayResumeService
    def utilsService

    def index() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def initCash = reportDayResumeService.getInitCash(session.username)
        def todaySales = reportDayResumeService.getTodaySales(session.username)
        def todaySalesCredit = reportDayResumeService.getTodaySalesCredit(session.username)
        def cashBuy = reportDayResumeService.getCashBuy(session.username)
        def creditBuy = reportDayResumeService.getCreditBuy(session.username)
        def todayPay = reportDayResumeService.getTodayPayments(session.username)
        def creditPayments = reportDayResumeService.getCreditPayments(session.username)
        [initCash:initCash,todaySales:todaySales,todaySalesCredit:todaySalesCredit,cashBuy:cashBuy,creditBuy:creditBuy,todayPay:todayPay,creditPayments:creditPayments]
    }

    def indexByBranch(){
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def branches = Branch.findAllByStatus("ACTIVA")
        [branches:branches]
    }

    def dayResumeByBranch(){
        def branchId = params.branchId

        def initCash = reportDayResumeService.getInitCashByBranch(branchId)
        def todaySales = reportDayResumeService.getTodaySalesByBranch(branchId)
        def todaySalesCredit = reportDayResumeService.getTodaySalesCreditByBranch(branchId)
        def cashBuy = reportDayResumeService.getCashBuyByBranch(branchId)
        def creditBuy = reportDayResumeService.getCreditBuyByBranch(branchId)
        def todayPay = reportDayResumeService.getTodayPaymentsByBranch(branchId)
        def creditPayments = reportDayResumeService.getCreditPaymentsByBranch(branchId)
        [initCash:initCash,todaySales:todaySales,todaySalesCredit:todaySalesCredit,cashBuy:cashBuy,creditBuy:creditBuy,todayPay:todayPay,creditPayments:creditPayments]
    }

}
