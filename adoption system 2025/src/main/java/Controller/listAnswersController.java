package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RequestBean;

import java.io.IOException;
import java.util.List;
import dao.RequestDAO;

/**
 * Servlet implementation class listAnswersController
 */
public class listAnswersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RequestDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listAnswersController() {
        super();
        // TODO Auto-generated constructor stub
        dao = new RequestDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Parse the requestID parameter from the request
    	int requestID = Integer.parseInt(request.getParameter("RequestID"));
        request.setAttribute("r", RequestDAO.getAllAnswerByRequestID(requestID));
        RequestDispatcher view = request.getRequestDispatcher("listanswer.jsp");
        view.forward(request, response);
    }
	}

