package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.CustomerBean;
import model.RequestBean;
import dao.CustDAO;
import dao.RequestDAO;

/**
 * Servlet implementation class addRequestController
 */
public class addRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustDAO dao;
    private RequestDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRequestController() {
        super();
        // TODO Auto-generated constructor stub
        dao = new CustDAO();
        dao2 = new RequestDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String custPass = request.getParameter("CustPass");
        request.setAttribute("c", CustDAO.getCustomerByPass(custPass));
        RequestDispatcher view = request.getRequestDispatcher("questionnaire.jsp");
        view.forward(request, response);
    }	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestBean requests = new RequestBean();
			requests.setCustID(Integer.parseInt(request.getParameter("CustID")));
			requests.setPetID(Integer.parseInt(request.getParameter("PetID")));
			requests.setAnswer1(request.getParameter("Answer1"));
			requests.setAnswer2(request.getParameter("Answer2"));
			requests.setAnswer3(request.getParameter("Answer3"));
			requests.setAnswer4(request.getParameter("Answer4"));
			requests.setAnswer5(request.getParameter("Answer5"));
			requests.setAnswer6(request.getParameter("Answer6"));
			requests.setAnswer7(request.getParameter("Answer7"));
			requests.setAnswer8(request.getParameter("Answer8"));
			requests.setAnswer9(request.getParameter("Answer9"));
			requests.setAnswer10(request.getParameter("Answer10"));
			/* requests.setStatus(request.getParameter("Status")); */
			dao2.addRequest(requests);
			
			request.setAttribute("requests", RequestDAO.getAllRequests()); 
	        response.sendRedirect("requestController");
	    
	    }
}




