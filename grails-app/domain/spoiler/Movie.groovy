package spoiler

import ontology.Core

class Movie {

    String name
    Date releaseDate
    Double grade
    String synopsis

    static hasMany = [actors: Actor, directors: Director, genres: Genre]

    static belongsTo = [Director, Genre]

    static constraints = {
        releaseDate nullable: true
        grade nullable: true
        synopsis nullable: true
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Film", id+"")
    }
}
