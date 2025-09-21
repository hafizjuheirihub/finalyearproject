package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.QuestionDAO;
import model.QuestionBean;


public class addQuestionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuestionDAO dao;

    public addQuestionController() {
        super();
        dao = new QuestionDAO();
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	QuestionBean question = new QuestionBean();
    	question.setQuestionExample(request.getParameter("QuestionExample"));

        dao.addQuestion(question);

        // Forward to a success page or redirect to a different page
        request.setAttribute("questions", QuestionDAO.getAllQuestions());
        RequestDispatcher  view = request.getRequestDispatcher("addquestion.jsp");
        view.forward(request, response);
    }
}


