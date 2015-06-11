package spoiler

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

class IndexController {

    def springSecurityService
    def config = SpringSecurityUtils.securityConfig

    def index() {
        //render(view: '/index')
//        if(springSecurityService.isLoggedIn()){
//            render(view: '/index')
//        }else{
//            redirect(controller: 'login')
//        }
        String loginUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        String logoutUrl = "${createLink( controller:'logout')}"

        render view:'/index'
    }
}
