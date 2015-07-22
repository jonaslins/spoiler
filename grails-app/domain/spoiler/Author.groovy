package spoiler

class Author extends Person{

    static hasMany = [movies: Movie]

    static constraints = {
    }
}
