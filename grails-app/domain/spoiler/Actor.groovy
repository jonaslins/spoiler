package spoiler

import ontology.Core

class Actor extends Person{

    static hasMany = [series: Serie, movies: Movie]

    static belongsTo = [Serie, Movie]

    static constraints = {
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Actor", id+"")
    }

}
