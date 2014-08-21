package mitienda

class MenuTagLib {

    def menuService
    def grailsApplication

    def menu = { attrs ->
        def result = ""
        def role   = attrs?.roleId as int;
        def categories = menuService.getMenuCat(role)
        def subcat = []
        def appName = grailsApplication.metadata['app.name']

        result = "<div id='cssmenu'>"
        result +="<ul><li><a href='/"+appName+"/login'><span>Inicio</span></a></li>"

        categories.each {
            result += "<li class='has-sub'><a href='#'><span>"+it.acc_name+"</span></a>"
            subcat = menuService.getSubmenu((int)it.acc_id,role)
            result += "<ul>"
            subcat.each {
                result += "<li class='has-sub'><A HREf='/"+appName+"/"+it.acc_controller+"/"+it.acc_action+"'><span>"+it.acc_name+"</span></A></li>"
            }
            result += "</ul></li>"
        }

        result +="<li><a href='/"+appName+"/login/logout'><span>Salir</span></a></li></ul>"
        result += "</div>"
        out << result
    }

}
