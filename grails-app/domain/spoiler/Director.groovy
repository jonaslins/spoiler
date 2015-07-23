package spoiler

import ontology.OntologyController

class Director extends Person{

    static hasMany = [movies: Movie]

    static constraints = {
    }

    def afterInsert() {
        OntologyController core = OntologyController.getInstance();
        core.insertClassInstance("Director", id+"")
    }
}