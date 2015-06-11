package spoiler

class Episode {

    String title
    Integer number
    long duration

    static belongsTo = Serie

    static constraints = {
    }
}
