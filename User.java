package net.fbla.ahs.model;

import java.io.Serializable;

public class User implements Serializable {
	
	private static final long serialVersionUID = 1; 
	private String username;
	private String password;
	private boolean isadmin; 
	
	
	public User(String user, String pass, boolean admin) {
		username = user;
		password = pass;
		isadmin = admin; 
	}
	
	public String getUsername() {return username;}
	public String getPassword() {return password;}
	public boolean getisadmin() {return isadmin;}
	
	public void setUsername(String u) {username = u;}
	public void setPassword(String p) {password = p;}
	public void setIsadmn(boolean d) {isadmin = d;}
	
}
