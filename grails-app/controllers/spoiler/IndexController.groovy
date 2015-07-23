package spoiler

import grails.plugin.springsecurity.SpringSecurityUtils
import ontology.OntologyController

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
        OntologyController core = OntologyController.getInstance();

        def ids = core.findMovieRecomendations();
        List<Movie> recommendedMovies = new ArrayList<Movie>()
        for (String idStr: ids){
            int id = Integer.parseInt(idStr)
            Movie movie = Movie.findById(id)
            if(movie!=null){
                recommendedMovies.add(movie)
            }
        }
        def args = [recommendedMovies:recommendedMovies]
        if(springSecurityService.isLoggedIn()) {
            def currentUser = springSecurityService.getCurrentUser()
            User user = User.findById(currentUser.id)
            List<Movie> recentLikes = user.likes.toList()
            recentLikes = recentLikes.subList(0, Math.min(4, recentLikes.size()))

            args += [recentLikes:recentLikes]
        }

        render view:"/index", model:  args
    }
}
