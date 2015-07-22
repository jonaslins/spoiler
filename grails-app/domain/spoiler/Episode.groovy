package spoiler

import ontology.Core

class Episode {

    String title
    Integer number
    long duration

    static belongsTo = Movie

    static constraints = {
    }

    def afterInsert() {
        Core core = Core.getInstance();
        core.insertClassInstance("Episode", id+"")
    }
}
