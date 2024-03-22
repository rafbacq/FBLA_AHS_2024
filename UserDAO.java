package net.fbla.ahs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.fbla.ahs.model.Partner;
import net.fbla.ahs.model.User;

public class UserDAO extends SQLConnection {
	
	private static final String SELECT_USER_SQL = "select * from users where username = ? and password = ? ";
	
	private static final String INSERT_USER_SQL = "INSERT INTO users" + "  (username, password) "
    		+ "VALUES " +" (?, ?);";
	private static final String SELECT_USER_BY_USERNAME = "select * from users where username = ? ;";
	
	private static final String UPDATE_PASSWORD_BY_ID= "UPDATE users SET password = ? where id=?;";
	
    public boolean validate(User user) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try ( 
        	Connection connection = this.getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            
            ResultSet rs = preparedStatement.executeQuery();
            status =  rs.next(); 
            if ( status) 
            	user.setIsadmn(rs.getBoolean(4));             // Retrieve only the isadmin value
            
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
    
    public void insertUser(User user) throws SQLException {
        
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    public boolean isUserInDatabase(String userEmail) throws SQLException {
        
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME)) {
            preparedStatement.setString(1, userEmail);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            return rs.next(); 
            
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false; 
    }
    public List <Integer> getDatabaseIdsByUsername(String username) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List <Integer> userIDs = new ArrayList <>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME);) {
        	preparedStatement.setString(1, username);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                userIDs.add(rs.getInt("id"));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return userIDs;
    }
    
 public boolean updatePassword(String username, String password) throws SQLException {
        
        // try-with-resource statement will auto close the connection.
	    List<Integer> userIDs = this.getDatabaseIdsByUsername(username); 
	    if (userIDs.isEmpty()) return false; 
        try ( Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PASSWORD_BY_ID)) {
            
        	for( int id : userIDs) {
        		preparedStatement.setString(1, password);
        		preparedStatement.setInt(2, id);
        		System.out.println(preparedStatement);
        		preparedStatement.executeUpdate();
        	}
        } catch (SQLException e) {
            printSQLException(e);
        }
        return true; 
    }
}
