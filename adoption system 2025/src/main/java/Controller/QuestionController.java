package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.QuestionDAO;
import dao.PetsDAO;

/**
 * Servlet implementation class newcontroller
 */

public class QuestionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuestionDAO questionDAO;
    private PetsDAO petsDAO;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionController() {
        super();
        questionDAO = new QuestionDAO();
        petsDAO = new PetsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if PetID parameter is present in the request
        if (request.getParameter("PetID") != null) {
            // If PetID parameter is present, handle pet adoption
            handlePetAdoption(request, response);
        } else {
            // If PetID parameter is not present, show questionnaire
            showQuestionnaire(request, response);
        }
    }

    private void handlePetAdoption(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int petID = Integer.parseInt(request.getParameter("PetID"));
        request.setAttribute("p", petsDAO.getPetByID(petID));
        RequestDispatcher view = request.getRequestDispatcher("questionnaire.jsp");
        view.forward(request, response);
    }

    private void showQuestionnaire(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("questions", questionDAO.getAllQuestions());
        RequestDispatcher view = request.getRequestDispatcher("questionnaire.jsp");
        view.forward(request, response);
    }
}
