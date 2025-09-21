package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.QuestionDAO;

/**
 * Servlet implementation class ViewStaffController
 */

public class viewQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewQuestionController() {
        super();
        dao = new QuestionDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int questionID = Integer.parseInt(request.getParameter("QuestionID"));
        request.setAttribute("q", QuestionDAO.getQuestionByID(questionID));
        RequestDispatcher view = request.getRequestDispatcher("viewquestion.jsp");
        view.forward(request, response);
	}
}
