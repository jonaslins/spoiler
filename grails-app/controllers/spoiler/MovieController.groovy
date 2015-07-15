package spoiler

import grails.plugin.springsecurity.annotation.Secured
import ontology.Core

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class MovieController {

   //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def springSecurityService

    def like() {
        def currentUser = springSecurityService.getCurrentUser()
        Core core = Core.getInstance()

        def movie = Movie.findById(params.id)
        def user = User.findById(currentUser.id)
        user.addToLikes(movie)
        user.save(flush: true, failOnError: true)

        core.insertObjectPropertyInstance(currentUser.id+"", "liked", params.id+"")
    }

    def watched() {
        def currentUser = springSecurityService.getCurrentUser()

        def movie = Movie.findById(params.id)
        def user = User.findById(currentUser.id)
        user.addToWatchlist(movie)
        user.save(flush: true, failOnError: true)

        Core core = Core.getInstance()
        core.insertObjectPropertyInstance(currentUser.id+"", "watched", params.id+"")
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Movie.list(params), model: [movieInstanceCount: Movie.count()]
    }

    def show(Movie movieInstance) {
        respond movieInstance
    }

    def create() {
        respond new Movie(params)
    }

    @Transactional
    def save(Movie movieInstance) {
        if (movieInstance == null) {
            notFound()
            return
        }

        if (movieInstance.hasErrors()) {
            respond movieInstance.errors, view: 'create'
            return
        }

        movieInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movie.label', default: 'Movie'), movieInstance.id])
                redirect movieInstance
            }
            '*' { respond movieInstance, [status: CREATED] }
        }
    }

    def edit(Movie movieInstance) {
        respond movieInstance
    }

    @Transactional
    def update(Movie movieInstance) {
        if (movieInstance == null) {
            notFound()
            return
        }

        if (movieInstance.hasErrors()) {
            respond movieInstance.errors, view: 'edit'
            return
        }

        movieInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Movie.label', default: 'Movie'), movieInstance.id])
                redirect movieInstance
            }
            '*' { respond movieInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Movie movieInstance) {

        if (movieInstance == null) {
            notFound()
            return
        }

        movieInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Movie.label', default: 'Movie'), movieInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
