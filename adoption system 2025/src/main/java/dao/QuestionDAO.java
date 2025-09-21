package dao;
import java.sql.*;
import java.util.*;

import model.QuestionBean;
import db.ConnectionManager;


public class QuestionDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int QuestionID;
    private String QuestionExample;
    
    public void addQuestion(QuestionBean bean) {
        
    	QuestionExample = bean.getQuestionExample();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
            		"INSERT INTO question (question_example)VALUES(?)");
            
            ps.setString(1, QuestionExample);

            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully inserted");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


public static List<QuestionBean> getAllQuestions() {
    List<QuestionBean> questions = new ArrayList<QuestionBean>();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        stmt = con.createStatement();
        String sql = "SELECT * FROM question ORDER BY question_id";

        // Execute query
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
        	QuestionBean q = new QuestionBean();
            q.setQuestionID(rs.getInt("question_id"));
            q.setQuestionExample(rs.getString("question_example"));
           
            questions.add(q);
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return questions;
}

public static QuestionBean getQuestionByID(int QuestionID) {
	QuestionBean question = new QuestionBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM question WHERE question_id= ?");
        ps.setInt(1, QuestionID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
        	question.setQuestionID(rs.getInt("question_id"));
        	question.setQuestionExample(rs.getString("question_example"));
            
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return question;
}



public void updateQuestion(QuestionBean question) {
    QuestionID = question.getQuestionID();
    QuestionExample = question.getQuestionExample();
    

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement(
                "UPDATE question SET question_example=? WHERE question_id=?");
        ps.setString(1, QuestionExample);
        ps.setInt(2, QuestionID);

        // Execute query
        ps.executeUpdate();
        System.out.println("Successfully updated");

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deleteQuestion(int questionID) {
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("DELETE FROM question WHERE question_id=?");
        ps.setInt(1, questionID);

        // Execute query
        ps.executeUpdate();

        // Close connection
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
