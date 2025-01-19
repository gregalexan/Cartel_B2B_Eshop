package cartel;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.sql.*;

public class ProductService {
    
    /**
     * Returns a list with all products given the search input
     * as a list of keywords or a category from the drop down list.
     * 
     * @param keywords List<String>
     * @param category boolean
     * @return  List<Product>
     * @throws Exception
     */
    public List<Product> viewProducts(List<String> keywords, boolean category) throws Exception {
        
        List<Product> listOfProducts = new ArrayList<>();
        DButil db = new DButil();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
    
        try {
            connection = db.getConnection();
            
            String query;
            if (keywords.size() == 1 && keywords.get(0).equalsIgnoreCase("all")) {
                // Fetch all products
                query = "SELECT * FROM product";
                preparedStatement = connection.prepareStatement(query);
            } else {
                if (category) {
                    query = "SELECT * FROM product WHERE category = ?";
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, keywords.get(0));
                } else {
                    // Build query for keyword search
                    StringBuilder queryBuilder = new StringBuilder("SELECT * FROM product WHERE ");
                    for (int i = 0; i < keywords.size(); i++) {
                        queryBuilder.append("productName LIKE ? OR category LIKE ? OR description LIKE ? ")
                                    .append("OR supplier LIKE ? ");
                        if (i < keywords.size() - 1) {
                            queryBuilder.append("OR ");
                        }
                    }
        
                    query = queryBuilder.toString();
                    preparedStatement = connection.prepareStatement(query);
        
                    // Set parameters for the placeholders
                    int paramIndex = 1;
                    for (String keyword : keywords) {
                        String wildcardKeyword = "%" + keyword + "%"; // Add wildcards for partial matches
                        preparedStatement.setString(paramIndex++, wildcardKeyword); // productName
                        preparedStatement.setString(paramIndex++, wildcardKeyword); // category
                        preparedStatement.setString(paramIndex++, wildcardKeyword); // description
                        preparedStatement.setString(paramIndex++, wildcardKeyword); // supplier
                    }
                }
            }
    
            // Execute the query
            resultSet = preparedStatement.executeQuery();
    
            // Map the result set to Product objects
            while (resultSet.next()) {
                int productId = resultSet.getInt("productID");
                int rating = getProductRating(productId);
                Product product = new Product(
                    resultSet.getInt("productID"),
                    resultSet.getString("productName"),
                    resultSet.getString("image"),
                    resultSet.getString("category"),
                    resultSet.getString("description"),
                    resultSet.getDouble("price"),
                    resultSet.getInt("stock"),
                    rating,
                    resultSet.getString("supplier")
                );
                listOfProducts.add(product);
            }
    
        } catch (Exception e) {

            throw new Exception("Error retrieving products: " + e.getMessage(), e);

        } finally {

            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {

            }

        }
    
