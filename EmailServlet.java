package net.fbla.ahs.controller;

import java.io.IOException;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(sendEmail());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public void sendVerificationEmail(User user) {
		sendEmail(user, "", "");
	}
	
	public void sendPasswordResetEmail(User user) {
		sendEmail(user, "", "");
	}

  //this is the class that was supposed to be used. Below is the one I used for testing
	public boolean sendEmail(User user, String subject, String body) {
		boolean sent = false;
		
		String toEmail = user.getEmail();
		String fromEmail = "atholtonsolutions@gmail.com";
		String password = "1STPLACEFBLA!";
		
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
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
			
			msg.setSubject(subject);
			msg.setText(body);
			
			Transport.send(msg);
			
			sent = true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return sent;
		
	}

  //this is what I was trying to use, it will not work, if you want to implement it look at https://mailtrap.io/blog/sending-email-using-java/, 
  //we need to create a domain before we can continue, maybe something like @atholtonsolutions.com
	public boolean sendEmail() {
		boolean sent = false;
		
		String toEmail = "fignugelmu@gufum.com";
		String fromEmail = "";
		String username = "8b59a63e386e2e";
		String password = "1c1f68a8924ddf";
		
		try {
			Properties props = new Properties();
			props.setProperty("mail.smtp.host", "smtp.mailtrap.io");
			props.setProperty("mail.smtp.port", "587");
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.starttls.enable", "true");
			//props.put("mail.smtp.socketFactory.port", "587");
		//	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			Session session = Session.getInstance(props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromEmail));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
			msg.setSubject("TEST");
			msg.setText("testing");
			
			Transport.send(msg);
			
			sent = true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return sent;
		
	}

}
