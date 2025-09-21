package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import dao.PetsDAO;
import model.PetBean;

public class listAdoptPetsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PetsDAO dao;

    public listAdoptPetsController() {
        super();
        dao = new PetsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String[] types = request.getParameterValues("type");
        String[] genders = request.getParameterValues("gender");
        String[] breeds = request.getParameterValues("breed");
        String age = request.getParameter("age");

        List<PetBean> pets = PetsDAO.getPetsByFilters(types, search, genders, breeds, age);
        
        request.setAttribute("pets", pets);
        RequestDispatcher view = request.getRequestDispatcher("listadoptpets.jsp");
        view.forward(request, response);
    }
}
