package mitienda

import org.springframework.dao.DataIntegrityViolationException

class ProductsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def utilsService
    def productsService

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        params.max = Math.min(max ?: 10, 100)
        def results = Products.list(params)
        def productsInstanceList = []
        results.each {
            def result = new Expando()
            result.id = it.id
            result.category = productsService.getCategoryDesc(it.category)
            result.product = it.product
            result.description = it.description
            result.buyPrice = it.buyPrice
            result.salePrice = it.salePrice
            result.tax = it.tax
            result.minQuantity = it.minQuantity
            result.type = it.type
            result.barCode = it.barCode
            result.image = it.image
            result.registerDate = it.registerDate
            productsInstanceList.add(result)
        }
        [productsInstanceList: productsInstanceList, productsInstanceTotal: Products.count()]
    }

    def create() {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def errorFormat = ""
        def categories = Category.list()
        [productsInstance: new Products(params),errorFormat:errorFormat,categories:categories]
    }

    def save() {
        def productsInstance = new Products(params)
        def errorFormat = ""
        def categories = Category.list()
        productsInstance.validate()
        if(productsInstance.hasErrors()){
            render(view: "create", model: [productsInstance: productsInstance,errorFormat:errorFormat,categories:categories])
            return
        }
        if(productsInstance.image!=""){
            def downloadedFile = request.getFile('image')
            def filename = downloadedFile.getOriginalFilename();
            def extension = filename.substring(filename.lastIndexOf('.'))
            if(extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".PNG" && extension != ".JPG" && extension != ".JPEG" ){
                render(view: "create", model: [productsInstance: productsInstance,errorFormat:"El formato del archivo no es permitido",categories:categories])
                return
            }
            def newFileName = new Date().format("yyyy-MM-dd-HH-mm-ss") + extension
            utilsService.uploadFileToFolder(downloadedFile,newFileName,"products")
            productsInstance.image = newFileName
        }else{
            productsInstance.image = "no-photo.jpg"
        }
        productsInstance.registerDate = new Date()
        if (!productsInstance.save(flush: true)) {
            render(view: "create", model: [productsInstance: productsInstance,errorFormat:errorFormat,categories:categories])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'products.label', default: 'Products'), productsInstance.id])
        redirect(action: "show", id: productsInstance.id)
    }

    def show(Long id) {
        def productsInstance = Products.get(id)
        if (!productsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'products.label', default: 'Products'), id])
            redirect(action: "list")
            return
        }
        def categoryDesc = productsService.getCategoryDesc(productsInstance.category)
        [productsInstance: productsInstance,categoryDesc:categoryDesc]
    }

    def edit(Long id) {
        if (!utilsService.hasPermission(Integer.parseInt(session.roleId.toString()), params.controller, params.action)) { // Verificar si el usuario tiene permiso a esta accion.
            redirect(controller: 'login', action: 'denied') // Redirigir a la pagina de acceso denegado.
        }

        def productsInstance = Products.get(id)
        def categories = Category.list()
        if (!productsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'products.label', default: 'Products'), id])
            redirect(action: "list")
            return
        }

        [productsInstance: productsInstance,categories:categories]
    }

    def update(Long id, Long version) {
        def productsInstance = Products.get(id)
        def categories = Category.list()
        if (!productsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'products.label', default: 'Products'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productsInstance.version > version) {
                productsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'products.label', default: 'Products')] as Object[],
                        "Another user has updated this Products while you were editing")
                render(view: "edit", model: [productsInstance: productsInstance,categories:categories])
                return
            }
        }
        def ActImage = productsInstance.image
        productsInstance.properties = params
        productsInstance.validate()
        if(productsInstance.hasErrors()){
            render(view: "edit", model: [productsInstance: productsInstance,categories:categories])
            return
        }

        if(productsInstance.image!=""){
            def downloadedFile = request.getFile('image')
            def filename = downloadedFile.getOriginalFilename();
            def extension = filename.substring(filename.lastIndexOf('.'))
            if(extension != ".png" && extension != ".jpg" && extension != ".jpeg" && extension != ".PNG" && extension != ".JPG" && extension != ".JPEG" ){
                render(view: "edit", model: [productsInstance: productsInstance,errorFormat:"El formato del archivo no es permitido",categories:categories])
                return
            }
            def newFileName = new Date().format("yyyy-MM-dd-HH-mm-ss") + extension
            utilsService.uploadFileToFolder(downloadedFile,newFileName,"products")
            productsInstance.image = newFileName
        }else{
            productsInstance.image = ActImage
        }

        if (!productsInstance.save(flush: true)) {
            render(view: "edit", model: [productsInstance: productsInstance,categories:categories])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'products.label', default: 'Products'), productsInstance.id])
        redirect(action: "show", id: productsInstance.id)
    }

    def delete(Long id) {
        def productsInstance = Products.get(id)
        if (!productsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'products.label', default: 'Products'), id])
            redirect(action: "list")
            return
        }

        try {
            productsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'products.label', default: 'Products'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'products.label', default: 'Products'), id])
            redirect(action: "show", id: id)
        }
    }

    def searchByDesc(){
        def results = []
        def isEmpty = true
        if(params.description!=""){
            results = productsService.getProdByDesc(params.description)
            isEmpty = false
        }

        render(template: "products",model: [results:results,isEmpty:isEmpty])
    }

}
