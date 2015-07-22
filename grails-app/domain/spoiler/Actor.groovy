package spoiler

import ontology.Core

class Actor extends Person{

    static hasMany = [movies: Movie]

    static belongsTo = Movie

    static constraints = {
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Actor", id+"")
    }

}
