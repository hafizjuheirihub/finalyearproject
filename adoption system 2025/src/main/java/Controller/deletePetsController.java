package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PetsDAO;

public class deletePetsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PetsDAO dao;

    public deletePetsController() {
        super();
        dao = new PetsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int petID = Integer.parseInt(request.getParameter("PetID"));
        dao.deletePet(petID);;
        request.setAttribute("pets", PetsDAO.getAllPets());
        RequestDispatcher view = request.getRequestDispatcher("listpets.jsp");
        view.forward(request, response);
    }
}


