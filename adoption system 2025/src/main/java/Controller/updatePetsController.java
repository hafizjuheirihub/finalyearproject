package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import dao.PetsDAO;
import model.PetBean;

@MultipartConfig
public class updatePetsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PetsDAO dao;

    public updatePetsController() {
        super();
        dao = new PetsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int petID = Integer.parseInt(request.getParameter("PetID"));
        request.setAttribute("p", PetsDAO.getPetByID(petID));
        RequestDispatcher view = request.getRequestDispatcher("updatepets.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PetBean pet = new PetBean();
        pet.setPetID(Integer.parseInt(request.getParameter("PetID")));
        pet.setPetType(request.getParameter("PetType"));
        pet.setPetName(request.getParameter("PetName"));
        pet.setPetAge(request.getParameter("PetAge"));
        pet.setPetGender(request.getParameter("PetGender"));
        pet.setPetBreed(request.getParameter("PetBreed"));
        pet.setPetBeharvior(request.getParameter("PetBeharvior"));
        pet.setPetFavFood(request.getParameter("PetFavFood"));

        Part filePart = request.getPart("PetImg");
        if (filePart != null && filePart.getSize() > 0) {
            // Convert Part to byte[]
            byte[] imageData = inputStreamToByteArray(filePart.getInputStream());
            pet.setPetImg(imageData);
        }

        dao.updatePet(pet);

        request.setAttribute("pets", PetsDAO.getAllPets());
        RequestDispatcher view = request.getRequestDispatcher("listpets.jsp");
        view.forward(request, response);
    }

    private byte[] inputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        return buffer.toByteArray();
    }
}