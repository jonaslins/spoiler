package spoiler

class Director extends Person{

    static hasMany = [series: Serie]

    static constraints = {
    }
}
