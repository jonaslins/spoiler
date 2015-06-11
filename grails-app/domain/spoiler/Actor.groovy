package spoiler

class Actor extends Person{

    static hasMany = [series: Serie]

    static belongsTo = Serie

    static constraints = {
    }

}
