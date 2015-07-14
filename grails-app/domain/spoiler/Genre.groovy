package spoiler

import ontology.Core

class Genre {

    String name

    static hasMany = [series: Serie, movies:Movie]

    static constraints = {
    }
    //TODO
    def afterInsert() {
        //Core core = Core.getInstance();
        //core.insertClassInstance("Episode", id+"")
    }
}
