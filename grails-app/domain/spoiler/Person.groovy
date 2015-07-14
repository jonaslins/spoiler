package spoiler

class Person {

    String name
    String information
    Date birthday

    static constraints = {
        name nullable: false
        birthday nullable: true
        information nullable: true
    }

    static mapping = {
        tablePerHierarchy false
    }

}
