package cartel;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

public class OrderService {
    
    /**
     * Returns the transaction history of the given user, a list of
     * all the orders that conatain this user's products (income).
     * 
     * @param user User
     * @return List<Order>
     * @throws Exception
     */
    public List<Order> getTransactionHistory(User user) throws Exception {
        List<Order> tranasctions = new ArrayList<>();
        DButil db = new DButil();
        Connection connection = null;
        String query =  "SELECT ordered, status, order_products.productID, quantity " +
                        " FROM orders JOIN order_products ON orders.orderID = order_products.orderID JOIN  " +
                        " product ON order_products.productID = product.productID WHERE supplier = ? ORDER BY ordered DESC;";
        try {
            connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, user.getUsername());
            ResultSet rs = statement.executeQuery();
            ProductService ps = new ProductService();

            while (rs.next()) {
                List<Product> products = new ArrayList<>();
                List<Integer> quanities = new ArrayList<>();            
                Date orderedDate = rs.getDate("ordered");
                String status = rs.getString("status");
                int productId = rs.getInt("productID");
                int quantity = rs.getInt("quantity");
                // Get Product Object by its ID
                Product product = ps.getProductById(productId);

                products.add(product);
                quanities.add(quantity);

                Order order = new Order(orderedDate, status, products, quanities);

                tranasctions.add(order);
            }
            rs.close();
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
        return tranasctions;
    } // end of getTransactionHistory

    /**
     * Returns the order history of the given user, a list of
     * all the orders that this user has made (expences).
     * 
     * @param user User
     * @return List<Order> 
     * @throws Exception
     */
    public List<Order> getMyOrders(User user) throws Exception {
        DButil db = new DButil();
        List<Order> myOrders = new ArrayList<>();
        Connection connection = null;
        String query = "SELECT \n" + //
                       "    orders.orderID, \n" + //
                       "    ordered AS orderedDate, \n" + //
                       "    shipped AS shippedDate, \n" + //
                       "    status, \n" + //
                       "    order_products.productID, \n" + //
                       "    quantity \n" + //
                       "FROM \n" + //
                       "    orders\n" + //
                       "JOIN \n" + //
                       "    order_products ON orders.orderID = order_products.orderID\n" + //
                       "JOIN \n" + //
                       "    product ON order_products.productID = product.productID\n" + //
                       "WHERE \n" + //
                       "    customer = ? \n" + //
                       "ORDER BY \n" + //
                       "    orders.orderID DESC;\n" + //
                       "";
        try {
            connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, user.getUsername());
            ResultSet rs = statement.executeQuery();
    
            ProductService ps = new ProductService();
    
            // Maps to store grouped data
            HashMap<Integer, List<Product>> products = new HashMap<>();
            HashMap<Integer, List<Integer>> quantities = new HashMap<>();
            HashMap<Integer, Object[]> orderDetails = new HashMap<>(); // Stores orderedDate, shippedDate, and status for each orderId
    
            // Process the ResultSet
            while (rs.next()) {
                int orderId = rs.getInt("orderID");
                Date orderedDate = rs.getDate("orderedDate");
                Date shippedDate = rs.getDate("shippedDate");
                String status = rs.getString("status");
                int productId = rs.getInt("productID");
                int quantity = rs.getInt("quantity");
    
                // Get the Product object by productId
                Product product = ps.getProductById(productId);
    
                // Group products by orderId
                products.computeIfAbsent(orderId, k -> new ArrayList<>()).add(product);
    
                // Track quantities for each orderId
                quantities.computeIfAbsent(orderId, k -> new ArrayList<>()).add(quantity);
    
                // Store order details (orderedDate, shippedDate, status)
                if (!orderDetails.containsKey(orderId)) {
                    orderDetails.put(orderId, new Object[]{orderedDate, shippedDate, status});
                }
            }
    
            rs.close();
            statement.close();
            db.close();
    
            // Create Order objects
            for (Integer orderId : products.keySet()) {
                List<Product> productList = products.get(orderId);
                List<Integer> quantityList = quantities.get(orderId);
    
                // Get order details directly from the map
                Object[] details = orderDetails.get(orderId);
                Date orderedDate = (Date) details[0];
                Date shippedDate = (Date) details[1];
                String status = (String) details[2];
    
                // Create Order object
                Order order = new Order(orderId, orderedDate, shippedDate, status, productList, quantityList, user);
                myOrders.add(order); // Add to the final list
            }
    
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                // Ignore
            }

        }
        return myOrders;
    } // end of getMyOrders 

    /**
     * Adds an order in the DB once the user completes a purchase.
     * 
     * @param cart List<Product>
     * @param user User
     * @throws Exception
     */
    public void placeOrder(List<Product> cart, User user) throws Exception {
        DButil db = new DButil();
        Connection connection = null;
        String query = "INSERT INTO Orders (ordered, shipped, status) VALUES (NOW(), NULL, ?)";
        try {
            connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setString(1, "pending");
            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (!generatedKeys.next()) {
                throw new Exception("Failed to retrieve orderID.");
            }
            int orderID = generatedKeys.getInt(1);

            // Insert into Order_Products
            query = "INSERT INTO Order_Products (orderID, productID, quantity, customer) VALUES (?,?,?,?);";
            statement = connection.prepareStatement(query);
            for (Product product : cart) {
                statement.setInt(1, orderID);
                statement.setInt(2, product.getProductID());
                statement.setInt(3, product.getQuantity());
                statement.setString(4, user.getUsername());
                statement.addBatch();
            }
            statement.executeBatch();

            // Update Stock in DB
            query = "UPDATE product SET stock = ? WHERE productID = ?";
            statement = connection.prepareStatement(query);
            for (Product product : cart) {
                statement.setInt(1, product.getStock() - product.getQuantity());
                statement.setInt(2, product.getProductID());
                statement.addBatch();
            }
            statement.executeBatch();

            generatedKeys.close();
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
    } // end of placeOrder

    public List<Order> sortMyOrders(List<Order> orders) {
        orders.sort(new OrderComparator());
        return orders;
    }
}
class OrderComparator implements Comparator<Order> {
    @Override
    public int compare(Order o1, Order o2) {
        return Integer.compare(o2.getOrderId(), o1.getOrderId());
    }
}