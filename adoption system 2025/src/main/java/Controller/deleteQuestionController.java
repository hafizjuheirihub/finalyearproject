package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.QuestionDAO;

public class deleteQuestionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuestionDAO dao;

    public deleteQuestionController() {
        super();
        dao = new QuestionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int questionID = Integer.parseInt(request.getParameter("QuestionID"));
        dao.deleteQuestion(questionID);;
        request.setAttribute("questions", QuestionDAO.getAllQuestions());
        RequestDispatcher view = request.getRequestDispatcher("listquestion.jsp");
        view.forward(request, response);
    }
}


