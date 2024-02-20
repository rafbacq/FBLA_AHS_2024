package net.fbla.ahs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.fbla.ahs.model.Partner;

public class PartnerDAO {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/atholton_career_tech_ed?allowPublicKeyRetrieval=true&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    
    
    private static final String INSERT_PARTNERS_SQL = "INSERT INTO partners" + "  (contactName, orgName, typOrg, email,phone) "
    		+ "VALUES " +" (?, ?, ?, ?, ?);";

    private static final String SELECT_PARTNER_BY_ID = "select id,contactName,orgName,typOrg,email,phone from partners where id =?";
    private static final String SELECT_ALL_PARTNERS = "select * from partners";
    private static final String DELETE_PARTNERS_SQL = "delete from partners where id = ?;";
    private static final String UPDATE_PARTNERS_SQL = "update partners set contactName= ?, orgName =?, typOrg=?, email=?,phone=? where id = ?;";
    public PartnerDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertPartner(Partner partner) throws SQLException {
        System.out.println(INSERT_PARTNERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PARTNERS_SQL)) {
            preparedStatement.setString(1, partner.getContactName());
            preparedStatement.setString(2, partner.getOrgName());
            preparedStatement.setString(3,  partner.getTypOrg());
            preparedStatement.setString(4,  partner.getContactEmail());
            preparedStatement.setString(5,  partner.getContactPhone());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Partner selectPartner(int id) {
        Partner partner = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PARTNER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("contactName");
                if(name.matches(".*\\d.*"))
                {
                	
                	
                }
                String orgName = rs.getString("orgName");
                String typOrg = rs.getString("typOrg");
                String contactEmail = rs.getString("email");
                if(!contactEmail.contains("@gmail.com")&&
                   !contactEmail.contains("@yahoo.com")&&
                   !contactEmail.contains("@hotmail.com")&&
                   !contactEmail.contains("@icloud.com")&&
                   !contactEmail.contains("@aol.com"))
                {
                	
                	
                }
                String contactPhone = rs.getString("phone");
                if((contactPhone.matches("\\d+")))
                {
                	
                }
                partner = new Partner(id, name, orgName, typOrg, contactEmail, contactPhone);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return partner;
    }

    public List <Partner> selectAllPartners() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List <Partner> partners = new ArrayList <> ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PARTNERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("contactName");
                String orgName = rs.getString("orgName");
                String typOrg = rs.getString("typOrg");
                String contactEmail = rs.getString("email");
                String contactPhone = rs.getString("phone");
                partners.add(new Partner(id, name, orgName, typOrg, contactEmail, contactPhone));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return partners;
    }

    public boolean deletePartner(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_PARTNERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updatePartner(Partner partner) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_PARTNERS_SQL);) {
        	statement.setString(1, partner.getContactName());
            statement.setString(2, partner.getOrgName());
            statement.setString(3,  partner.getTypOrg());
            statement.setString(4,  partner.getContactEmail());
            statement.setString(5,  partner.getContactPhone());
            statement.setInt(6,  partner.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    

}