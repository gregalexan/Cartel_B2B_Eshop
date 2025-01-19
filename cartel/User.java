package cartel;

public class User {
    private int zip;
    private String name, email,
                ssn, username, 
                password, joined,
                image, city, 
                address, phone;
    /* First Constructor */
    public User(String name, String email, String ssn,
                String username, String password) {
        this.name = name;
        this.email = email;
        this.ssn = ssn;
        this.username = username;
        this.password = password;
        this.image = "images/profile-default.png";
    }
    /* Second Constructor */
    public User(String name, String email, String ssn,
                String username, String password, String phone, 
                String city, String address, int zip, String image, String joined) {
        this.name = name;
        this.email = email;
        this.ssn = ssn;
        this.username = username;
        this.password = password;
        this.image = image;
        this.city = city;
        this.address = address;
        this.phone = phone;
        this.zip = zip;
        this.joined = joined;
    }
    /* Setters and Getters */
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return this.email;
    }
    public String getSSN() {
        return this.ssn;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsername() {
        return this.username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword() {
        return this.password;
    }
    public void setJoined(String joined) {
        this.joined = joined;
    }
    public String getJoined() {
        return this.joined;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public String getImage() {
        return this.image;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getCity() {
        return this.city;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getAddress() {
        return this.address;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getPhone() {
        return this.phone;
    }
    public void setZip(int zip) {
        this.zip = zip;
    }
    public int getZip() {
        return this.zip;
    }
}
