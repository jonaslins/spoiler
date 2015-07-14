import ontology.Core
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

        def movies = [

                [
                        name: "Batman Begins",
                        directors: ["Christopher Nolan"],
                        genres:
                                ["Ação","Aventura"],
                        cast: ["Christian Bale",
                               "Michael Caine",
                               "Liam Neeson",
                               "Katie Holmes",
                               "Gary Oldman",
                               "Cillian Murphy",
                               "Morgan Freeman"]
                ]

                ,
                [
                        name: "Batman: O Cavaleiro das Trevas",
                        directors: ["Christopher Nolan"],
                        genres:
                                ["Ação","Crime","Drama"],
                        cast: ["Christian Bale",
                               "Heath Ledger",
                               "Aaron Eckhart",
                               "Michael Caine",
                               "Maggie Gyllenhal",
                               "Gary Oldman",
                               "Cillian Murphy",
                               "Morgan Freeman"]
                ]
                ,
                [
                        name: "Clube da Luta",
                        directors: ["David Fincher"],
                        genres:
                                ["Drama"],
                        cast: ["Edward Norton",
                               "Brad Pitt",
                               "Helena Bonham Carter",
                               "Meat Loaf"]
                ]
                ,
                [
                        name: "O Senhor dos Anéis: A Sociedade do Anel",
                        directors: ["Peter Jackson"],
                        genres:
                                ["Aventura","Fantasia"],
                        cast: ["Elijah Wood",
                               "Ian McKellen",
                               "Sean Astin",
                               "Viggo Mortensen",
                               "Orlando Bloom",
                               "John Rhys-Davies",
                               "Sean Bean",
                               "Cate Blanchet",
                               "Christopher Lee",
                               "Andy Serkis",
                               "Billy Boyd",
                               "Dominic Monaghan",
                               "Liv Tyler",
                               "Hugo Weaving"]
                ]
                ,
                [
                        name: "O Senhor dos Anéis: As Duas Torres",
                        directors: ["Peter Jackson"],
                        genres:
                                ["Aventura","Fantasia"],
                        cast: ["Elijah Wood",
                               "Ian McKellen",
                               "Sean Astin",
                               "Viggo Mortensen",
                               "Orlando Bloom",
                               "John Rhys-Davies",
                               "Cate Blanchet",
                               "Christopher Lee",
                               "Bernard Hill",
                               "Miranda Otto",
                               "David Wenham",
                               "Andy Serkis",
                               "Billy Boyd",
                               "Dominic Monaghan",
                               "Liv Tyler",
                               "Hugo Weaving"]
                ]
                ,
                [
                        name: "Seven: Os Sete Crimes Capitais",
                        directors: ["David Fincher"],
                        genres:
                                ["Drama","Mistério","Thriller"],
                        cast: ["Morgan Freeman",
                               "Brad Pitt",
                               "Gwyneth Paltrow",
                               "Kevin Spacey"]
                ]
                ,
                [
                        name: "O Silêncio dos Inocentes",
                        directors: ["Jonathan Demme"],
                        genres:
                                ["Drama","Mistério","Thriller"],
                        cast: ["Jodie Foster",
                               "Anthony Hopkins",
                               "Scott Glenn",
                               "Anthony Heald",
                               "Ted Levine"]
                ]
                ,
                [
                        name: "Os Bons Companheiros",
                        directors: ["Martin Scorcese"],
                        genres:
                                ["Biografia","Crime","Drama"],
                        cast: ["Robert De Niro",
                               "Ray Liotta",
                               "Joe Pesci",
                               "Lorraine Bracco",
                               "Paul Sorvino",
                               "Frank Sivero",
                               "Tony Darrow"]
                ]
                ,
                [
                        name: "Brilho Eterno de uma Mente Sem Lembranças",
                        directors: ["Michael Gondry"],
                        genres:
                                ["Drama","Romance","Sci-Fi"],
                        cast: ["Jim Carrey",
                               "Kate Winslet",
                               "Elijah Wood",
                               "Thomas Jay Ryan",
                               "Mark Ruffalo",
                               "Jane Adams",
                               "David Cross",
                               "Kirsten Dunst",
                               "Tom Wilkinson"]
                ]
                ,
                [
                        name: "O Rei Leão",
                        directors: ["Roger Allers","Rob Minkoff"],
                        genres:
                                ["Animação","Aventura","Drama"],
                        cast: ["Jonathan Taylor Thomas",
                               "Matthew Broderick",
                               "James Earl Jones",
                               "Jim Cummings",
                               "Jeremy Irons",
                               "Niketa Calame",
                               "Moira Kelly",
                               "Ernie Sabella",
                               "Nathan Lane"]
                ]
                ,
                [
                        name: "Toy Story",
                        directors: ["John Lasseter"],
                        genres:
                                ["Animação","Aventura","Comédia"],
                        cast: ["Tom Hanks",
                               "Tim Allen",
                               "Don Rickles",
                               "Jim Varney",
                               "Wallace Shawn",
                               "John Ratzenberger",
                               "Annie Potts",
                               "John Morris",
                               "Erik von Detten"]
                ]
                ,
                [
                        name: "Matrix",
                        directors: ["The Wachowski Brothers"],
                        genres:
                                ["Ação","Sci-Fi"],
                        cast: ["Keanu Reeves",
                               "Laurence Fishburne",
                               "Carrie-Anne Moss",
                               "Hugo Weaving",
                               "Gloria Foster"]
                ]
                ,
                [
                        name: "O Virgem de 40 Anos",
                        directors: ["Judd Apatow"],
                        genres:
                                ["Comédia","Romance"],
                        cast: ["Steve Carell",
                               "Catherine Keener",
                               "Paul Rudd",
                               "Romany Malco",
                               "Seth Rogen",
                               "Elizabeth Banks",
                               "Leslie Mann",
                               "Jane Lynch"]
                ]
                ,
                [
                        name: "Superbad: É Hoje",
                        directors: ["Greg Mottola"],
                        genres:
                                ["Comédia"],
                        cast: ["Joanh Hill",
                               "Michael Cera",
                               "Christopher Mintz-Plasse",
                               "Bill Hader",
                               "Seth Rogen",
                               "Emma Stone"]
                ]
                ,
                [
                        name: "Guerra nas Estrelas",
                        directors: ["George Lucas"],
                        genres:
                                ["Ação","Aventura","Fantasia"],
                        cast: ["Mark Hamill",
                               "HArrison Ford",
                               "Carrie Fisher",
                               "Alec Guiness",
                               "Anthony Daniels",
                               "Kenny Baker R2-D2",
                               "Peter Mayhew",
                               "David Prowse",
                               "Peter Cushing"]
                ]
                ,
                [
                        name: "Os 12 Macacos",
                        directors: ["Terry Gilliam"],
                        genres:
                                ["Mistério","Sci-Fi","Thriller"],
                        cast: ["Bruce Willis",
                               "Madeleine Stowe",
                               "Brad Pitt"]
                ]
                ,
                [
                        name: "The Avengers: Os Vingadores",
                        directors: ["Joss Whedon"],
                        genres:
                                ["Ação","Aventura","Sci-Fi"],
                        cast: ["Robert Downey Jr.",
                               "Chris Evans",
                               "Mark Ruffalo",
                               "Chris Hemsworth",
                               "Scarlett Johansson",
                               "Jeremy Renner",
                               "Tom Hiddleston",
                               "Clark Gregg",
                               "Cobie Smulders",
                               "Stellan Skarsgård",
                               "Samuel L. Jackson",
                               "Gwyneth Paltrow",
                               "Paul Bettany"]
                ]
                ,
                [
                        name: "Guardiões da Galáxia",
                        directors: ["James Gunn"],
                        genres:
                                ["Ação","Aventura","Sci-Fi"],
                        cast: ["Chris Pratt",
                               "Zoe Saldana",
                               "Dave Bautista",
                               "Vin Diesel",
                               "Bradley Cooper",
                               "Lee Pace",
                               "Michael Rooker",
                               "Karen Gillan"]
                ]
                ,
                [
                        name: "Alien, o Oitavo Passageiro",
                        directors: ["Ridley Scott"],
                        genres:
                                ["Sci-Fi", "Terror"],
                        cast: ["Tom Skerritt",
                               "Sigourney Weaver",
                               "Veronica Cartwright",
                               "Harry Dean Stanton",
                               "John Hurt",
                               "Ian Holm",
                               "Yaphet Kotto",
                               "Bolaji Badejo"]
                ]
                ,
                [
                        name: "Invocação do Mal",
                        directors: ["James Wan"],
                        genres:
                                ["Terror"],
                        cast: ["Vera Farmiga",
                               "Patrick Wilson",
                               "Lili Taylor",
                               "Ron Livingston",
                               "Shanley Caswell",
                               "Hayley McFarland",
                               "Joey King",
                               "Mackenzie Foy",
                               "Kyla Deaver",
                               "Shannon Kook",
                               "John Brotherton",
                               "Sterling Jerins"]
                ]

        ];
        Core core = Core.getInstance();

        for (def movieMap: movies){
            def movie = Movie.findOrSaveWhere(name: movieMap["name"])

            for(def directorName: movieMap["directors"]){
                def director = Director.findOrSaveWhere(name: directorName)
                movie.addToDirectors(director)
                core.insertObjectPropertyInstance(director.id+"", "directed", movie.id+"")
            }

            for(def genreName: movieMap["genres"]){
                def genre = Genre.findOrSaveWhere(name: genreName)
                movie.addToGenres(genre)

            }

            for(def actorName: movieMap["cast"]){
                def actor = Actor.findOrSaveWhere(name: actorName)
                movie.addToActors(actor)
                core.insertObjectPropertyInstance(actor.id+"", "actedIn", movie.id+"")
            }

        }

//        def action = Genre.findOrSaveWhere(name: "Ação")
//        def adventure = Genre.findOrSaveWhere(name: "Aventura")
//        assert Genre.count()==2
//
//        def director = Director.findOrSaveWhere(name: "Christopher Nolan")
//        assert Director.count()==1
//
//        def actor0 = Actor.findOrSaveWhere(name: "Christian Bale")
//        def actor1 = Actor.findOrSaveWhere(name: "Michael Caine")
//        def actor2 = Actor.findOrSaveWhere(name: "Liam Neeson")
//        assert Actor.count()==3
//
//        def movie = Movie.findOrSaveWhere(name: "Batman Begins")
//        assert Movie.count()==1
//
//        movie.addToDirectors(director)
//
//        core.insertObjectPropertyInstance(director.id+"", "directed", movie.id+"")
//        for(def g: [action, adventure]){
//            movie.addToGenres(g)
//        }
//        for(def a: [actor0, actor1, actor2]){
//            movie.addToActors(a)
//            core.insertObjectPropertyInstance(a.id+"", "actedIn", movie.id+"")
//        }

    }


}
