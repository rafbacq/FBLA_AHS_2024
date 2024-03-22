package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.fbla.ahs.model.Partner;
import net.fbla.ahs.model.User;
import net.fbla.ahs.dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	String action = request.getServletPath();
  //
    	String username = (String)request.getSession().getAttribute("userEmailForResetpassword"); 
        String password = (String)request.getSession().getAttribute("userPasswordForResetpassword");
        
        if (password != null)
    	   request.setAttribute("userPassword", password);    
        if (username != null )
        	request.setAttribute("userEmail", username); 
        
    	RequestDispatcher dispatcher = request.getRequestDispatcher("login-page.jsp");
        dispatcher.forward(request, response);
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {

    	        String username = request.getParameter("username");
    	        String password = request.getParameter("password");
    	        User loginUser = new User(username, password, false);
    	        String ApplicationName = ((HttpServletRequest) request).getContextPath()
                        .replace("/", "");
    	        try {
    	            if (userDAO.validate(loginUser)) {
    	                HttpSession session = request.getSession();
    	                session.setAttribute("loginUser",loginUser);
    	                //RequestDispatcher dispatcher = request.getRequestDispatcher("/list-partner.jsp");
    	                //dispatcher.forward(request, response);
    	                
    	                response.sendRedirect("partners");
    	            } else {
    	                HttpSession session = request.getSession();
    	                //session.setAttribute("user", username);
    	                //response.sendRedirect("login.jsp");
    	                
    	                
    	               // session.invalidate();
                        //request.setAttribute("errorMessage", "Invalid user or password");
                        request.setAttribute("errorMessage", "Invalid username or password");
                        RequestDispatcher rd = request.getRequestDispatcher("/login-page.jsp");
                        rd.forward(request, response);          
                        
    	            }
    	        } catch (ClassNotFoundException e) {
    	            e.printStackTrace();
    	        }
    	    }

}
