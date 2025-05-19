package model.user;

public class AdminUser extends User {

    public AdminUser(String id, String name, String email, String passwordHash) {
        super(id, name, email, passwordHash);
    }

    @Override
    public String getRole() {
        return "admin";
    }
}
