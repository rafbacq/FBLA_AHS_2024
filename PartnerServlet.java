package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import net.fbla.ahs.dao.*;
import net.fbla.ahs.model.Partner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class PartnerServlet
 */
@WebServlet("/")
public class PartnerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private PartnerDAO partnerDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init()
    {
    	partnerDAO = new PartnerDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
	  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertPartner(request, response);
                    break;
                case "/delete":
                	var yesOrNo = JOptionPane.showConfirmDialog(null,
                            "Are you want to continue the process?",
                            "Confirmation",
                            JOptionPane.YES_NO_OPTION);
                	if(yesOrNo==0) {
                		deletePartner(request, response);
                	}
                	else {
                		listPartner(request,response);
                	}
                    
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updatePartner(request, response);
                    break;
                default:
                    listPartner(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listPartner(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List <Partner> listPartner = partnerDAO.selectAllPartners();
        request.setAttribute("listPartner", listPartner);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("partner-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Partner existingPartner = partnerDAO.selectPartner(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("partner-form.jsp");
        request.setAttribute("partner", existingPartner);
        dispatcher.forward(request, response);

    }

    private void insertPartner(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
    	
  

    	
    	
        String name = request.getParameter("contactName");
        String orgName = request.getParameter("orgName");
        String typOrg = request.getParameter("typOrg");
        String contactEmail = request.getParameter("contactEmail");
        String contactPhone = request.getParameter("contactPhone");
        		
        Partner newPartner = new Partner(name, orgName, typOrg, contactEmail, contactPhone);
        partnerDAO.insertPartner(newPartner);
        response.sendRedirect("list");
    }

    private void updatePartner(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("contactName");
        String orgName = request.getParameter("orgName");
        String typOrg = request.getParameter("typOrg");
        String contactEmail = request.getParameter("contactEmail");
        String contactPhone = request.getParameter("contactPhone");

        Partner book = new Partner(id, name, orgName, typOrg, contactEmail, contactPhone);
        partnerDAO.updatePartner(book);
        response.sendRedirect("list");
    }

    private void deletePartner(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        partnerDAO.deletePartner(id);
        response.sendRedirect("list");

    }
    private void filter(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException{
    	List<Partner> filteredList = partnerDAO.selectAllPartners();
    	
    }

}
