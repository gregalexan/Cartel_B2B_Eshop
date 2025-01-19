package cartel;

public class Review {
    private String review;
    private String companyName;
    private String companyImage;
    private int productID;
    private int stars;

    /* Constructor */
    public Review(String review, String companyName, int productID, String companyImage, int stars) {
        this.productID = productID;
        this.review = review;
        this.companyName = companyName;
        this.companyImage = companyImage;
        this.stars = stars;
    }    
    /* Setters & Getters */
    public void setReview(String review) {
        this.review = review;
    }
    public String getReview() {
        return this.review;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    public String getCompanyName() {
        return this.companyName;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public int getProductID() {
        return this.productID;
    }
    public void setCompanyImage(String companyImage) {
        this.companyImage = companyImage;
    }
    public String getCompanyImage() {
        return this.companyImage;
    }
    public int getStars() {
        return this.stars;
    }
}
