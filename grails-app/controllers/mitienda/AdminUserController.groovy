package mitienda

import org.springframework.dao.DataIntegrityViolationException

class AdminUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def utilsService
    def adminUserService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results = AdminUser.list(params)
        def adminUserInstanceList = []
        results.each {
            def result = new Expando()
            result.id = it.id
            result.name = it.name
            result.lastname = it.lastname
            result.address = it.address
            result.phone = it.phone
            result.branch = adminUserService.getBranchName(it.branch.toString())
            result.status = it.status
            result.username = it.username
            result.password = it.password
            result.role = adminUserService.getRoleName(it.role.toString())
            adminUserInstanceList.add(result)
        }
        [adminUserInstanceList: adminUserInstanceList, adminUserInstanceTotal: AdminUser.count()]
    }

    def create() {
        def errorFormat = ""
        def roles = Role.list()
        def branches = Branch.list()
        [adminUserInstance: new AdminUser(params),errorFormat:errorFormat,roles:roles,branches:branches]
    }

    def save() {
        def adminUserInstance = new AdminUser(params)
        def errorFormat = ""
        def roles = Role.list()
        def branches = Branch.list()
        adminUserInstance.validate()
        if (adminUserInstance.hasErrors()) {
            render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat,roles: roles,branches:branches])
            return
        }
        def downloadedFile = request.getFile('photo')
        def filename = downloadedFile.getOriginalFilename();
        def extension = filename.substring(filename.lastIndexOf('.'))
        if(extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".PNG" && extension != ".JPG" && extension != ".JPEG" ){
            render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:"El formato del archivo no es permitido",roles:roles,branches:branches])
            return
        }
        def newFileName = new Date().format("yyyy-MM-dd-HH-mm-ss") + extension
        utilsService.uploadFileToFolder(downloadedFile,newFileName,"userPhotos")
        adminUserInstance.photo = newFileName
        adminUserInstance.registerDate = new Date()
        if(!adminUserInstance.save(flush: true)){
            render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat,roles:roles,branches:branches])
            return
        }

        redirect(action: "show", id: adminUserInstance.id)
    }

    def show(Long id) {
        def adminUserInstance = AdminUser.get(id)
        if (!adminUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), id])
            redirect(action: "list")
            return
        }
        def branchName = adminUserService.getBranchName(adminUserInstance.branch)
        def roleName = adminUserService.getRoleName(adminUserInstance.role)
        [adminUserInstance: adminUserInstance,branchName:branchName,roleName:roleName]
    }

    def edit(Long id) {
        def adminUserInstance = AdminUser.get(id)
        def errorFormat = ""
        def roles = Role.list()
        def branches = Branch.list()
        if (!adminUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), id])
            redirect(action: "list")
            return
        }

        [adminUserInstance: adminUserInstance,errorFormat:errorFormat,roles:roles,branches:branches]
    }

    def update(Long id, Long version) {
        def errorFormat = ""
        def roles = Role.list()
        def branches = Branch.list()
        def adminUserInstance = AdminUser.get(id)
        if (!adminUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), id])
            redirect(action: "list")
            return
        }
        def photoTemp = adminUserInstance.photo
        if (version != null) {
            if (adminUserInstance.version > version) {
                adminUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'adminUser.label', default: 'AdminUser')] as Object[],
                          "Another user has updated this AdminUser while you were editing")
                render(view: "edit", model: [adminUserInstance: adminUserInstance,roles:roles,branches:branches])
                return
            }
        }

        adminUserInstance.properties = params
        adminUserInstance.validate()
        if(adminUserInstance.hasErrors()){
            render(view: "edit", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat,roles:roles,branches:branches])
            return
        }
        if(adminUserInstance.photo!=null && adminUserInstance.photo!=""){
            def downloadedFile = request.getFile('photo')
            def filename = downloadedFile.getOriginalFilename();
            def extension = filename.substring(filename.lastIndexOf('.'))
            if(extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".PNG" && extension != ".JPG" && extension != ".JPEG" ){
                render(view: "edit", model: [adminUserInstance: adminUserInstance,errorFormat:"El formato del archivo no es permitido",roles:roles,branches:branches])
                return
            }
            def newFileName = new Date().format("yyyy-MM-dd-HH-mm-ss") + extension
            utilsService.uploadFileToFolder(downloadedFile,newFileName,"userPhotos")
            adminUserInstance.photo = newFileName
        }else{
            adminUserInstance.photo = photoTemp
        }
        if (!adminUserInstance.save(flush: true)) {
            render(view: "edit", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat,roles:roles,branches:branches])
            return
        }

        redirect(action: "show", id: adminUserInstance.id)
    }

}
