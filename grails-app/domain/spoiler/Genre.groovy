package spoiler

class Genre {

    String name

    static hasMany = [movies:Movie]

    static constraints = {
    }
    //TODO
    def afterInsert() {
        //OntologyController core = OntologyController.getInstance();
        //core.insertClassInstance("Episode", id+"")
    }
}
