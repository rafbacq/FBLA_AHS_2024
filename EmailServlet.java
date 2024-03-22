package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.internet.AddressException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;

import net.fbla.ahs.dao.UserDAO;
import net.fbla.ahs.model.User;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected UserDAO userDAO;
	 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet() {
        super();
        //TODO Auto-generated constructor stub
    }
    public void init() {
        userDAO = new UserDAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println(action);
		System.out.println("Email Servlet is called");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void verifyEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		boolean valid = false;
		
		try{
			valid = testEmail(email);
		}catch(AddressException ae) {
			ae.printStackTrace();
		}
		
	}
	
	protected boolean testEmail(String toEmail) throws AddressException{
		//SEND THE EMAIL RIGHT AWAY INSTEAD
		try{
			InternetAddress internetAddress = new InternetAddress(toEmail);
			internetAddress.validate();
			return true;
		}catch(Exception e) {
			
		}
		 return false;
	}
	
	public boolean sendEmail(String toEmail, String code, String body, String message) {
		boolean sent = false;
		
		String fromEmail = "atholtonsolution@gmail.com";
		//password refers to the app password
		String password ="ypwcrhdepyejnaqb";

		try {
			Properties props = new Properties();
			props.setProperty("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.smtp.port", "587");
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.socketFactory.port", "587");
		    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			Session session = Session.getInstance(props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			});
			
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromEmail));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
			msg.setSubject(body);
			msg.setContent(message, "text/html");
			
			Transport.send(msg);
			System.out.println("email sent");
			sent = true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return sent;
		
	}
	
	public String generateCode() {
		StringBuilder temp = new StringBuilder();
		for(int i = 0; i < 6; i++) {
			int digit = (int)(Math.random()*10); 
			if ( i == 0 && digit == 0 ) digit ++; 
			if ( i == 5 && digit == 0 ) digit ++; 
			
			temp.append(digit);
		}
		
		return temp.toString();
	}

}
