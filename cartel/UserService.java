package cartel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class UserService {
		
	/**
	 * Returns a List with all Users.
	 * 
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {

		Connection con = null;

		String query = "SELECT * FROM user;";
		List<User> users = new ArrayList<User>();

		DButil db = new DButil();
		try {
			
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				users.add(new User(rs.getString("name"),
								rs.getString("email"), 
								rs.getString("ssn"), 
								rs.getString("username"), 
								rs.getString("password"),
								rs.getString("phone"), 
								rs.getString("city"), 
								rs.getString("address"),
                                rs.getInt("zip"),
								rs.getString("image"),
								rs.getString("joined")
                                ));
			}
			// close everything to release resources	
			rs.close();
			stmt.close();

		} catch (Exception e) {

			throw new Exception(e.getMessage());
		
		} finally {
			
			try {
				db.close();
			} catch (Exception e) {

			}

		}
		return users;
	} // end of getUsers

	/**
	 * Returns a User object given a username.
	 * 
	 * @param username String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {
		
		Connection con = null;

		String query = "SELECT * FROM user WHERE username = ?;";

		DButil db = new DButil();
		try {

			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			
			User user = null;
			if (rs.next()) {
				user = new User(rs.getString("name"),
                                rs.getString("email"), 
                                rs.getString("ssn"), 
                                username, 
                                rs.getString("password"),
                                rs.getString("phone"), 
                                rs.getString("city"), 
                                rs.getString("address"),
                                rs.getInt("zip"),
								rs.getString("image"),
								rs.getString("joined")
                                );
			}
			rs.close();
			stmt.close();
			db.close();
			return user;

		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
		
		} finally {
			
			try {
				db.close();
			} catch (Exception e) {

			}

		}
	} // end of findUser

	/**
	 * Is used to authenticate a user,
	 * to check if a user with the given credentials exists.
	 * 
	 * @param username String
	 * @param password String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		
		Connection con = null;

		String query = "SELECT * FROM user WHERE username = ? AND password = ?;";

		DButil db = new DButil();
		try {
			
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			if (!rs.next()) { // credentials are Wrong
				// close everything to release resources	
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong username or password");
			}
			User user = new User(rs.getString("name"),
                                rs.getString("email"), 
                                rs.getString("ssn"), 
                                username, 
                                password,
                                rs.getString("phone"), 
                                rs.getString("city"), 
                                rs.getString("address"),
                                rs.getInt("zip"),
								rs.getString("image"),
								rs.getString("joined")
                                );

			// close everything to release resources	
			rs.close();
			stmt.close();
			db.close();
			return user;
			
		} catch (Exception e) {

			throw new Exception(e.getMessage());
		
		} finally {
			
			try {
				db.close();
			} catch (Exception e) {

			}

		}	
	} // end of authenticate
	
	/**
	 * Registers/creates a new User.
	 * 
	 * @param user User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
			
		Connection con = null;
		// check if user already exists

		String query = "SELECT * FROM user WHERE username = ? OR email = ? OR ssn = ?";

		DButil db = new DButil();
		try {	
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getSSN());			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) { // user found
				// close everything and throw exception
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Sorry, username, email or ssn already registered");
			}
			// user not found -> Insert user into DB

			rs.close(); // don't need the Result Set anymore

			// change the Query
			query = "INSERT INTO user (name, email, ssn, username, password, image, joined) VALUES (?, ?, ?, ?, ?, ?, ?);";
			// change the statement
			stmt = con.prepareStatement(query);

			user.setJoined(LocalDate.now().toString());
			
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getSSN());
			stmt.setString(4, user.getUsername());
			stmt.setString(5, user.getPassword());
			stmt.setString(6, user.getImage());
			stmt.setString(7, user.getJoined());

			// execute update
			stmt.executeUpdate();

			stmt.close();
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
		
		} finally {
			
			try {
				db.close();
			} catch (Exception e) {

			}

		}	
		
	} // end of register

	/**
	 * This method updates a user's details once changed
	 * through the user's profile page.
	 * 
	 * @param ssn String
	 * @param user User
	 * @param phone String
	 * @param city String
	 * @param address String
	 * @param zip int
	 * @throws Exception if encounter with an error
	 */
	public void editProfile(String ssn, User user, String phone, String city, String address, String zip) throws Exception {
		int zipCode = Integer.parseInt(zip);

		DButil db = new DButil();
		Connection connection = null;
		String query = "UPDATE user SET phone = ?, city = ?, address = ?, zip = ? WHERE ssn = ?;";
		try {
			connection = db.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, phone);
			statement.setString(2, city);
			statement.setString(3, address);
			statement.setInt(4, zipCode);
			statement.setString(5, ssn);

			statement.executeUpdate();
			
			statement.close();
			db.close();
			
			// Success
			user.setPhone(phone);
			user.setCity(city);
			user.setAddress(address);
			user.setZip(zipCode);

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
		}
	} // end of editProfile
} // end of class
