package dao;

import java.sql.*;
import java.util.*;

import model.PetBean;
import model.PostAdoptionBean;
import model.RequestBean;
import db.ConnectionManager;

public class PostAdoptionDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;

    public void addPostAdoption(PostAdoptionBean postadopts, byte[] imageData) {
        try {
            con = ConnectionManager.getConnection();
            ps = con.prepareStatement(
                "INSERT INTO postadopt (request_id, cust_id, pets_id, post_activity, post_img, submission_date) VALUES (?, ?, ?, ?, ?, ?)"
            );

            ps.setInt(1, postadopts.getRequestID());
            ps.setInt(2, postadopts.getCustID());
            ps.setInt(3, postadopts.getPetID());
            ps.setString(4, postadopts.getPostActivity());
            ps.setBytes(5, imageData);
            ps.setDate(6, new java.sql.Date(System.currentTimeMillis())); // Insert Date
			/*
			 * ps.setDate(7, null); // Insert Date
			 */

            ps.executeUpdate();
            System.out.println("Successfully inserted post adoption");

            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
	/*
	 * public void updatePostAdoption(PostAdoptionBean postadopts, byte[] imageData)
	 * { try { con = ConnectionManager.getConnection(); ps = con.prepareStatement(
	 * "UPDATE postadopt SET post_img = ?, update_date = ? WHERE post_id = ?" );
	 * 
	 * ps.setBytes(1, imageData); ps.setDate(2, new
	 * java.sql.Date(System.currentTimeMillis())); // Update Date ps.setInt(3,
	 * postadopts.getPostID());
	 * 
	 * ps.executeUpdate(); System.out.println("Successfully updated post adoption");
	 * 
	 * ps.close(); con.close(); } catch (SQLException e) { e.printStackTrace(); } }
	 */

    public static List<PostAdoptionBean> getAllPostAdopts() {
        List<PostAdoptionBean> postadopts = new ArrayList<>();
        try {
            con = ConnectionManager.getConnection();
            String sql = 
                "SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date, pa.update_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON c.cust_id = r.cust_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "ORDER BY pa.post_id";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                PostAdoptionBean pa = new PostAdoptionBean();
                pa.setPostID(rs.getInt("post_id"));
                pa.setRequestID(rs.getInt("request_id"));
                pa.setCustID(rs.getInt("cust_id"));
                pa.setCustName(rs.getString("cust_name"));
                pa.setPetID(rs.getInt("pets_id"));
                pa.setPetName(rs.getString("pets_name"));
                pa.setPostActivity(rs.getString("post_activity"));
                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    pa.setPostImgBase64(base64Image);
                }
                pa.setSubmissionTime(rs.getDate("submission_date"));
                pa.setSubmissionTime(rs.getDate("update_date"));

                postadopts.add(pa);
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public List<PostAdoptionBean> getAllPostAdoptsByRequestID(int requestID) {
        List<PostAdoptionBean> postadopts = new ArrayList<>();
        String query = "SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON c.cust_id = r.cust_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE r.request_id = ?" +
                "ORDER BY pa.post_id";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PostAdoptionBean pa = new PostAdoptionBean();
                pa.setPostID(rs.getInt("post_id"));
                pa.setRequestID(rs.getInt("request_id"));
                pa.setCustID(rs.getInt("cust_id"));
                pa.setCustName(rs.getString("cust_name"));
                pa.setPetID(rs.getInt("pets_id"));
                pa.setPetName(rs.getString("pets_name"));
                pa.setPostActivity(rs.getString("post_activity"));
                pa.setSubmissionTime(rs.getDate("submission_date"));

                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    pa.setPostImgBase64(base64Image);
                }

                postadopts.add(pa);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public static PostAdoptionBean getAllPostAdoptByPetID(int petID) {
    	PostAdoptionBean postadopts = new PostAdoptionBean();
    	try {
    		con = ConnectionManager.getConnection();
    	ps = con.prepareStatement("SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON c.cust_id = r.cust_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE r.pet_id = ?");
            ps.setInt(1, petID);
            rs = ps.executeQuery();

            if (rs.next()) {
            	postadopts.setPostID(rs.getInt("post_id"));
            	postadopts.setRequestID(rs.getInt("request_id"));
            	postadopts.setCustID(rs.getInt("cust_id"));
            	postadopts.setCustName(rs.getString("cust_name"));
            	postadopts.setPetID(rs.getInt("pets_id"));
            	postadopts.setPetName(rs.getString("pets_name"));
            	postadopts.setPostActivity(rs.getString("post_activity"));
            	postadopts.setSubmissionTime(rs.getDate("submission_date"));

                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    postadopts.setPostImgBase64(base64Image);
                }
            }
                con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public static PostAdoptionBean getAllsPostAdoptByPetID(int petID) {
    	PostAdoptionBean postadopts = new PostAdoptionBean();
    	try {
    		con = ConnectionManager.getConnection();
    	ps = con.prepareStatement("SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date, pa.update_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON c.cust_id = r.cust_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE r.pets_id = ?");
            ps.setInt(1, petID);
            rs = ps.executeQuery();

            if (rs.next()) {
            	postadopts.setPostID(rs.getInt("post_id"));
            	postadopts.setRequestID(rs.getInt("request_id"));
            	postadopts.setCustID(rs.getInt("cust_id"));
            	postadopts.setCustName(rs.getString("cust_name"));
            	postadopts.setPetID(rs.getInt("pets_id"));
            	postadopts.setPetName(rs.getString("pets_name"));
            	postadopts.setPostActivity(rs.getString("post_activity"));
            	postadopts.setSubmissionTime(rs.getDate("submission_date"));
            	postadopts.setUpdateTime(rs.getDate("update_date"));

                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    postadopts.setPostImgBase64(base64Image);
                }
            }
            ps.executeUpdate();
            System.out.println("Successfully updated post adoption");
            
                con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public static PostAdoptionBean getAllPostAdoptByID(int postID) {
    	PostAdoptionBean postadopts = new PostAdoptionBean();
    	try {
    		con = ConnectionManager.getConnection();
    	ps = con.prepareStatement("SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON c.cust_id = r.cust_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE r.post_id = ?");
            ps.setInt(1, postID);
            rs = ps.executeQuery();

            if (rs.next()) {
            	postadopts.setPostID(rs.getInt("post_id"));
            	postadopts.setRequestID(rs.getInt("request_id"));
            	postadopts.setCustID(rs.getInt("cust_id"));
            	postadopts.setCustName(rs.getString("cust_name"));
            	postadopts.setPetID(rs.getInt("pets_id"));
            	postadopts.setPetName(rs.getString("pets_name"));
            	postadopts.setPostActivity(rs.getString("post_activity"));
            	postadopts.setSubmissionTime(rs.getDate("submission_date"));

                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    postadopts.setPostImgBase64(base64Image);
                }
            }
                con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public List<PostAdoptionBean> getAllSubmittedPostAdopts() {
        List<PostAdoptionBean> postadopts = new ArrayList<>();
        String query = "SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON pa.request_id = r.request_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE pa.post_activity = 'Second Vaccination'"+
                "ORDER BY pa.post_id";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PostAdoptionBean pa = new PostAdoptionBean();
                pa.setPostID(rs.getInt("post_id"));
                pa.setRequestID(rs.getInt("request_id"));
                pa.setCustID(rs.getInt("cust_id"));
                pa.setCustName(rs.getString("cust_name"));
                pa.setPetID(rs.getInt("pets_id"));
                pa.setPetName(rs.getString("pets_name"));
                pa.setPostActivity(rs.getString("post_activity"));
                pa.setSubmissionTime(rs.getDate("submission_date"));

                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    pa.setPostImgBase64(base64Image);
                }

                postadopts.add(pa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public List<PostAdoptionBean> getAllSubmittedPostAdopts2() {
        List<PostAdoptionBean> postadopts = new ArrayList<>();
        String query = "SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON pa.request_id = r.request_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE pa.post_activity = 'Pet''s Current Condition'" + // Escape the single quote
                "ORDER BY pa.post_id";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PostAdoptionBean pa = new PostAdoptionBean();
                pa.setPostID(rs.getInt("post_id"));
                pa.setRequestID(rs.getInt("request_id"));
                pa.setCustID(rs.getInt("cust_id"));
                pa.setCustName(rs.getString("cust_name"));
                pa.setPetID(rs.getInt("pets_id"));
                pa.setPetName(rs.getString("pets_name"));
                pa.setPostActivity(rs.getString("post_activity"));
                pa.setSubmissionTime(rs.getDate("submission_date"));

                byte[] imageData = rs.getBytes("post_img");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    pa.setPostImgBase64(base64Image);
                }

                postadopts.add(pa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    
    public List<PostAdoptionBean> getAllSubmittedPostAdoptsByCustID(int custID) {
        List<PostAdoptionBean> postadopts = new ArrayList<>();
        String query = "SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON pa.request_id = r.request_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE pa.post_activity = 'Second Vaccination' AND c.cust_id = ? " +
                "ORDER BY pa.post_id";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, custID);  // Set the customer ID parameter

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PostAdoptionBean pa = new PostAdoptionBean();
                    pa.setPostID(rs.getInt("post_id"));
                    pa.setRequestID(rs.getInt("request_id"));
                    pa.setCustID(rs.getInt("cust_id"));
                    pa.setCustName(rs.getString("cust_name"));
                    pa.setPetID(rs.getInt("pets_id"));
                    pa.setPetName(rs.getString("pets_name"));
                    pa.setPostActivity(rs.getString("post_activity"));
                    pa.setSubmissionTime(rs.getDate("submission_date"));

                    byte[] imageData = rs.getBytes("post_img");
                    if (imageData != null && imageData.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        pa.setPostImgBase64(base64Image);
                    }

                    postadopts.add(pa);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postadopts;
    }

    
    public List<PostAdoptionBean> getAllSubmittedPostAdoptsByCustID2(int custID) {
        List<PostAdoptionBean> postadopts = new ArrayList<>();
        String query = "SELECT pa.post_id, r.request_id, c.cust_id, c.cust_name, p.pets_id, p.pets_name, pa.post_activity, pa.post_img, pa.submission_date " +
                "FROM postadopt pa " +
                "JOIN customers c ON pa.cust_id = c.cust_id " +
                "JOIN request r ON pa.request_id = r.request_id " +
                "JOIN pets p ON r.pets_id = p.pets_id " +
                "WHERE pa.post_activity = 'Pet''s Current Condition' AND c.cust_id = ? " +
                "ORDER BY pa.post_id";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, custID);  // Set the customer ID parameter

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PostAdoptionBean pa = new PostAdoptionBean();
                    pa.setPostID(rs.getInt("post_id"));
                    pa.setRequestID(rs.getInt("request_id"));
                    pa.setCustID(rs.getInt("cust_id"));
                    pa.setCustName(rs.getString("cust_name"));
                    pa.setPetID(rs.getInt("pets_id"));
                    pa.setPetName(rs.getString("pets_name"));
                    pa.setPostActivity(rs.getString("post_activity"));
                    pa.setSubmissionTime(rs.getDate("submission_date"));

                    byte[] imageData = rs.getBytes("post_img");
                    if (imageData != null && imageData.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        pa.setPostImgBase64(base64Image);
                    }

                    postadopts.add(pa);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postadopts;
    }
    public void deletePostAdoption(int postID) {
        try {
            con = ConnectionManager.getConnection();
            ps = con.prepareStatement("DELETE FROM postadopt WHERE post_id=?");
            ps.setInt(1, postID);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:postgresql://localhost:5432/AdoptionSystemDB";
        String username = "postgres";
        String password = "2021477394";
        return DriverManager.getConnection(jdbcURL, username, password);
    }
}
