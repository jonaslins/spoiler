package spoiler

import ontology.Core

class Actor extends Person{

    static hasMany = [series: Serie]

    static belongsTo = Serie

    static constraints = {
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Actor", id+"")
    }

}
