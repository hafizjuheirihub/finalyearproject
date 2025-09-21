package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	  static Connection con;
	  private static final String DB_DRIVER= "org.postgresql.Driver";
	  private static final String DB_CONNECTION = "jdbc:postgresql://localhost:5432/AdoptionSystemDB";
	  private static final String DB_USER = "postgres";
	  private static final String DB_PASSWORD = "2021477394";
	  
	  public static Connection getConnection() {
	  
	    try {
	      //1. load the driver
	      Class.forName(DB_DRIVER);
	      
	      try {
	        //2. create connection
	        con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
	        System.out.println("Connected");
	      }catch(SQLException e) {
	        e.printStackTrace();
	      }
	    }catch(ClassNotFoundException e) {
	      e.printStackTrace();
	    }    
	    return con;
	    
	  }
	}

