package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PostAdoptionBean;

import java.io.IOException;
import java.util.List;

import dao.PostAdoptionDAO;

public class listPostCustController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostAdoptionDAO dao;

    public listPostCustController() {
        super();
        dao = new PostAdoptionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("CustID") != null) {
            int custID = (Integer) session.getAttribute("CustID");
            List<PostAdoptionBean> postadopts = dao.getAllSubmittedPostAdoptsByCustID(custID);
            request.setAttribute("postadopts", postadopts);
            RequestDispatcher view = request.getRequestDispatcher("listpostcust.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect("logincust.jsp"); // Redirect to login if no session or custID
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}