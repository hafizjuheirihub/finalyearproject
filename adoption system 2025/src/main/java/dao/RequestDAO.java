package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import model.PetBean;
import model.PostAdoptionBean;
import model.RequestBean;
import db.ConnectionManager;

public class RequestDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int RequestID;
	private int CustID;
	private int PetID;
	private String PetType;
	 private String PetName;
	 private String PetAge;
	 private String PetGender;
	 private String PetBreed;
	 private String PetBeharvior;
	 private String PetFavFood;
	 private String CustName;
	 private int CustPhoneNum;
	 private String CustEmail;
	 private String CustPass;
	private String Answer1;
	private String Answer2;
	private String Answer3;
	private String Answer4;
	private String Answer5;
	private String Answer6;
	private String Answer7;
	private String Answer8;
	private String Answer9;
	private String Answer10;
	private String Status;
	private String Remarks;

    // Method to add a new request
    public void addRequest(RequestBean bean) {
    	PetID = bean.getPetID();
    	CustID = bean.getCustID();
    	Answer1 = bean.getAnswer1();
    	Answer2 = bean.getAnswer2();
    	Answer3 = bean.getAnswer3();
    	Answer4 = bean.getAnswer4();
    	Answer5 = bean.getAnswer5();
    	Answer6 = bean.getAnswer6();
    	Answer7 = bean.getAnswer7();
    	Answer8 = bean.getAnswer8();
    	Answer9 = bean.getAnswer9();
    	Answer10 = bean.getAnswer10();
		/* Status = bean.getStatus(); */
        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
                "INSERT INTO request (pets_id, cust_id, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10, status, remarks) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            // Set parameters
            ps.setInt(1, PetID);
            ps.setInt(2, CustID);
            ps.setString(3, Answer1);
            ps.setString(4, Answer2);
            ps.setString(5, Answer3);
            ps.setString(6, Answer4);
            ps.setString(7, Answer5);
            ps.setString(8, Answer6);
            ps.setString(9, Answer7);
            ps.setString(10, Answer8);
            ps.setString(11, Answer9);
            ps.setString(12, Answer10);
			 ps.setString(13, "Pending");
			 ps.setString(14, "-");

            // Execute update
            ps.executeUpdate();
            System.out.println("Successfully inserted");

                // Close resources
                 ps.close();
                 con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    

    // Method to retrieve all requests
    public static List<RequestBean> getAllRequests() {
        List<RequestBean> requests = new ArrayList<>();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            stmt = con.createStatement();
			String sql = 
					"SELECT r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, p.pets_type, " +
				            "r.answer1, r.answer2, r.answer3, r.answer4, r.answer5, r.answer6, r.answer7, r.answer8, r.answer9, r.answer10, r.status, r.remarks " +
				            "FROM customers c " +
				            "JOIN request r ON c.cust_id = r.cust_id " +
				            "JOIN pets p ON r.pets_id = p.pets_id " +
				            "ORDER BY r.request_id"; 
					
			/* "SELECT * FROM request"; */
            
            ps = con.prepareStatement(sql);
			/* rs = stmt.executeQuery(sql); */
            
         // Execute query
            rs = ps.executeQuery();
            
            // Retrieve data from result set row by row
            while (rs.next()) {
                RequestBean r = new RequestBean();
                r.setRequestID(rs.getInt("request_id"));
                r.setCustID(rs.getInt("cust_id"));
				r.setCustName(rs.getString("cust_name"));
				r.setPetID(rs.getInt("pets_id"));
				r.setPetName(rs.getString("pets_name"));
				r.setPetType(rs.getString("pets_type"));
                r.setAnswer1(rs.getString("answer1"));
                r.setAnswer2(rs.getString("answer2"));
                r.setAnswer3(rs.getString("answer3"));
                r.setAnswer4(rs.getString("answer4"));
                r.setAnswer5(rs.getString("answer5"));
                r.setAnswer6(rs.getString("answer6"));
                r.setAnswer7(rs.getString("answer7"));
                r.setAnswer8(rs.getString("answer8"));
                r.setAnswer9(rs.getString("answer9"));
                r.setAnswer10(rs.getString("answer10"));
                r.setStatus(rs.getString("status"));
                r.setRemarks(rs.getString("remarks"));
                requests.add(r);
            }
         // Close connection
            rs.close();
            ps.close();
            con.close();
            con.close(); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            } 
            return requests; 
        }



