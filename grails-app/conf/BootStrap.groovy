import spoiler.Role
import spoiler.User
import spoiler.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = Role.findOrSaveWhere(authority: "ROLE_ADMIN")
        def admin = User.findOrSaveWhere(username: 'admin', password: 'admin')

        if(!admin.authorities.contains(adminRole)){
            UserRole.create(admin, adminRole, true)
        }
    }
    def destroy = {
    }
}
