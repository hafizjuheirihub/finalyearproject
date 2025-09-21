package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.staffDAO;


public class listStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private staffDAO dao;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listStaffController() {
        super();
        dao = new staffDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("staffs", staffDAO.getAllStaffs() );
		RequestDispatcher view = request.getRequestDispatcher("liststaff.jsp");
        view.forward(request, response);
	}
}
