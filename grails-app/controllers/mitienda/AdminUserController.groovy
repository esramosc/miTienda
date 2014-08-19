package mitienda

import org.springframework.dao.DataIntegrityViolationException

class AdminUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def utilsService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [adminUserInstanceList: AdminUser.list(params), adminUserInstanceTotal: AdminUser.count()]
    }

    def create() {
        def errorFormat = ""
        [adminUserInstance: new AdminUser(params),errorFormat:errorFormat]
    }

    def save() {
        def adminUserInstance = new AdminUser(params)
        def errorFormat = ""
        adminUserInstance.validate()
        if (adminUserInstance.hasErrors()) {
            render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat])
            return
        }
        def downloadedFile = request.getFile('photo')
        def filename = downloadedFile.getOriginalFilename();
        def extension = filename.substring(filename.lastIndexOf('.'))
        if(extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".PNG" && extension != ".JPG" && extension != ".JPEG" ){
            render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:"El formato del archivo no es permitido"])
            return
        }
        def newFileName = new Date().format("yyyy-MM-dd-HH-mm-ss") + extension
        utilsService.uploadFileToFolder(downloadedFile,newFileName,"userPhotos")
        adminUserInstance.photo = newFileName
        adminUserInstance.registerDate = new Date()
        if(!adminUserInstance.save(flush: true)){
            render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat])
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

        [adminUserInstance: adminUserInstance]
    }

    def edit(Long id) {
        def adminUserInstance = AdminUser.get(id)
        def errorFormat = ""
        if (!adminUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), id])
            redirect(action: "list")
            return
        }

        [adminUserInstance: adminUserInstance,errorFormat:errorFormat]
    }

    def update(Long id, Long version) {
        def errorFormat = ""
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
                render(view: "edit", model: [adminUserInstance: adminUserInstance])
                return
            }
        }

        adminUserInstance.properties = params
        adminUserInstance.validate()
        if(adminUserInstance.hasErrors()){
            render(view: "edit", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat])
            return
        }
        if(adminUserInstance.photo!=null && adminUserInstance.photo!=""){
            def downloadedFile = request.getFile('photo')
            def filename = downloadedFile.getOriginalFilename();
            def extension = filename.substring(filename.lastIndexOf('.'))
            if(extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".PNG" && extension != ".JPG" && extension != ".JPEG" ){
                render(view: "create", model: [adminUserInstance: adminUserInstance,errorFormat:"El formato del archivo no es permitido"])
                return
            }
            def newFileName = new Date().format("yyyy-MM-dd-HH-mm-ss") + extension
            utilsService.uploadFileToFolder(downloadedFile,newFileName,"userPhotos")
            adminUserInstance.photo = newFileName
        }else{
            adminUserInstance.photo = photoTemp
        }
        if (!adminUserInstance.save(flush: true)) {
            render(view: "edit", model: [adminUserInstance: adminUserInstance,errorFormat:errorFormat])
            return
        }

        redirect(action: "show", id: adminUserInstance.id)
    }

}
