package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.staffDAO;

/**
 * Servlet implementation class ViewStaffController
 */

public class viewStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private staffDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewStaffController() {
        super();
        dao = new staffDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String staffPass = request.getParameter("StaffPass");
        request.setAttribute("s", staffDAO.getStaffByPass(staffPass));
        RequestDispatcher view = request.getRequestDispatcher("viewstaff.jsp");
        view.forward(request, response);
	}
}
