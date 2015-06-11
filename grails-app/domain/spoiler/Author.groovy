package spoiler

class Author extends Person{

    static hasMany = [series: Serie]

    static constraints = {
    }
}
