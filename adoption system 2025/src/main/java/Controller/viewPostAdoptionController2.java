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

public class viewPostAdoptionController2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostAdoptionDAO dao;

    public viewPostAdoptionController2() {
        super();
        dao = new PostAdoptionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PostAdoptionBean> postadopts = dao.getAllSubmittedPostAdopts2();
        request.setAttribute("postadopts", postadopts);
        RequestDispatcher view = request.getRequestDispatcher("listpoststaff.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}