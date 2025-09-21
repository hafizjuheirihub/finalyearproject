package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.QuestionDAO;


public class listQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private QuestionDAO dao;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listQuestionController() {
        super();
        dao = new QuestionDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("questions", QuestionDAO.getAllQuestions() );
		RequestDispatcher view = request.getRequestDispatcher("listquestion.jsp");
        view.forward(request, response);
	}
}
