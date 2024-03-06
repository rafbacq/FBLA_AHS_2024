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
import java.util.Properties;


import net.fbla.ahs.client.User;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String verifySubject = "Atholton Solutions: Verify Your Account!";
    String passwordSubject = "Atholton Solutions: Reset Your Password.";
    String verifyPage = "Hello. This is an email test.";
    String passwordPage = "Hello. This is a password test.";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println(action);
		System.out.println("Email Servlet is called");
		
		switch (action) {
			case "/EmailServlet/verify":
				System.out.println("wow");
				sendVerificationEmail(request, response);
				break;
			default:
				System.out.println("i think it worked");
				sendVerificationEmail(request, response);
				break;
		
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	private void sendVerificationEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		System.out.println("Made it to Verification Email");
		String email = request.getParameter("userEmail");
		System.out.println(email);
		boolean passed = false;
			String code = generateCode();
			System.out.println(code);
			passed = sendEmail(email, code, verifySubject, verifyPage);
			
			if(passed) {
				
				request.setAttribute("emailType", "verify");
				request.setAttribute("code", code);
				request.setAttribute("email", email);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("verify-code.jsp");
				dispatcher.forward(request, response);
			}
		
			if(!passed) {
				request.setAttribute("displayInvalidEmail", true);
				RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
				dispatcher.forward(request, response);
			}
			//e.printStackTrace();
		
	}
	
	private void sendPasswordResetEmail(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	private void verifyEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		boolean valid = false;
		
		try{
			valid = testEmail(email);
		}catch(AddressException ae) {
			ae.printStackTrace();
		}
		
	}
	
	
	
	private boolean testEmail(String toEmail) throws AddressException{
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
		String password = "ypwcrhdepyejnaqb";
		
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
			msg.setText(message + " " + code);
			
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
			temp.append((int)(Math.random()*10));
		}
		
		return temp.toString();
	}

}
