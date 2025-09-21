package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import dao.staffDAO;
import model.CustomerBean;
import model.StaffBean;


public class loginStaffController extends HttpServlet {
 private static final long serialVersionUID = 1L;
    private staffDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
 public loginStaffController() {
        super();
        dao = new staffDAO();
       
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
  response.getWriter().append("Served at: ").append(request.getContextPath());
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String StaffName =
	 * request.getParameter("StaffName"); String StaffPass =
	 * request.getParameter("StaffPass");
	 * 
	 * // Authenticate the customer StaffBean staff = dao.getStaffByName(StaffName);
	 * 
	 * if ( staff != null && staff.getStaffPass().equals(StaffPass)) {
	 * 
	 * // Customer authentication successful HttpSession session =
	 * request.getSession(); session.setAttribute("staff", staff);
	 * 
	 * // Redirect to the home page or a success page
	 * response.sendRedirect("homepagestaff.jsp"); } else { // Customer
	 * authentication failed // Redirect to a different page for failed
	 * authentication response.sendRedirect("loginstaff.jsp"); } } }
	 */
 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  // TODO Auto-generated method stub
	   String staffName = request.getParameter("StaffName");
	         String staffPass = request.getParameter("StaffPass");
	         System.out.println(staffName);
	         StaffBean staff = dao.validateLogin(staffName, staffPass);

	         if (staff != null) {
	             // Login successful
	             // Redirect to appropriate dashboard or perform cust-specific actions
	             HttpSession session = request.getSession();
	             session.setAttribute("StaffID", staff.getStaffID());
	             session.setAttribute("StaffName", staff.getStaffName());
	             session.setAttribute("StaffPhoneNum", staff.getStaffPhoneNum());
	             session.setAttribute("StaffEmail", staff.getStaffEmail());
	             session.setAttribute("StaffPass", staff.getStaffPass());

	             response.getWriter().write("valid");
	         } else {
	             // Login failed
	             response.getWriter().write("invalid");


					/*
					 * System.out.println(session.getAttribute("StaffName"));
					 * //response.sendRedirect(request.getContextPath() + "/1homecusacc.jsp");
					 * String targetPage = "homepagestaff.jsp"; RequestDispatcher dispatcher =
					 * request.getRequestDispatcher(targetPage); dispatcher.forward(request,
					 * response);
					 * 
					 * } else { // Login failed System.out.println("Login failed.");
					 * 
					 * // You can handle the failed login scenario here, such as displaying an error
					 * message or redirecting to a login page
					 * //response.sendRedirect(request.getContextPath() + "loginin.jsp"); String
					 * targetPage = "loginstaff.jsp"; RequestDispatcher dispatcher =
					 * request.getRequestDispatcher(targetPage); dispatcher.forward(request,
					 * response);
					 */
	         }
	     }
	  
	 }
