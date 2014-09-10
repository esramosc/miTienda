package mitienda

import org.springframework.dao.DataIntegrityViolationException

class StockBranchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def stockBranchService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def stockBranchInstanceList = StockBranch.list(params)
        def results = []
        stockBranchInstanceList.each {
            def result = new Expando()
            result.id = it.id
            result.branchId = stockBranchService.getBranchName(it.branchId.toString())
            result.productId = stockBranchService.getProdName(it.productId.toString())
            result.quantity = it.quantity
            results.add(result)
        }
        [stockBranchInstanceList: results, stockBranchInstanceTotal: StockBranch.count()]
    }

    def create() {
        def branches = Branch.findAllByStatus("ACTIVA")
        def prodName = ""
        def error = ""
        [stockBranchInstance: new StockBranch(params),branches:branches,prodName:prodName,error:error]
    }

    def save() {
        def stockBranchInstance = new StockBranch(params)
        def branches = Branch.findAllByStatus("ACTIVA")
        def prodName = params.prodName
        def error = ""
        stockBranchInstance.validate()
        if(stockBranchInstance.hasErrors()){
            render(view: "create", model: [stockBranchInstance: stockBranchInstance,branches:branches,prodName:prodName,error:error])
            return
        }
        if(stockBranchService.alreadyExists(stockBranchInstance.branchId, stockBranchInstance.productId)){
            render(view: "create", model: [stockBranchInstance: stockBranchInstance,branches:branches,prodName:prodName,error:"error"])
            return
        }
        if (!stockBranchInstance.save(flush: true)) {
            render(view: "create", model: [stockBranchInstance: stockBranchInstance,branches:branches,prodName:prodName,error:error])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), stockBranchInstance.id])
        redirect(action: "show", id: stockBranchInstance.id)
    }

    def show(Long id) {
        def stockBranchInstance = StockBranch.get(id)
        if (!stockBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), id])
            redirect(action: "list")
            return
        }
        def prodName = stockBranchService.getProdName(stockBranchInstance.productId)
        def branchName = stockBranchService.getBranchName(stockBranchInstance.branchId)
        [stockBranchInstance: stockBranchInstance,prodName:prodName,branchName:branchName]
    }

    def edit(Long id) {
        def stockBranchInstance = StockBranch.get(id)
        def branches = Branch.findAllByStatus("ACTIVA")
        if (!stockBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), id])
            redirect(action: "list")
            return
        }
        def prodName = stockBranchService.getProdName(stockBranchInstance.productId)
        [stockBranchInstance: stockBranchInstance,branches:branches,prodName:prodName]
    }

    def update(Long id, Long version) {
        def stockBranchInstance = StockBranch.get(id)
        def branches = Branch.findAllByStatus("ACTIVA")
        if (!stockBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), id])
            redirect(action: "list")
            return
        }
        def prodName = params.prodName
        if (version != null) {
            if (stockBranchInstance.version > version) {
                stockBranchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'stockBranch.label', default: 'StockBranch')] as Object[],
                        "Another user has updated this StockBranch while you were editing")
                render(view: "edit", model: [stockBranchInstance: stockBranchInstance,branches:branches,prodName:prodName])
                return
            }
        }

        stockBranchInstance.properties = params

        if (!stockBranchInstance.save(flush: true)) {
            render(view: "edit", model: [stockBranchInstance: stockBranchInstance,branches:branches,prodName:prodName])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), stockBranchInstance.id])
        redirect(action: "show", id: stockBranchInstance.id)
    }

    def delete(Long id) {
        def stockBranchInstance = StockBranch.get(id)
        if (!stockBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), id])
            redirect(action: "list")
            return
        }

        try {
            stockBranchInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stockBranch.label', default: 'StockBranch'), id])
            redirect(action: "show", id: id)
        }
    }

    def getProductsByName(){
        def results = stockBranchService.getProdByName(params.name)
        render(template: "products",model: [results:results])
    }

    def searchByDesc(){
        def results = []
        def isEmpty = true
        if(params.description!=""){
            results = stockBranchService.getProdByDesc(params.description)
            isEmpty = false
        }
        println "results: "+results
        render(template: "productsList",model: [results:results,isEmpty:isEmpty])
    }

}
