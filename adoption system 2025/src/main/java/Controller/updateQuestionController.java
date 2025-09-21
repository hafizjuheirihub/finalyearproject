package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.QuestionDAO;
import model.QuestionBean;

public class updateQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateQuestionController() {
        super();
        dao = new QuestionDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int questionID = Integer.parseInt(request.getParameter("QuestionID"));
        request.setAttribute("q", QuestionDAO.getQuestionByID(questionID));
        RequestDispatcher view = request.getRequestDispatcher("updatequestion.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			QuestionBean question = new QuestionBean();
			question.setQuestionID(Integer.parseInt(request.getParameter("QuestionID")));
			question.setQuestionExample(request.getParameter("QuestionExample"));
		
		
		dao.updateQuestion(question);
		
		request.setAttribute("questions", QuestionDAO.getAllQuestions());
        RequestDispatcher view = request.getRequestDispatcher("listquestion.jsp");
        view.forward(request, response);
	
	}

	}


