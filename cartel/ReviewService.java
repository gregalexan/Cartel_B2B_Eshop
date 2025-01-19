package cartel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewService {

    /**
     * Returns a list of all the reviews of a curtain
     * product given its id.
     * 
     * @param productId int
     * @return List<Review>
     * @throws Exception
     */
    public List<Review> getProductReviews(int productId) throws Exception {
        
        DButil db = new DButil();
        Connection connection = null;
        String query = "select reviews.username, reviews.review, reviews.stars, user.name, user.image from product, reviews, user where product.productID = reviews.productID and user.username = reviews.username and reviews.productID = ?";
        List<Review> reviews = new ArrayList<>();
        
        try {

            connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, productId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                reviews.add(new Review(rs.getString("review"),
                            rs.getString("name"),
                            productId, rs.getString("image"),
                            rs.getInt("stars")));
            }
            rs.close();
            statement.close();
            db.close();
            return reviews;

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }

        }
    } // end of getProductReviews

    /**
     * Adds a review to the DB once it's posted
     * by a user in the web-app.
     * 
     * @param user User
     * @param stars int
     * @param text String
     * @param productId int
     * @throws Exception
     */
    public void postReview(User user, int stars, String text, int productId) throws Exception {

        DButil db = new DButil();
        Connection connection = null;
        String query = "INSERT INTO reviews (stars, review, productID, username) VALUES (?, ?, ?, ?);";

        try {

            connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, stars);
            statement.setString(2, text);
            statement.setInt(3, productId);
            statement.setString(4, user.getUsername());

            statement.executeUpdate();
            
            statement.close();
            db.close();

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }

        }
    } // end of postReview
}
