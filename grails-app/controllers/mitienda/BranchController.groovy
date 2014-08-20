package mitienda

import org.springframework.dao.DataIntegrityViolationException

class BranchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def branchService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results = Branch.list(params)
        def branchInstanceList = []
        results.each {
            def result = new Expando()
            result.id = it.id
            result.region = branchService.getRegionName(it.region.toString())
            result.branch = it.branch
            result.description = it.description
            result.status = it.status
            result.registerDate = it.registerDate
            branchInstanceList.add(result)
        }

        [branchInstanceList: branchInstanceList, branchInstanceTotal: Branch.count()]
    }

    def create() {
        def regions = Region.list()
        [branchInstance: new Branch(params),regions:regions]
    }

    def save() {
        def branchInstance = new Branch(params)
        def regions = Region.list()
        branchInstance.validate()
        if(branchInstance.hasErrors()){
            render(view: "create", model: [branchInstance: branchInstance,regions:regions])
            return
        }
        branchInstance.registerDate = new Date()
        if (!branchInstance.save(flush: true)) {
            render(view: "create", model: [branchInstance: branchInstance,regions:regions])
            return
        }

        redirect(action: "show", id: branchInstance.id)
    }

    def show(Long id) {
        def branchInstance = Branch.get(id)
        def regionInstance = Region.findById(branchInstance.region)
        if (!branchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'branch.label', default: 'Branch'), id])
            redirect(action: "list")
            return
        }

        [branchInstance: branchInstance,regionInstance:regionInstance]
    }

    def edit(Long id) {
        def branchInstance = Branch.get(id)
        def regions = Region.list()
        if (!branchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'branch.label', default: 'Branch'), id])
            redirect(action: "list")
            return
        }

        [branchInstance: branchInstance,regions:regions]
    }

    def update(Long id, Long version) {
        def branchInstance = Branch.get(id)
        if (!branchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'branch.label', default: 'Branch'), id])
            redirect(action: "list")
            return
        }
        def regions = Region.list()
        if (version != null) {
            if (branchInstance.version > version) {
                branchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'branch.label', default: 'Branch')] as Object[],
                        "Another user has updated this Branch while you were editing")
                render(view: "edit", model: [branchInstance: branchInstance,regions:regions])
                return
            }
        }

        branchInstance.properties = params

        if (!branchInstance.save(flush: true)) {
            render(view: "edit", model: [branchInstance: branchInstance,regions:regions])
            return
        }

        redirect(action: "show", id: branchInstance.id)
    }

    def delete(Long id) {
        def branchInstance = Branch.get(id)
        if (!branchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'branch.label', default: 'Branch'), id])
            redirect(action: "list")
            return
        }

        try {
            branchInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'branch.label', default: 'Branch'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'branch.label', default: 'Branch'), id])
            redirect(action: "show", id: id)
        }
    }
}
