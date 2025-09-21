package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import dao.RequestDAO;
import model.RequestBean;

public class updateStatusController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RequestDAO dao;
    
    public updateStatusController() {
        super();
        dao = new RequestDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	RequestBean r = new RequestBean();
		r.setRequestID(Integer.parseInt(request.getParameter("RequestID")));
		r.setStatus(request.getParameter("Status"));
		r.setRemarks(request.getParameter("Remarks"));
	
	dao.updateStatusAndRemarks(r);
	
	request.setAttribute("r", RequestDAO.getAllRequests());
    response.sendRedirect("listRequestController");

    }
}	
