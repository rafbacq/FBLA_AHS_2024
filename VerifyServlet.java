package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.fbla.ahs.dao.UserDAO;
import net.fbla.ahs.model.User;
@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {

    			String username = (String)request.getSession().getAttribute("userEmail"); 
    	        String password = (String)request.getSession().getAttribute("userPassword");    	        
    	        User user = new User(username, password, false);
    	        try {
    	        	userDAO.insertUser(user);
    	        	HttpSession session = request.getSession();
  	                session.setAttribute("loginUser",user);
  	                
    	        	response.sendRedirect("partners");
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	        }
    	    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    	String action = request.getServletPath();
    	  
    	    	RequestDispatcher dispatcher = request.getRequestDispatcher("password-reset.jsp");
                dispatcher.forward(request, response);
    	        
    	    }
    
}
