package cartel;

import java.util.Date;
import java.util.List;

public class Order {
    private int orderId;
    private Date orderedDate, shippedDate;
    private String status;
    private List<Product> products;
    private List<Integer> quantities;
    
    private User user; /* Customer */

    // Constructor
    public Order(int orderId, Date orderedDate, Date shippedDate, String status, List<Product> products, List<Integer> quantities, User user) {
        this.orderedDate = orderedDate;
        this.shippedDate = shippedDate;
        this.products = products;
        this.quantities = quantities;
        this.user = user;
        this.orderId = orderId;
        this.status = status;
    }
    public Order(Date orderedDate, Date shippedDate, List<Product> products, List<Integer> quantities, User user) {
        this.orderedDate = orderedDate;
        this.shippedDate = shippedDate;
        this.products = products;
        this.quantities = quantities;
        this.user = user;
    }
    /* For Transaction History */
    public Order(Date orderedDate, String status, List<Product> products, List<Integer> quantities) {
        this.orderedDate = orderedDate;
        this.products = products;
        this.quantities = quantities;
        this.status = status;
    }
    /* Setters and Getters */
    public void setOrderId(int id) {
        this.orderId = id;
    }
    public int getOrderId() {
        return this.orderId;
    }
    public void setShippedDate(Date date) {
        this.shippedDate = date;
    }
    public Date getShippedDate() {
        return this.shippedDate;
    }
    public void setOrderedDate(Date date) {
        this.orderedDate = date;
    }
    public Date getOrderedDate() {
        return this.orderedDate;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getStatus() {
        return this.status;
    }
    public List<Product> getProducts() {
        return this.products;
    }
    public List<Integer> getQuantities() {
        return this.quantities;
    }

    /* ---------- FOR TRANSACTION HISTORY ---------- */

    /**
     * Returns the first product of this order.
     * @return Product
     */
    public Product getProductForTransactionHistory() {
        return this.products.get(0);
    }

    /**
     * Returns how many of the first product was ordered.
     * @return int
     */
    public int getQuantityForTransactionHistory() {
        return this.quantities.get(0);
    }

    /**
     * Returns the total value of this order.
     * @return double
     */
    public double getTotal() {
        double total = 0;
        for (int i = 0; i < products.size(); i++) {
            total += products.get(i).getPrice() * quantities.get(i);
        }
        return Math.round(total * 24 / 100.0) + total;
    }
}
