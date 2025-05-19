package model.user;

public abstract class User {
    protected String id;
    protected String name;
    protected String email;
    protected String passwordHash;

    public User(String id, String name, String email, String passwordHash) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.passwordHash = passwordHash;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPasswordHash() { return passwordHash; }

    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public abstract String getRole();

    public boolean authenticate(String password) {
        return passwordHash.equals(password); // later use real hashing
    }
}
