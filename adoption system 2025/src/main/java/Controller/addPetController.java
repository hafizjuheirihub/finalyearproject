package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.PetsDAO;
import dao.staffDAO;
import model.PetBean;
import java.io.InputStream;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.ByteArrayOutputStream;

@MultipartConfig
public class addPetController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PetsDAO dao;

    public addPetController() {
        super();
        dao = new PetsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String staffPass = request.getParameter("StaffPass");
        request.setAttribute("s", staffDAO.getStaffByPass(staffPass));
        RequestDispatcher view = request.getRequestDispatcher("addpets.jsp");
        view.forward(request, response);
    }	
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	PetBean pet = new PetBean();
    	pet.setPetName(request.getParameter("PetName"));
    	pet.setPetType(request.getParameter("PetType"));
    	pet.setPetAge(request.getParameter("PetAge"));
    	pet.setPetGender(request.getParameter("PetGender"));
    	pet.setPetBreed(request.getParameter("PetBreed"));
    	pet.setPetBeharvior(request.getParameter("PetBeharvior"));
    	pet.setPetFavFood(request.getParameter("PetFavFood"));
    	
        Part filePart = request.getPart("PetImg");
        byte[] imageData = null;
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream is = filePart.getInputStream()) {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = is.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageData = outputStream.toByteArray();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		 pet.setStaffID(Integer.parseInt(request.getParameter("StaffID"))); 

        dao.addPet(pet, imageData);

        // Forward to a success page or redirect to a different page
        request.setAttribute("pets", PetsDAO.getAllPets());
        RequestDispatcher  view = request.getRequestDispatcher("listpets.jsp");
        view.forward(request, response);
    }
}


