package mitienda

import org.springframework.dao.DataIntegrityViolationException

class PermisosController {

    static allowedMethods = [save: "POST", update: "GET", delete: "POST"]
    def permisosService

    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        def roles = permisosService.getRoles()
        def accesos = permisosService.getAccesos()
        def permisos = permisosService.getPermisos()
        [roles: roles, accesos: accesos, rolesSize: roles.size(), permisos: permisos]
    }

    def save() {
        def permisos = []
        def roles = permisosService.getRoles()
        def accesos = permisosService.getAccesos()
        def permisosCount = new Permisos().count()
        def contador = 1
        def buscador = 1
        def contadorPermisos = 0
        while (contador <= permisosCount) {
            def permisosInstance
            def bandera = true

            while (bandera) {
                permisosInstance = new Permisos().get(buscador)
                if (permisosInstance != null) {
                    bandera = false
                }
                buscador++
            }

            def auxiliar = false

            if (permisosInstance.acc != null && permisosInstance.role != null) {
                for (def i : accesos) {
                    def acceso_id = i.acc_id;
                    for (def j : roles) {
                        //buscamos el key de los params
                        def busqueda = "acceso" + acceso_id + "_role" + j.role_id
                        def temporal = params.get(busqueda)
                        if (temporal != null)//separamos de los que no existen
                        {
                            def nueva = temporal.split("_")
                            def acc = Integer.parseInt(nueva[0])
                            def rol = Integer.parseInt(nueva[1])
                            if (Integer.parseInt(permisosInstance.acc) == acc && Integer.parseInt(permisosInstance.role) == rol) {
                                auxiliar = true
                            }//if


                        }//if temporal
                        if (auxiliar)
                            break;

                    } //for roles
                    if (auxiliar)
                        break;

                }//for accesos
                if (!auxiliar) {
                    try {
                        permisos.add("<span><strong>Se eliminó el acceso:</strong> " + permisosService.getAccessDesc(Long.parseLong(permisosInstance.acc)) + ", <strong>del rol:</strong> " + permisosService.getRoleDesc(Long.parseLong(permisosInstance.role))+"</span>")
                        contadorPermisos++
                        permisosInstance.delete(flush: true)
                    }
                    catch (DataIntegrityViolationException e) {

                    }
                }//if


            }
            contador++
        }//fin while
        //fin de eliminar permisos desmarcados

        def permisosCount2 = new Permisos().count()



        for (def i : accesos) {
            def contador2 = 1
            def buscador2 = 1
            def permisosInstance2
            def auxiliar2 = false
            def acceso_id = i.acc_id

            for (def j : roles) {
                def busqueda = "acceso" + acceso_id + "_role" + j.role_id
                def temporal = params.get(busqueda)
                if (temporal != null) {
                    def nueva = temporal.split("_")
                    def acc = Integer.parseInt(nueva[0])
                    def rol = Integer.parseInt(nueva[1])


                    while (contador2 <= permisosCount2) {
                        def bandera = true
                        while (bandera) {
                            permisosInstance2 = new Permisos().get(buscador2)
                            if (permisosInstance2 != null) {
                                bandera = false
                            }
                            buscador2++
                        }//fin while buscador

                        if (Integer.parseInt(permisosInstance2.acc) == acc && Integer.parseInt(permisosInstance2.role) == rol) {
                            auxiliar2 = true
                            //println "encontré coincidencia Acceso: "+acc+" Roles "+ rol
                        } else {
                            auxiliar2 = false
                        }

                        contador2++
                        if (auxiliar2)
                            break;
                    }//fin while contador

                    if (!auxiliar2) {
                        permisosInstance2 = new Permisos()
                        permisosInstance2.acc = acc;
                        permisosInstance2.role = rol;
                        if (permisosInstance2.save(flush: true)) {
                            permisos.add("<strong>Se añadió el acceso:</strong> " + permisosService.getAccessDesc(Long.parseLong(permisosInstance2.acc)) + ", <strong>del rol:</strong> " + permisosService.getRoleDesc(Long.parseLong(permisosInstance2.role)))
                            contadorPermisos++
                        } else {
                            println "error"
                        }


                    }//fin if auxiliar2

                }   //fin del if temporal

            }//fin for roles

        }//fin for accesos

        redirect(action: "update", params: [permisos: permisos, contadorPermisos: contadorPermisos])
    }

    def update() {
        def permisos = params.permisos
        //println "params.contadorPermisos" + params.contadorPermisos
        model: [permisos: permisos, contadorPermisos: params.contadorPermisos]


    }

}
