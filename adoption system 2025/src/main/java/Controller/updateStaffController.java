package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.CustDAO;
import dao.staffDAO;
import model.StaffBean;

public class updateStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private staffDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateStaffController() {
        super();
        dao = new staffDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int staffID = Integer.parseInt(request.getParameter("StaffID"));
        request.setAttribute("s", staffDAO.getStaffByID(staffID));
        RequestDispatcher view = request.getRequestDispatcher("updatestaff.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StaffBean staff = new StaffBean();
		staff.setStaffID(Integer.parseInt(request.getParameter("StaffID")));
		staff.setStaffName(request.getParameter("StaffName"));
		staff.setStaffPhoneNum(Integer.parseInt(request.getParameter("StaffPhoneNum")));
		staff.setStaffEmail(request.getParameter("StaffEmail"));
		staff.setStaffPass(request.getParameter("StaffPass"));
		
		 HttpSession session = request.getSession();
	     session.setAttribute("StaffID", staff.getStaffID());
	     session.setAttribute("StaffName", staff.getStaffName());
	     session.setAttribute("StaffPhoneNum", staff.getStaffPhoneNum());
	     session.setAttribute("StaffEmail", staff.getStaffEmail());
	     session.setAttribute("StaffPass", staff.getStaffPass());
		
	     dao.updateStaff(staff);
		
		request.setAttribute("staffs", staffDAO.getAllStaffs());
        RequestDispatcher view = request.getRequestDispatcher("viewstaff.jsp");
        view.forward(request, response);
	
	}

	}


