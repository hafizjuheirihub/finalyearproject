package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.PostAdoptionDAO;
import model.PostAdoptionBean;

public class viewPostAdoptionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostAdoptionDAO dao;

    public viewPostAdoptionController() {
        super();
        dao = new PostAdoptionDAO();
    }

/*
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * int requestID = Integer.parseInt(request.getParameter("RequestID"));
 * List<PostAdoptionBean> postadopts =
 * dao.getAllPostAdoptsByRequestID(requestID);
 * request.setAttribute("postadopts", postadopts); RequestDispatcher view =
 * request.getRequestDispatcher("listpoststaff.jsp"); view.forward(request,
 * response);
 * 
 * }
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { doGet(request, response); }
 * }
 */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PostAdoptionBean> postadopts = dao.getAllSubmittedPostAdopts();
        request.setAttribute("postadopts", postadopts);
        RequestDispatcher view = request.getRequestDispatcher("listpoststaff2.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}