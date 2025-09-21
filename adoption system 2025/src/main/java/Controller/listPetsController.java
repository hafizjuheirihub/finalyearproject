package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.PetsDAO;

public class listPetsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PetsDAO dao;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listPetsController() {
        super();
		/* dao = new PetsDAO(); */
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pets", PetsDAO.getAllPetss() );
		RequestDispatcher view = request.getRequestDispatcher("listpets.jsp");
        view.forward(request, response);
	}
}
