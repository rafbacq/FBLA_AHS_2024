package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.fbla.ahs.dao.*;
import net.fbla.ahs.model.Partner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PartnerServlet
 */
@WebServlet("/")
public class PartnerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private PartnerDAO partnerDAO;
    
    enum FilterType {
		NONE, 
	    byName,
	    byOrgName,
	    byOrgType,
	    byEmail,
	    byPhone
	  }
    private FilterType filterType = FilterType.NONE; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init()
    {
    	partnerDAO = new PartnerDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	String byName = request.getParameter("byName");
    	String byEmail = request.getParameter("byEmail");
    	String byOrgName = request.getParameter("byOrgName");
    	String byOrgType = request.getParameter("byOrgType");
    	String byPhone = request.getParameter("byPhone");

    	this.filterType = FilterType.NONE; 
    	
    	
    	if (byName != null) {
    		
    		this.filterType = FilterType.byName; 
    	} 
    	else if (byEmail != null) {
    		
    		this.filterType = FilterType.byEmail;  
    	}
    	else if (byPhone != null) {
    		
    		this.filterType = FilterType.byPhone;
    	}
    	else if (byOrgName != null) {
    		
    		this.filterType = FilterType.byOrgName;  
    	}
    	else if (byOrgType != null) {
    		
    		this.filterType = FilterType.byOrgType;
    	} 
    	
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
                	deletePartner(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updatePartner(request, response);
                    break;
                default:
                	String inputStr = request.getParameter("myInput");
                	if ( inputStr != null && !inputStr.isEmpty() ) {
                	
                		switch(this.filterType) {
                		  case byName:
                			  this.listPartnerByName(request, response, inputStr);
                		    break;
                		  case byEmail:
                			  this.listPartnerByEmail(request, response, inputStr);
                		    break;
                		  case byOrgName:
                			  this.listPartnerByOrgname(request, response, inputStr);
                		    break;
                		  case byOrgType:
                			  this.listPartnerByOrgtype(request, response, inputStr);
                		    break;
                		  case byPhone:
                			  this.listPartnerByPhone(request, response, inputStr);
                		    break;
                		  default:
                			  listPartner(request, response);
                		}
		
                	} else 
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
    private void listPartnerByName(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List < Partner > listPartner = partnerDAO.selectAllPartners();
		List <Partner> selectedPartners = new ArrayList < > ();
		
        for ( Partner p: listPartner) {
        	if (p.getContactName().toLowerCase().contains(inputStr.toLowerCase())) {
        		selectedPartners.add(p);	
        	}		
        }	
	    request.setAttribute("listPartner", selectedPartners);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
        dispatcher.forward(request, response);
	}
    private void listPartnerByOrgname(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List < Partner > listPartner = partnerDAO.selectAllPartners();
		List <Partner> selectedPartners = new ArrayList < > ();
		
        for ( Partner p: listPartner) {
        	if (p.getOrgName().toLowerCase().contains(inputStr.toLowerCase())) {
        		selectedPartners.add(p);	
        	}		
        }	
	    request.setAttribute("listPartner", selectedPartners);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
        dispatcher.forward(request, response);
	}
    private void listPartnerByOrgtype(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List < Partner > listPartner = partnerDAO.selectAllPartners();
		List <Partner> selectedPartners = new ArrayList < > ();
		
        for ( Partner p: listPartner) {
        	if (p.getTypOrg().toLowerCase().contains(inputStr.toLowerCase())) {
        		selectedPartners.add(p);	
        	}		
        }	
	    request.setAttribute("listPartner", selectedPartners);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
        dispatcher.forward(request, response);
	}
    private void listPartnerByEmail(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List < Partner > listPartner = partnerDAO.selectAllPartners();
		List <Partner> selectedPartners = new ArrayList < > ();
		
        for ( Partner p: listPartner) {
        	if (p.getContactEmail().toLowerCase().contains(inputStr.toLowerCase())) {
        		selectedPartners.add(p);	
        	}		
        }	
	    request.setAttribute("listPartner", selectedPartners);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
        dispatcher.forward(request, response);
	}
    private void listPartnerByPhone(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List < Partner > listPartner = partnerDAO.selectAllPartners();
		
		
		List <Partner> selectedPartners = new ArrayList < > ();
		
        for ( Partner p: listPartner) {
        	if (p.getContactPhone().toLowerCase().contains(inputStr.toLowerCase())) {
        		selectedPartners.add(p);	
        	}		
        }	
	    request.setAttribute("listPartner", selectedPartners);
        
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
    throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
     // Check if the user confirmed the deletion
        String confirmDelete = request.getParameter("confirmDelete");
        if (confirmDelete != null && confirmDelete.equals("true")) {
            partnerDAO.deletePartner(id);
            response.sendRedirect("list");
        } else {
            // Forward to the confirmation page
            Partner partner = partnerDAO.selectPartner(id);
            request.setAttribute("partner", partner);
            RequestDispatcher dispatcher = request.getRequestDispatcher("confirm-delete.jsp");
            dispatcher.forward(request, response);
        }

    }
    

}
