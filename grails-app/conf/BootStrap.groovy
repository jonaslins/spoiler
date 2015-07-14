import spoiler.Actor
import spoiler.Director
import spoiler.Genre
import spoiler.Movie
import spoiler.Role
import spoiler.User
import spoiler.UserRole

class BootStrap {

    def init = { servletContext ->



        def adminRole = Role.findOrSaveWhere(authority: "ROLE_ADMIN")
        def jal3 = User.findOrSaveWhere(username: 'jal3', password: 'admin')
        def ptvsr = User.findOrSaveWhere(username: 'ptvsr', password: 'admin')
        def ftm = User.findOrSaveWhere(username: 'ftm', password: 'admin')

        def users = [jal3, ptvsr, ftm]
        for (def user: users){
            if(!user.authorities.contains(adminRole)){
                UserRole.create(user, adminRole, true)
            }
        }

        assert UserRole.count()==3

        runBDScript()




    }
    def destroy = {
    }


    def runBDScript = {

//        FILME: Batman Begins
//        DIRETOR: Christopher Nolan
//        GENERO: Ação / Aventura
//        CAST:
//        Christian Bale - Bruce Wayne / Batman
//        Michael Caine - Alfred
//        Liam Neeson - Ducard
//        Katie Holmes - Rachel Dawes
//        Gary Oldman - Jim Gordon
//        Cillian Murphy - Dr. Jonathan Crane / Scarecrow
//        Morgan Freeman - Lucius Fox

        def action = Genre.findOrSaveWhere(name: "Ação")
        def adventure = Genre.findOrSaveWhere(name: "Aventura")

        def director = Director.findOrSaveWhere(name: "Christopher Nolan")

        Actor actor0 = Actor.findOrSaveWhere(name: "Christian Bale")
        Actor actor1 = Actor.findOrSaveWhere(name: "Michael Caine")
        Actor actor2 = Actor.findOrSaveWhere(name: "Liam Neeson")

        def movie = Movie.findOrSaveWhere(name: "Batman Begins")
        movie.addToDirectors(director)
        for(def g: [action, adventure]){
            movie.addToGenres(g)
        }

        for(def a: [actor0, actor1, actor2]){
            movie.addToActors(a)
        }

       // movie.addToActors()



    }


}
