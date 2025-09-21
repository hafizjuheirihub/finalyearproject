package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.PetsDAO;

/**
 * Servlet implementation class ViewStaffController
 */

public class adoptPetsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PetsDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adoptPetsController() {
        super();
        dao = new PetsDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int petID = Integer.parseInt(request.getParameter("PetID"));
		request.setAttribute("p", PetsDAO.getPetByID(petID));
        RequestDispatcher view = request.getRequestDispatcher("questionnaire.jsp");
        view.forward(request, response);
	}
}
