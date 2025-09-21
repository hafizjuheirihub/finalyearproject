package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PostAdoptionDAO;
import dao.RequestDAO;

public class deletePostAdoptionController2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostAdoptionDAO dao;

    public deletePostAdoptionController2() {
        super();
        dao = new PostAdoptionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	int postID = Integer.parseInt(request.getParameter("PostID"));
        dao.deletePostAdoption(postID);
        request.setAttribute("postadopts", PostAdoptionDAO.getAllPostAdopts());
        response.sendRedirect("viewPostAdoptionController");
		/*
		 * request.setAttribute("postadopts", PostAdoptionDAO.getAllPostAdopts());
		 * RequestDispatcher view = request.getRequestDispatcher("listpoststaff.jsp");
		 * view.forward(request, response);
		 */
    }
}


