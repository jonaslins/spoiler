package spoiler

import ontology.OntologyController

class Actor extends Person{

    static hasMany = [movies: Movie]

    def afterInsert() {
        OntologyController core = OntologyController.getInstance()
        core.insertClassInstance("Actor", id+"")
    }

    static belongsTo = Movie

    static constraints = {
    }



}
