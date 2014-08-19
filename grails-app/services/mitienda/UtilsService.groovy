package mitienda

import groovy.sql.Sql
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile

class UtilsService {

    def uploadFileToFolder(MultipartFile file,String name, String directory){
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(directory)
        def storagePathDirectory = new File(storagePath)
        if(!storagePathDirectory.exists()){
            storagePathDirectory.mkdirs()
        }
        file.transferTo(new File("${storagePath}/${name}"))
    }

}
