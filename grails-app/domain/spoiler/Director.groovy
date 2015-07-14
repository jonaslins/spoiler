package spoiler

import ontology.Core

class Director extends Person{

    static hasMany = [series: Serie]

    static constraints = {
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Director", id+"")
    }
}
