package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CustDAO;


public class viewCustController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    public viewCustController() {
        super();
        dao = new CustDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String custPass = request.getParameter("CustPass");
        request.setAttribute("c", CustDAO.getCustomerByPass(custPass));
        RequestDispatcher view = request.getRequestDispatcher("viewcustomer.jsp");
        view.forward(request, response);
    }
}
