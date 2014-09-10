package mitienda

import groovy.sql.Sql
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile

class UtilsService {

    def dataSource

    def uploadFileToFolder(MultipartFile file,String name, String directory){
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(directory)
        def storagePathDirectory = new File(storagePath)
        if(!storagePathDirectory.exists()){
            storagePathDirectory.mkdirs()
        }
        file.transferTo(new File("${storagePath}/${name}"))
    }

    def hasPermission(int roleId, String control, String act) {
        def sql = new Sql(dataSource)
        def result = false
        def query = ""
        query = "SELECT 1 FROM permisos WHERE acc = (select acc_id from access WHERE acc_controller = ? and acc_action = ?) AND "
        query += "role = ?"
        sql.eachRow(query,[control,act,roleId]){
            result = true
        }
        return result
    }

}
