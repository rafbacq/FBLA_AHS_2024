package net.fbla.ahs.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import net.fbla.ahs.dao.*;
import net.fbla.ahs.model.Partner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class PartnerServlet
 */
@WebServlet("/")
public class PartnerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PartnerDAO partnerDAO;

	/**
	 * Allows FilterType to be defined by one of the database constants
	 */
	enum FilterType {
		NONE, byName, byOrgName, byOrgType, byEmail, byPhone
	}

	private FilterType filterType = FilterType.NONE;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public void init() {
		partnerDAO = new PartnerDAO();
	}

	/**
	 * Called by the servlet to handle HTTP Post requests
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getServletPath());
		
		//the servlet request isnt meant for the partnerservlet
		if(request.getServletPath().indexOf("Email") != -1)
			return;

		String byName = request.getParameter("byName");
		String byEmail = request.getParameter("byEmail");
		String byOrgName = request.getParameter("byOrgName");
		String byOrgType = request.getParameter("byOrgType");
		String byPhone = request.getParameter("byPhone");

		this.filterType = FilterType.NONE;

		if (byName != null) {

			this.filterType = FilterType.byName;
		} else if (byEmail != null) {

			this.filterType = FilterType.byEmail;
		} else if (byPhone != null) {

			this.filterType = FilterType.byPhone;
		} else if (byOrgName != null) {

			this.filterType = FilterType.byOrgName;
		} else if (byOrgType != null) {

			this.filterType = FilterType.byOrgType;
		}

		doGet(request, response);
	}

	/**
	 * Called by servlet to handle HTPP Get requests
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println("Partner Servlet is called");
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
			case "/history":
				listTable(request, response);
				break;
			case "/save":
				copyTable(request, response);
				break;
			case "/display":
				displayTable(request, response);
				break;
			case "/verify":
				//create the new user in the entry
				System.out.println("verify");
				
				break;
			case "reset_password":
				//change the password for the email in the username
				break;
			case "/restore-table":
				restoreTable(request, response);
				break;
			default:
				String inputStr = request.getParameter("myInput");
				if (inputStr != null && !inputStr.isEmpty()) {

					switch (this.filterType) {
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

	/**
	 * Retrieves and dispatches the partner list
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listPartner(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Partner> listPartner = partnerDAO.selectAllPartners();
		request.setAttribute("listPartner", listPartner);
		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}
	
	private void restoreTable(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String tableName = request.getParameter("tableName");
		copyTable(request, response);
		partnerDAO.pasteTable(tableName);
		listPartner(request, response);
	}
	
	private void displayTable(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		System.out.println("display table is being called");
		String table = request.getParameter("tname");
		
		List<Partner> listSavedPartners = partnerDAO.selectAllPartners(table);
		 
		String partners = new Gson().toJson(listSavedPartners);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(partners);
		
	
	}

	private void listTable(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println("List Table is being called");
		List<String> listTable = partnerDAO.listAllTables();
		request.setAttribute("listTable", listTable);
		
		
		List<Partner> listPartner = partnerDAO.selectAllPartners();
		request.setAttribute("listPartner", listPartner);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
		dispatcher.forward(request, response);
	}

	private void copyTable(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		partnerDAO.savePartners();
		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Retrieves and dispatches the specified partner name
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @param inputStr specifies partner
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listPartnerByName(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List<Partner> listPartner = partnerDAO.selectAllPartners();
		List<Partner> selectedPartners = new ArrayList<>();

		for (Partner p : listPartner) {
			if (p.getContactName().toLowerCase().contains(inputStr.toLowerCase())) {
				selectedPartners.add(p);
			}
		}
		request.setAttribute("listPartner", selectedPartners);

		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Retrieves and dispatches the specified partner organization name
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @param inputStr specifies partner
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listPartnerByOrgname(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List<Partner> listPartner = partnerDAO.selectAllPartners();
		List<Partner> selectedPartners = new ArrayList<>();

		for (Partner p : listPartner) {
			if (p.getOrgName().toLowerCase().contains(inputStr.toLowerCase())) {
				selectedPartners.add(p);
			}
		}
		request.setAttribute("listPartner", selectedPartners);

		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Retrieves and dispatches the specified partner organization type
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @param inputStr specifies partner
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listPartnerByOrgtype(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List<Partner> listPartner = partnerDAO.selectAllPartners();
		List<Partner> selectedPartners = new ArrayList<>();

		for (Partner p : listPartner) {
			if (p.getTypOrg().toLowerCase().contains(inputStr.toLowerCase())) {
				selectedPartners.add(p);
			}
		}
		request.setAttribute("listPartner", selectedPartners);

		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Retrieves and dispatches the specified partner email
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @param inputStr specifies partner
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listPartnerByEmail(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List<Partner> listPartner = partnerDAO.selectAllPartners();
		List<Partner> selectedPartners = new ArrayList<>();

		for (Partner p : listPartner) {
			if (p.getContactEmail().toLowerCase().contains(inputStr.toLowerCase())) {
				selectedPartners.add(p);
			}
		}
		request.setAttribute("listPartner", selectedPartners);

		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Retrieves and dispatches the specified partner phone
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @param inputStr specifies partner
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listPartnerByPhone(HttpServletRequest request, HttpServletResponse response, String inputStr)
			throws SQLException, IOException, ServletException {
		List<Partner> listPartner = partnerDAO.selectAllPartners();

		List<Partner> selectedPartners = new ArrayList<>();

		for (Partner p : listPartner) {
			if (p.getContactPhone().toLowerCase().contains(inputStr.toLowerCase())) {
				selectedPartners.add(p);
			}
		}
		request.setAttribute("listPartner", selectedPartners);

		RequestDispatcher dispatcher = request.getRequestDispatcher("list-partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Dispatches a new partner form
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws IOException
	 * @throws ServletException
	 */
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("partner-form.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Dispatches an edit form for the partner
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Partner existingPartner = partnerDAO.selectPartner(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("partner-form.jsp");
		request.setAttribute("partner", existingPartner);
		dispatcher.forward(request, response);

	}

	/**
	 * Dispatches an insert partner form
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws IOException
	 * @throws SQLException
	 */
	private void insertPartner(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		System.out.println("INSERT PARTNER IS BEING CALLED");
		String name = request.getParameter("contactName");
		String orgName = request.getParameter("orgName");
		String typOrg = request.getParameter("typOrg");
		String contactEmail = request.getParameter("contactEmail");
		String contactPhone = request.getParameter("contactPhone");

		Partner newPartner = new Partner(name, orgName, typOrg, contactEmail, contactPhone);
		partnerDAO.insertPartner(newPartner);
		response.sendRedirect("list");
	}

	/**
	 * Dispatches an update partner form
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws IOException
	 * @throws SQLException
	 */
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

	/**
	 * Dispatches a delete partner form
	 * 
	 * @param request  gets the servlet request from the web page
	 * @param response provides HTTP-specific response to web page
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 */
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
