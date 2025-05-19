package model.user;

public class RegularUser extends User {

    public RegularUser(String id, String name, String email, String passwordHash) {
        super(id, name, email, passwordHash);
    }

    @Override
    public String getRole() {
        return "regular";
    }
}
