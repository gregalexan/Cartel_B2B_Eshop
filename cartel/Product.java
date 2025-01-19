package cartel;

public class Product {
    
    private int productID;
    private String name;
    private String image;
    private String category;
    private String description;
    private double price;
    private int stock;
    private int rating;
    private String supplier;

    private int quantity; /* How many in the cart */

    /**
     * Full constuctor
     *   
     * @param productID int
     * @param name String
     * @param image String
     * @param category String 
     * @param description String
     * @param price double
     * @param stock int
     * @param rating int
     * @param supplierUsername String
     */
    public Product(int productID, String name,String image, String category, 
            String description, double price, int stock, int rating, String supplierUsername) {
        this.productID = productID;
        this.name = name;
        this.image = image;
        this.category = category;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.rating = rating;
        this.supplier = supplierUsername;
    }

    /* setters & getters */
    public int getProductID() {
        return productID;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setName(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    public void setSupplier(String supplierUsername) {
        this.supplier = supplierUsername;
    }
    public String getSupplier() {
        return this.supplier;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public int getQuantity() {
        return this.quantity;
    }
}