//Method to retrieve all requests

        public List<RequestBean> getAllRequestsByCustID(int custID) {
            List<RequestBean> requests = new ArrayList<>();
            String query = "SELECT c.cust_id, c.cust_name, p.pets_id, p.pets_name, p.pets_type, r.status, r.remarks " +
                           "FROM customers c " +
                           "JOIN request r ON c.cust_id = r.cust_id " +
                           "JOIN pets p ON r.pets_id = p.pets_id " +
                           "WHERE r.cust_id = ?";

            try (Connection con = ConnectionManager.getConnection();
                 PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, custID);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    RequestBean r = new RequestBean();
                    r.setCustID(rs.getInt("cust_id"));
                    r.setCustName(rs.getString("cust_name"));
                    r.setPetID(rs.getInt("pets_id"));
                    r.setPetName(rs.getString("pets_name"));
                    r.setPetType(rs.getString("pets_type"));
                    r.setStatus(rs.getString("status"));
                    r.setRemarks(rs.getString("remarks"));
                    requests.add(r);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return requests;
        }
    
        public void updateStatusAndRemarks(RequestBean request) {
        	RequestID = request.getRequestID();
        	Status = request.getStatus();
        	Remarks = request.getRemarks();
        	
        	try {
                // Get connection
                con = ConnectionManager.getConnection();

                // Create statement
                ps = con.prepareStatement(
                    "UPDATE request SET remarks=?, status=? WHERE request_id = ?"
                );

                // Set parameter
                ps.setString(1, request.getRemarks());
                ps.setString(2, request.getStatus());
                ps.setInt(3, request.getRequestID());

                // Execute update
                ps.executeUpdate();
                System.out.println("Successfully updated status and remarks");

                // Close resources
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }       

public static RequestBean getAllAnswerByRequestID(int requestID) { 
	RequestBean r = new RequestBean(); 
       try { 
           // Get connection 
           con = ConnectionManager.getConnection(); 

           // Create statement 
           ps = con.prepareStatement("SELECT * FROM request WHERE request_id = ?");
           ps.setInt(1, requestID); 

           // Execute query 
           rs = ps.executeQuery(); 
           if (rs.next()) { 
        	   r.setRequestID(rs.getInt("request_id"));
               r.setAnswer1(rs.getString("answer1"));
               r.setAnswer2(rs.getString("answer2"));
               r.setAnswer3(rs.getString("answer3"));
               r.setAnswer4(rs.getString("answer4"));
               r.setAnswer5(rs.getString("answer5"));
               r.setAnswer6(rs.getString("answer6"));
               r.setAnswer7(rs.getString("answer7"));
               r.setAnswer8(rs.getString("answer8"));
               r.setAnswer9(rs.getString("answer9"));
               r.setAnswer10(rs.getString("answer10"));
           } 

           // Close connection 
           con.close(); 
       } catch (Exception e) { 
           e.printStackTrace(); 
       }
       return r;}

public List<RequestBean> getAllRequestByCustID(int custID) {
    List<RequestBean> requests = new ArrayList<>();
    String query = "SELECT r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, p.pets_type, r.status, r.remarks " +
                   "FROM customers c " +
                   "JOIN request r ON c.cust_id = r.cust_id " +
                   "JOIN pets p ON r.pets_id = p.pets_id " +
                   "WHERE r.cust_id = ? AND r.status = 'Approve'";

    try (Connection con = ConnectionManager.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setInt(1, custID);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            RequestBean r = new RequestBean();
            r.setRequestID(rs.getInt("request_id"));
            r.setCustID(rs.getInt("cust_id"));
            r.setCustName(rs.getString("cust_name"));
            r.setPetID(rs.getInt("pets_id"));
            r.setPetName(rs.getString("pets_name"));
            r.setPetType(rs.getString("pets_type"));
            r.setStatus(rs.getString("status"));
            r.setRemarks(rs.getString("remarks"));
            requests.add(r);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return requests;
}

public static RequestBean getRequestByPetID(int petID) {
	RequestBean r = new RequestBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, p.pets_type, r.status, r.remarks " +
                "FROM customers c " +
                "JOIN request r ON c.cust_id = r.cust_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE r.pets_id = ?");
        ps.setInt(1, petID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
            r.setRequestID(rs.getInt("request_id"));
            r.setCustID(rs.getInt("cust_id"));
            r.setCustName(rs.getString("cust_name"));
            r.setPetID(rs.getInt("pets_id"));
            r.setPetName(rs.getString("pets_name"));
            r.setPetType(rs.getString("pets_type"));
            r.setStatus(rs.getString("status"));
            r.setRemarks(rs.getString("remarks"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return r;
}
}