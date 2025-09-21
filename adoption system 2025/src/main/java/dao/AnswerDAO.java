package dao;
import java.sql.*;
import java.util.*;
import model.AnswerBean;
import model.QuestionBean;
import db.ConnectionManager;


public class AnswerDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int AnswerID;
	 private String AnswerText;

    public void addAnswer(AnswerBean bean) {
        
    	AnswerText = bean.getAnswerText();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
            		"INSERT INTO answers (answer_text)VALUES(?)");
            
            ps.setString(1, AnswerText);

            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully inserted");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


public static List<AnswerBean> getAllAnswers() {
    List<AnswerBean> answers = new ArrayList<AnswerBean>();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        stmt = con.createStatement();
        String sql = "SELECT * FROM answers ORDER BY answer_id";

        // Execute query
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
        	AnswerBean a = new AnswerBean();
            a.setAnswerID(rs.getInt("answer_id"));
            a.setAnswerText(rs.getString("answer_text"));

            answers.add(a);
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return answers;
}


public static AnswerBean getAnswerByID(int AnswerID) {
	AnswerBean answer = new AnswerBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM answers WHERE answer_id= ?");
        ps.setInt(1, AnswerID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
        	answer.setAnswerID(rs.getInt("answer_id"));
        	answer.setAnswerText(rs.getString("answer_text"));
            
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return answer;
}


/*
 * public static AnswerBean getAnswerByPass(String CustPass) { AnswerBean answer
 * = new AnswerBean(); try { // Get connection con =
 * ConnectionManager.getConnection();
 * 
 * // Create statement ps =
 * con.prepareStatement("SELECT * FROM customers WHERE cust_pass = ?");
 * ps.setString(1, CustPass);
 * 
 * // Execute query rs = ps.executeQuery(); if (rs.next()) {
 * customer.setCustID(rs.getInt("cust_id"));
 * customer.setCustName(rs.getString("cust_name"));
 * customer.setCustPhoneNum(rs.getInt("cust_phonenum"));
 * customer.setCustEmail(rs.getString("cust_email"));
 * customer.setCustPass(rs.getString("cust_pass")); }
 * 
 * // Close connection con.close(); } catch (Exception e) { e.printStackTrace();
 * }
 * 
 * return customer; }
 */


/*
 * public void updateCustomer(CustomerBean customer) { CustID =
 * customer.getCustID(); CustName = customer.getCustName(); CustPhoneNum =
 * customer.getCustPhoneNum(); CustEmail = customer.getCustEmail(); CustPass =
 * customer.getCustPass();
 * 
 * try { // Get connection con = ConnectionManager.getConnection();
 * 
 * // Create statement ps = con.prepareStatement(
 * "UPDATE customers SET cust_name=?, cust_phonenum=?, cust_email=?, cust_pass=? WHERE cust_id=?"
 * ); ps.setString(1, CustName); ps.setInt(2, CustPhoneNum); ps.setString(3,
 * CustEmail); ps.setString(4, CustPass); ps.setInt(5, CustID);
 * 
 * // Execute query ps.executeUpdate();
 * System.out.println("Successfully updated");
 * 
 * // Close connection con.close(); } catch (Exception e) { e.printStackTrace();
 * } }
 * 
 * public void deleteCustomer(int custID) { try { // Get connection con =
 * ConnectionManager.getConnection();
 * 
 * // Create statement ps =
 * con.prepareStatement("DELETE FROM customers WHERE cust_id=?"); ps.setInt(1,
 * custID);
 * 
 * // Execute query ps.executeUpdate();
 * 
 * // Close connection con.close(); } catch (Exception e) { e.printStackTrace();
 * } }
 * 
 * 
 * public CustomerBean getCustomerByName(String CustName) { CustomerBean
 * customer = null;
 * 
 * try { // Get connection con = ConnectionManager.getConnection();
 * 
 * // Create statement ps =
 * con.prepareStatement("SELECT * FROM customers WHERE cust_name = ?");
 * ps.setString(1, CustName);
 * 
 * // Execute query rs = ps.executeQuery();
 * 
 * // Check if the customer exists if (rs.next()) { // Create the customer
 * object and populate its properties customer = new CustomerBean();
 * customer.setCustID(rs.getInt("cust_id"));
 * customer.setCustName(rs.getString("cust_name"));
 * customer.setCustPhoneNum(rs.getInt("cust_phonenum"));
 * customer.setCustEmail(rs.getString("cust_email"));
 * customer.setCustPass(rs.getString("cust_pass")); } con.close(); } catch
 * (SQLException e) { e.printStackTrace(); // Handle the exception accordingly }
 * 
 * return customer; }
 * 
 * public boolean authenticateCustomer(String custName, String custPass) {
 * CustomerBean customer = getCustomerByName(custName); return customer != null
 * && customer.getCustPass().equals(custPass); }
 * 
 * public CustomerBean validateLogin(String custName, String custPass) {
 * CustomerBean cust = null;
 * 
 * try { con = ConnectionManager.getConnection(); String query =
 * "SELECT * FROM customers WHERE cust_name = ? AND cust_pass = ?";
 * PreparedStatement stmt = con.prepareStatement(query); stmt.setString(1,
 * custName); stmt.setString(2, custPass); ResultSet rs = stmt.executeQuery();
 * 
 * if (rs.next()) { cust = new CustomerBean();
 * cust.setCustID(rs.getInt("cust_id"));
 * cust.setCustEmail(rs.getString("cust_email"));
 * cust.setCustName(rs.getString("cust_name"));
 * cust.setCustPhoneNum(rs.getInt("cust_phonenum"));
 * cust.setCustPass(rs.getString("cust_pass")); }
 * 
 * rs.close(); } catch (SQLException e) { e.printStackTrace(); }
 * 
 * return cust; }
 */

public static Connection getConnection() throws SQLException {
    String jdbcURL = "jdbc:postgresql://localhost:5432/AdoptionSystemDB";
    String username = "postgres";
    String password = "2021477394";
    return DriverManager.getConnection(jdbcURL, username, password);
}


}
