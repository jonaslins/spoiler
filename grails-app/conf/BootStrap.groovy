import spoiler.Role
import spoiler.User
import spoiler.UserRole

class BootStrap {

    def init = { servletContext ->



        def adminRole = Role.findOrSaveWhere(authority: "ROLE_ADMIN")
        def jal3 = User.findOrSaveWhere(username: 'jal3', password: 'admin')
        def ptvsr = User.findOrSaveWhere(username: 'ptvsr', password: 'admin')
        def ftm = User.findOrSaveWhere(username: 'ftm', password: 'admin')

        def users = [jal3, ptvsr, ftm]
        for (def user: users){
            if(!user.authorities.contains(adminRole)){
                UserRole.create(user, adminRole, true)
            }
        }

        assert UserRole.count()==3






    }
    def destroy = {
    }
}
