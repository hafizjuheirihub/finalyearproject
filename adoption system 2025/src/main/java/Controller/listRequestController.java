package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.RequestDAO;


public class listRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RequestDAO dao;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listRequestController() {
        super();
        dao = new RequestDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setAttribute("requests", RequestDAO.getAllRequests());
		RequestDispatcher view = request.getRequestDispatcher("petapprove.jsp");
        view.forward(request, response);
	}

}
