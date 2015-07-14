package spoiler

import ontology.Core

class Director extends Person{

    static hasMany = [series: Serie, movies: Movie]

    static constraints = {
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Director", id+"")
    }
}