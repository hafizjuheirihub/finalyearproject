package Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

import model.PostAdoptionBean;
import model.RequestBean;
import dao.PostAdoptionDAO;
import dao.CustDAO;
import dao.PetsDAO;
import dao.RequestDAO;
import dao.staffDAO;

@MultipartConfig
public class updatePostAdoptionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostAdoptionDAO dao;
    private PetsDAO dao2;
    private RequestDAO requestDAO;  // Add the RequestDAO

    public updatePostAdoptionController() {
        super();
        dao = new PostAdoptionDAO();
        dao2 = new PetsDAO();
        requestDAO = new RequestDAO();  // Initialize the RequestDAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("CustID") != null) {
            int custID = (Integer) session.getAttribute("CustID");
            System.out.println("Cust ID from session: " + custID);
            
        int petID = Integer.parseInt(request.getParameter("PetID"));
        request.setAttribute("r", RequestDAO.getRequestByPetID(petID));
        RequestDispatcher view = request.getRequestDispatcher("postadoptformupdate.jsp");
        view.forward(request, response);
    }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostAdoptionBean postadopts = new PostAdoptionBean();

        try {
            postadopts.setPostID(Integer.parseInt(request.getParameter("PostID"))); // Ensure PostID is retrieved correctly
            postadopts.setRequestID(Integer.parseInt(request.getParameter("RequestID")));
        } catch (NumberFormatException e) {
            System.err.println("Invalid RequestID or PostID: " + request.getParameter("RequestID") + ", " + request.getParameter("PostID"));
        }
        try {
            postadopts.setCustID(Integer.parseInt(request.getParameter("CustID")));
        } catch (NumberFormatException e) {
            System.err.println("Invalid CustID: " + request.getParameter("CustID"));
        }
        try {
            postadopts.setPetID(Integer.parseInt(request.getParameter("PetID")));
        } catch (NumberFormatException e) {
            System.err.println("Invalid PetID: " + request.getParameter("PetID"));
        }
        postadopts.setPostActivity(request.getParameter("PostActivity"));

        Part filePart = request.getPart("PostImg");
        byte[] imageData = null;
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream is = filePart.getInputStream()) {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageData = outputStream.toByteArray();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        postadopts.setPostImg(imageData);
        dao.addPostAdoption(postadopts, imageData);

        request.setAttribute("pa", PostAdoptionDAO.getAllPostAdopts());
        RequestDispatcher view = request.getRequestDispatcher("homepagecust.jsp");
        view.forward(request, response);
    }
}

