package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import dao.RequestDAO;
import model.RequestBean;



public class listPostAdoptionController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RequestDAO dao;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listPostAdoptionController2() {
        super();
        dao = new RequestDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("CustID") != null) {
            int custID = (Integer) session.getAttribute("CustID");
            System.out.println("Cust ID from session: " + custID);

            List<RequestBean> requests = dao.getAllRequestByCustID(custID);
            request.setAttribute("requests", requests);
            RequestDispatcher view = request.getRequestDispatcher("postadopt2.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect("logincust.jsp"); // Redirect to login if no session or custID
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}