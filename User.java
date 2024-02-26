package net.fbla.ahs.client;

public class User {
	private String username;
	private String password;
	private String email;
	
	
	public User(String user, String pass, String email) {
		username = user;
		password = pass;
		this.email = email;
	}
	
	public String getUsername() {return username;}
	public String getPassword() {return password;}
	public String getEmail() {return email;}
	
	public void setUsername(String u) {username = u;}
	public void setPassword(String p) {password = p;}
	public void setEmail(String e) {email = e;}
	
}
