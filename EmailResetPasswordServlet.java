package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmailServlet-forgot-password")
public class EmailResetPasswordServlet extends EmailServlet {
	
	private static final long serialVersionUID = 1L;
	String passwordSubject = "Atholton Solutions: Reset Your Password.";
    
    String passwordPage = "<!DOCTYPE html>\r\n"
    		+ "<html>\r\n"
    		+ "<head>\r\n"
    		+ "<meta charset=\"ISO-8859-1\">\r\n"
    		+ "<title>Atholton Solutions</title>\r\n"
    		+ "<link rel=\"stylesheet\"\r\n"
    		+ "	href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\"\r\n"
    		+ "	integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\"\r\n"
    		+ "	crossorigin=\"anonymous\">\r\n"
    		+ "</head>\r\n"
    		+ "<body style=\"background-color:#f3f3f3ff;\">\r\n"
    		+ "	<header>\r\n"
    		+ "	<nav class=\"navbar navbar-expand-md navbar-dark\">\r\n"
    		+ "			<div>\r\n"
    		+ "				<img class=\"school-logo\"\r\n"
    		+ "					src=\"https://ahs.hcpss.org/sites/default/files/atholtonhs.png\"\r\n"
    		+ "					alt=\"Logo image\" style=\"width: 80px\"> <a class=\"navbar-brand\"\r\n"
    		+ "					style=\"color: black; vertical-align:middle; font-size:200%;\" href=\"https://ahs.hcpss.org/\"> Atholton Solutions </a>\r\n"
    		+ "			</div>\r\n"
    		+ "		</nav>\r\n"
    		+ "		<br>\r\n"
    		+ "		<div style=\"text-align:center\">\r\n"
    		+ "			<image class=\"rounded-circle border border-success\"  src = \"https://static.hudl.com/users/temp/7082861_e91756197bb64e60b4b3850c4a1b85c1.jpg\" alt=\"AHS Logo\" style=\"height:100px; width:100px;\">\r\n"
    		+ "		</div>\r\n"
    		+ "	</header>\r\n"
    		+ "	<div style=\"text-align:center;\">\r\n"
    		+ "		<br>\r\n"
    		+ "		<h1 style=\"text-align:center;\">Password Reset</h1>\r\n"
    		+ "		<br>\r\n"
    		+ "		<div class=\"container col-md-5\" style=\"width:75%;\">\r\n"
    		+ "			<div class=\"card\">\r\n"
    		+ "				<div class=\"card-body rounded\" style=\"background-color:#fafafaff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);\">\r\n"
    		+ "					<b class=\"h5\"> Someone requested that the password be reset for the receiving account.</b>\r\n"
    		+ "					<br>\r\n"
    		+ "					<p>Here is your randomly generated six-digit code. Don't share it with anyone! </p>\r\n"
    		+ "					<span class=\"container-fluid bg-success text-white\">?</span>\r\n"
    		+ "					<p>If you dont recognize the name attached to this email, or if this was a mistake, please ignore this email </p>\r\n"
    		+ "				</div>\r\n"
    		+ "			</div>\r\n"
    		+ "			<p>Atholton Solutions</p>\r\n"
    		+ "		</div>\r\n"
    		+ "	</div>\r\n"
    		+ "	\r\n"
    		+ "</body>\r\n"
    		+ "</html>";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println(action);
		System.out.println("Email Servlet is called");
		
		System.out.println("i think it worked");
		sendPasswordResetEmail(request, response);
	
	}
    private void sendPasswordResetEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("Made it to Verification Email");
		String email = request.getParameter("userEmail");
		System.out.println(email);
		boolean passed = false;
		if ( email != null) {
			try {
				if ( userDAO.isUserInDatabase(email)) {
					String code = generateCode();
					System.out.println(code);
					
					StringBuilder sb = new StringBuilder(passwordPage);
					int ind = sb.indexOf("?");
					sb.deleteCharAt(ind);
					sb.insert(ind, code);
					
					passed = sendEmail(email, code, passwordSubject, sb.toString());
					
					if(passed) {
						
						request.setAttribute("emailType", "reset-password");
						request.setAttribute("code", code);
						//request.setAttribute("userEmail", email);
						
						HttpSession session = request.getSession();
   		             	session.setAttribute("userEmailForResetpassword",email);
						RequestDispatcher dispatcher = request.getRequestDispatcher("verify-code.jsp");
						dispatcher.forward(request, response);
    	                
					}
				} else {
					request.setAttribute("noSuchUser", true);
					RequestDispatcher dispatcher = request.getRequestDispatcher("forgot-password.jsp");
					dispatcher.forward(request, response);
				}
			}catch (SQLException ex) {
	            throw new ServletException(ex);
	        }
		}
		if(!passed) {
			request.setAttribute("displayInvalidEmail", true);
			RequestDispatcher dispatcher = request.getRequestDispatcher("forgot-password.jsp");
			dispatcher.forward(request, response);
		}
	}
}
