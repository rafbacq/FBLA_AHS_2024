package net.fbla.ahs.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;



import net.fbla.ahs.model.Partner;

public class PartnerDAO {
	
	private String jdbcURL = "jdbc:mysql://127.0.0.1:3306/atholton_career_tech_ed?allowPublicKeyRetrieval=true&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "tasouop1";

    
    
    private static final String INSERT_PARTNERS_SQL = "INSERT INTO partners" + "  (contactName, orgName, typOrg, contactEmail, contactPhone) "
    		+ "VALUES " +" (?, ?, ?, ?, ?);";

    private static final String SELECT_PARTNER_BY_ID = "select id,contactName,orgName,typOrg,contactEmail, contactPhone from partners where id =?";
    private static final String SELECT_ALL_PARTNERS = "select * from partners";
    private static final String DELETE_PARTNERS_SQL = "delete from partners where id = ?;";
    private static final String UPDATE_PARTNERS_SQL = "update partners set contactName= ?, orgName =?, typOrg=?, contactEmail=?, contactPhone=? where id = ?;";
    //String used to create a copy of the table. Index 12 is where the name of the new table should be inserted.
    private static final String COPY_PARTNERS_SQL = "CREATE TABLE AS SELECT id, contactName, orgName, typOrg, contactEmail, contactPhone FROM partners;";
    private static final String SELECT_ALL_PARTNERS_FROM_COPY = "select * from ";
    
    private static final String PASTE_PARTNERS_FROM_TABLE = "INSERT INTO partners SELECT * FROM ";
    private static final String CLEAR_PARTNERS = "DELETE FROM partners";
    
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
    
    public void pasteTable(String table) {
    	table = table.trim();
    	System.out.println("table " + table);
    
    	clearPartners();
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(PASTE_PARTNERS_FROM_TABLE + table.replaceAll(",", "").replaceAll(" ", "_").replace(':', '_') )) {
             System.out.println(preparedStatement);
             preparedStatement.executeUpdate();
         } catch (SQLException e) {
             printSQLException(e);
         }
    }
    
    public void clearPartners() {
    	System.out.println(CLEAR_PARTNERS);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(CLEAR_PARTNERS)) {
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    public void savePartners() {
    	java.util.Date date = new java.util.Date();
    	String name = date.toString().replaceAll(" ", "_").replace(':', '_');
    	System.out.println(name);
    	
    	 try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(COPY_PARTNERS_SQL.substring(0, 13) + name + COPY_PARTNERS_SQL.substring(12))) {
    		 System.out.println(preparedStatement);
             preparedStatement.executeUpdate();
         } catch (SQLException e) {
             printSQLException(e);
         }
    }
    
    public List<String> listAllTables(){
    	LinkedList<String> names = new LinkedList<String>();
    	
    	try {
    		Connection connection = getConnection();

    		DatabaseMetaData md = connection.getMetaData();
    		
    		String[] types = {"TABLE"};
    		ResultSet rs = md.getTables("atholton_career_tech_ed", null, "%", types);
    		
    		System.out.println("listAllTables");
    		
    		rs.next();
    		String original = rs.getString("TABLE_NAME");
    		while (rs.next()) {
    			
    			String time = rs.getString("TABLE_NAME");
					
    		    names.addFirst(timeFormat(time));
    		}
    		
    		names.addFirst(original);
    		
    		
            } catch (SQLException e) {
                printSQLException(e);
            }
    	
    	return names;
    }
    
    public String timeFormat(String time) {
    	
    	time = time.replaceAll("_", " ");
	    time = time.substring(0, 3) + "," + time.substring(3, 13) + ":" + time.substring(14, 16) + ":" + time.substring(17).toUpperCase();
	    
	    return time;
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
                String contactEmail = rs.getString("contactEmail");
                if(!contactEmail.contains("@gmail.com")&&
                   !contactEmail.contains("@yahoo.com")&&
                   !contactEmail.contains("@hotmail.com")&&
                   !contactEmail.contains("@icloud.com")&&
                   !contactEmail.contains("@aol.com"))
                {
                	
                	
                }
                String contactPhone = rs.getString("contactPhone");
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
    	
    public List<Partner> selectAllPartners(String table){
    	  // using try-with-resources to avoid closing resources (boiler plate code)
        List <Partner> partners = new ArrayList <> ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PARTNERS_FROM_COPY + table);) {
            System.out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	System.out.println("Result set");
                int id = rs.getInt("id");
                String name = rs.getString("contactName");
                String orgName = rs.getString("orgName");
                String typOrg = rs.getString("typOrg");
                String contactEmail = rs.getString("contactEmail");
                String contactPhone = rs.getString("contactPhone");
                partners.add(new Partner(id, name, orgName, typOrg, contactEmail, contactPhone));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return partners;
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
                String contactEmail = rs.getString("contactEmail");
                String contactPhone = rs.getString("contactPhone");
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