        return listOfProducts;
    } // end of viewProducts

    /**
     * Returns a List with all the products
     * of a user based on their username.
     * 
     * @param username String
     * @return List<Product>
     * @throws Exception
     */
    public List<Product> viewMyProducts(String username) throws Exception {
        
        Connection con = null;

        String query = "SELECT * FROM product WHERE supplier = ?;";
        List<Product> myproducts = new ArrayList<>();

        DButil db = new DButil();
        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            ReviewService r = new ReviewService();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                int rating = getProductRating(productId);
                myproducts.add(new Product(productId,
                                        rs.getString("productName"),
                                        rs.getString("image"),
                                        rs.getString("category"),
                                        rs.getString("description"),
                                        rs.getDouble("price"),
                                        rs.getInt("stock"),
                                        rating,
                                        rs.getString("supplier")));
            }
            //close everything to release resources	
			rs.close();
			stmt.close();
			db.close();
			return myproducts;

        } catch (Exception e) {
            
            throw new Exception(e.getMessage());

        } finally {

			try {
				db.close();
			} catch (Exception e) {

            }

        }
    } // end of viewMyProducts

    /**
     * Sorts the products that the user sees based on 
     * a selected sorting type from the drop down list.
     * 
     * @param products List<Product>
     * @param sort String
     * @return List<Product>
     */
    public List<Product> sortProducts(List<Product> products, String sort) {
        
        if (sort.equals("price")) {
            // Sort by price in ascending order
            Collections.sort(products, Comparator.comparingDouble(Product::getPrice));
        } else if (sort.equals("rating")) {
            // Sort by rating in descending order
            Collections.sort(products, Comparator.comparingInt(Product::getRating).reversed());
        }
        return products;
    } // end of sortProducts

    /**
     * Returns a Product object given its id.
     * 
     * @param productId String
     * @return Product
     * @throws Exception
     */
    public Product getProductById(int productId) throws Exception {
        List<String> keywords = new ArrayList<>();
        keywords.add("all");
        try {
            List<Product> allProducts = viewProducts(keywords, false);
            for (Product product : allProducts) {
                if (product.getProductID() == productId) {
                    return product;
                }
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        return null;
    } // end of getProductById

    /**
     * This method inserts a new product in the database
     * based on the elements that the supplier fills in a form.
     * 
     * @param name String
     * @param image String
     * @param categoty String
     * @param price double
     * @param stock int
     * @param description String
     * @param supplier String
     * @throws Exception
     */
    public void addProduct(String name, String image, String categoty, 
                        double price, int stock, String description,
                        String supplier) throws Exception {

        Connection con = null;
        String query = "INSERT INTO product (productName, image, category, price, stock, description, supplier)" 
                    + " VALUES (?, ?, ?, ?, ?, ?, ?);";

        DButil db = new DButil();
        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, image);
            stmt.setString(3, categoty);
            stmt.setDouble(4, price);
            stmt.setInt(5, stock);
            stmt.setString(6, description);
            stmt.setString(7, supplier);
            stmt.executeUpdate();

            stmt.close();
            db.close();
        
        } catch (Exception e) {
            
            throw new Exception(e.getMessage());
        
        } finally {

            try {
				db.close();
			} catch (Exception e) {

            }

        }
    } // end of addProduct

    /**
     * This method deletes a product from the database
     * based on a given product id.
     * 
     * @param productID int
     * @throws Exception
     */
    public void deleteProduct(int productID) throws Exception {

        Connection con = null;
        String query = "DELETE FROM product WHERE productID = ?;";

        DButil db = new DButil();
        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, productID);
            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (SQLException e) {
            
            throw new Exception("Database error: " + e.getMessage());
        
        } catch (Exception e) {
            
            throw new Exception("Error: " + e.getMessage());
        
        } finally {

            try {
				db.close();
			} catch (Exception e) {

            }

        }
    } // end of deleteProduct

    /**
     * This method updates the database when the user
     * edits something in the product's details.
     * 
     * @param productID int
     * @param name String
     * @param price double
     * @param stock int
     * @param description String
     * @throws Exception
     */
    public void updateProductDetails(int productID, String name, double price, int stock, String description) throws Exception {

        Connection con = null;
        String query = "UPDATE product SET productName = ?, price = ?, stock = ?, description = ? WHERE productID = ?;";

        DButil db = new DButil();
        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setDouble(2, price);
            stmt.setInt(3, stock);
            stmt.setString(4, description);
            stmt.setInt(5, productID);
            //even if they haven't changed it doesn't create an exception

            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (SQLException e) {
            
            throw new Exception("Database error: " + e.getMessage());
        
        } catch (Exception e) {
            
            throw new Exception("Error: " + e.getMessage());
        
        } finally {

            try {
				db.close();
			} catch (Exception e) {

            }

        }
    } // end of updateProductDetails

    /**
     * Takes the reviews of a certain product given its id 
     * and calculates the average rating of the product
     * (how many stars it has).
     * 
     * @param productId int
     * @return int
     * @throws Exception
     */
    public int getProductRating(int productId) throws Exception {
        ReviewService rs = new ReviewService();
        int average = 0;
        try {
            List<Review> reviews = rs.getProductReviews(productId);
            int total_stars = 0;
            for (Review review : reviews) {
                total_stars += review.getStars();
            }
            if (reviews.size() > 0) {
                average = (int) Math.ceil(total_stars / reviews.size());
            } else {
                average = 0;
            }
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        }
        return average;
    } // end of getProductRating
}
