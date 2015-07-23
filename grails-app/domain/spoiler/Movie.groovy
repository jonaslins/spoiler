package spoiler

import ontology.OntologyController

class Movie {

    String name
    Date releaseDate
    Double grade
    String synopsis

    def afterInsert() {
        OntologyController core = OntologyController.getInstance()
        core.insertClassInstance("Film", id+"")
    }

    static hasMany = [actors: Actor, directors: Director, genres: Genre]

    static belongsTo = [Director, Genre]

    static constraints = {
        releaseDate nullable: true
        grade nullable: true
        synopsis nullable: true
    }


}
