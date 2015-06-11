package spoiler

class Serie {

    String name
    Date releaseDate
    Double grade
    String synopsis

    static hasMany = [actors: Actor, directors: Director, authors: Author, episodes: Episode, genres: Genre]

    static belongsTo = [Director, Genre, Author]

    static constraints = {
    }
}
