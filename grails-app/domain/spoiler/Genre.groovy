package spoiler

class Genre {

    String name

    static hasMany = [series: Serie]

    static constraints = {
    }
}
