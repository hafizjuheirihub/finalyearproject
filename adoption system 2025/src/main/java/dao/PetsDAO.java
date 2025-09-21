package dao;
import java.sql.*;
import java.util.*;
import java.util.Base64;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import model.PetBean;
import db.ConnectionManager;


public class PetsDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int PetID;
	private String PetType;
	 private String PetName;
	 private String PetAge;
	 private String PetGender;
	 private String PetBreed;
	 private String PetBeharvior;
	 private String PetFavFood;
	 private byte[] PetImg;
	 private int StaffID;

	 public void addPet(PetBean bean, byte[] imageData) {
		    try {
		        // Get connection
		        con = ConnectionManager.getConnection();

		        // Create statement
		        ps = con.prepareStatement(
		                "INSERT INTO pets (pets_type, pets_name, pets_dob, pets_gender, pets_breed, pets_beharvior, pets_favfood, pets_img, staff_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		        ps.setString(1, bean.getPetType());
		        ps.setString(2, bean.getPetName());
		        ps.setString(3, bean.getPetAge());
		        ps.setString(4, bean.getPetGender());
		        ps.setString(5, bean.getPetBreed());
		        ps.setString(6, bean.getPetBeharvior());
		        ps.setString(7, bean.getPetFavFood());
		        ps.setBytes(8, imageData);
		        ps.setInt(9, bean.getStaffID());

		        // Execute query
		        ps.executeUpdate();
		        System.out.println("Successfully inserted");

		        // Close connection
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}

	 public static List<PetBean> getAllPetss() {
		    List<PetBean> pets = new ArrayList<>();
		    Connection con = null;
		    Statement stmt = null;
		    ResultSet rs = null;

		    try {
		        // Get connection
		        con = ConnectionManager.getConnection();

		        // Create statement
		        stmt = con.createStatement();
		        String sql = "SELECT * " +
		                     "FROM pets p " +  // Add space after 'p'
						/* "JOIN staff s ON p.staff_id = s.staff_id " + */   // Add space before 'JOIN'
		                     "ORDER BY p.pets_id";

		        // Execute query
		        rs = stmt.executeQuery(sql);

		        while (rs.next()) {
		            PetBean p = new PetBean();
		            p.setPetID(rs.getInt("pets_id"));
		            p.setPetType(rs.getString("pets_type"));
		            p.setPetName(rs.getString("pets_name"));
		            p.setPetAge(rs.getString("pets_dob"));
		            p.setPetGender(rs.getString("pets_gender"));
		            p.setPetBreed(rs.getString("pets_breed"));
		            p.setPetBeharvior(rs.getString("pets_beharvior"));
		            p.setPetFavFood(rs.getString("pets_favfood"));

		            // Retrieve image data as bytes
		            byte[] imageData = rs.getBytes("pets_img");
		            if (imageData != null && imageData.length > 0) {
		                String base64Image = Base64.getEncoder().encodeToString(imageData);
		                p.setPetImgBase64(base64Image); // Set the base64 image string
		                System.out.println("Base64 Image: " + base64Image.substring(0, 50)); // Debugging log
		            } else {
		                System.out.println("No image data found for pet ID: " + rs.getInt("pets_id")); // Debugging log
		            }
					/* p.setStaffID(rs.getInt("staff_id")); */ 
		            pets.add(p);
		        }

		        rs.close();
		        stmt.close();
		        // Close connection
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return pets;
		}
	 public static List<PetBean> getAllPets() {
		    List<PetBean> pets = new ArrayList<>();
		    Connection con = null;
		    Statement stmt = null;
		    ResultSet rs = null;

		    try {
		        // Get connection
		        con = ConnectionManager.getConnection();

		        // Create statement
		        stmt = con.createStatement();
		        String sql = "SELECT * " +
		                     "FROM pets p " +  // Add space after 'p'
						 "JOIN staff s ON p.staff_id = s.staff_id " +   // Add space before 'JOIN'
		                     "ORDER BY p.pets_id";

		        // Execute query
		        rs = stmt.executeQuery(sql);

		        while (rs.next()) {
		            PetBean p = new PetBean();
		            p.setPetID(rs.getInt("pets_id"));
		            p.setPetType(rs.getString("pets_type"));
		            p.setPetName(rs.getString("pets_name"));
		            p.setPetAge(rs.getString("pets_dob"));
		            p.setPetGender(rs.getString("pets_gender"));
		            p.setPetBreed(rs.getString("pets_breed"));
		            p.setPetBeharvior(rs.getString("pets_beharvior"));
		            p.setPetFavFood(rs.getString("pets_favfood"));

		            // Retrieve image data as bytes
		            byte[] imageData = rs.getBytes("pets_img");
		            if (imageData != null && imageData.length > 0) {
		                String base64Image = Base64.getEncoder().encodeToString(imageData);
		                p.setPetImgBase64(base64Image); // Set the base64 image string
		                System.out.println("Base64 Image: " + base64Image.substring(0, 50)); // Debugging log
		            } else {
		                System.out.println("No image data found for pet ID: " + rs.getInt("pets_id")); // Debugging log
		            }
					 p.setStaffID(rs.getInt("staff_id")); 
		            pets.add(p);
		        }

		        rs.close();
		        stmt.close();
		        // Close connection
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return pets;
		}
	 
	    public static List<PetBean> getAllNotAdoptPets() {
	        List<PetBean> pets = new ArrayList<PetBean>();

	        try {
	            // Get connection
	            con = ConnectionManager.getConnection();

	            // Create statement
	            stmt = con.createStatement();
	            String sql = "SELECT * " +
	                         "FROM pets p " +
	                         "LEFT JOIN request r ON p.pets_id = r.pets_id " +
	                         "WHERE r.status IS NULL OR r.status IN ('Reject') " +
	                         "ORDER BY p.pets_id";

	            // Execute query
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                PetBean p = new PetBean();
	                p.setPetID(rs.getInt("pets_id"));
	                p.setPetType(rs.getString("pets_type"));
	                p.setPetName(rs.getString("pets_name"));
	                p.setPetAge(rs.getString("pets_dob"));
	                p.setPetGender(rs.getString("pets_gender"));
	                p.setPetBreed(rs.getString("pets_breed"));
	                p.setPetBeharvior(rs.getString("pets_beharvior"));
	                p.setPetFavFood(rs.getString("pets_favfood"));

	                // Retrieve image data as bytes
	                byte[] imageData = rs.getBytes("pets_img");
	                if (imageData != null && imageData.length > 0) {
	                    String base64Image = Base64.getEncoder().encodeToString(imageData);
	                    p.setPetImgBase64(base64Image); // Set the base64 image string
	                    System.out.println("Base64 Image: " + base64Image.substring(0, 50)); // Debugging log
	                } else {
	                    System.out.println("No image data found for pet ID: " + rs.getInt("pets_id")); // Debugging log
	                }
	                pets.add(p);
	            }

	            // Close connection
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return pets;
	    }

public static PetBean getPetByID(int PetID) {
	PetBean pet = new PetBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT pets_id, pets_type, pets_name, pets_dob, pets_gender, pets_breed, pets_beharvior, pets_favfood "
        		+ "FROM pets WHERE pets_id= ?");
        ps.setInt(1, PetID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
        	pet.setPetID(rs.getInt("pets_id"));
        	pet.setPetType(rs.getString("pets_type"));
        	pet.setPetName(rs.getString("pets_name"));
        	pet.setPetAge(rs.getString("pets_dob"));
        	pet.setPetGender(rs.getString("pets_gender"));
        	pet.setPetBreed(rs.getString("pets_breed"));
        	pet.setPetBeharvior(rs.getString("pets_beharvior"));
        	pet.setPetFavFood(rs.getString("pets_favfood"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return pet;
}

/*public static StaffBean getStaffByPass(String StaffPass) {
	StaffBean staff = new StaffBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM staff WHERE staff_pass = ?");
        ps.setString(1, StaffPass);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
        	staff.setStaffID(rs.getInt("staff_id"));
            staff.setStaffName(rs.getString("staff_name"));
            staff.setStaffPhoneNum(rs.getInt("staff_phonenum"));
            staff.setStaffEmail(rs.getString("staff_email"));
            staff.setStaffPass(rs.getString("staff_pass"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return staff;
}*/


public void updatePet(PetBean pet) {
    PetID = pet.getPetID();
    PetType = pet.getPetType();
    PetName = pet.getPetName();
    PetAge = pet.getPetAge();
    PetGender = pet.getPetGender();
    PetBreed = pet.getPetBreed();
    PetBeharvior = pet.getPetBeharvior();
    PetFavFood = pet.getPetFavFood();
    PetImg = pet.getPetImg();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        String sql = "UPDATE pets SET pets_type=?, pets_name=?, pets_dob=?, pets_gender=?, pets_breed=?, pets_beharvior=?, pets_favfood=?";
        if (PetImg != null) {
            sql += ", pets_img=?";
        }
        sql += " WHERE pets_id=?";

        ps = con.prepareStatement(sql);
        ps.setString(1, PetType);
        ps.setString(2, PetName);
        ps.setString(3, PetAge);
        ps.setString(4, PetGender);
        ps.setString(5, PetBreed);
        ps.setString(6, PetBeharvior);
        ps.setString(7, PetFavFood);
        if (PetImg != null) {
            ps.setBytes(8, PetImg);
            ps.setInt(9, PetID);
        } else {
            ps.setInt(8, PetID);
        }

        // Execute query
        ps.executeUpdate();
        System.out.println("Successfully updated");

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deletePet(int petID) {
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("DELETE FROM pets WHERE pets_id=?");
        ps.setInt(1, petID);

        // Execute query
        ps.executeUpdate();

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


public PetBean getPetByName(String PetName) {
	PetBean pet = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM pets WHERE pets_name = ?");
        ps.setString(1, PetName);

        // Execute query
        rs = ps.executeQuery();

        // Check if the customer exists
        if (rs.next()) {
            // Create the customer object and populate its properties
        	pet = new PetBean();
        	pet.setPetID(rs.getInt("pets_id"));
        	pet.setPetType(rs.getString("pets_type"));
        	pet.setPetAge(rs.getString("pets_dob"));
        	pet.setPetName(rs.getString("pets_name"));
        	pet.setPetGender(rs.getString("pets_gender"));
        	pet.setPetBreed(rs.getString("pets_breed"));
        	pet.setPetBeharvior(rs.getString("pets_beharvior"));
        	pet.setPetFavFood(rs.getString("pets_favfood"));
        	pet.setPetImg(rs.getBytes("pet_img"));
        }
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception accordingly
    } 

    return pet;
}

public static List<PetBean> getPetsByFilters(String[] types, String search, String[] genders, String[] breeds, String age) {
    List<PetBean> pets = new ArrayList<>();

    try {
        con = ConnectionManager.getConnection();
        StringBuilder sql = new StringBuilder("SELECT * FROM pets p LEFT JOIN request r ON p.pets_id = r.pets_id WHERE (r.status IS NULL OR r.status IN ('Reject'))");

        if (types != null && types.length > 0) {
            boolean hasValidType = false;
            for (String type : types) {
                if (type != null && !type.isEmpty() && !"all".equals(type)) {
                    hasValidType = true;
                    break;
                }
            }
            if (hasValidType) {
                sql.append(" AND p.pets_type IN (").append(String.join(",", Collections.nCopies(types.length, "?"))).append(")");
            }
        }

        if (search != null && !search.isEmpty()) {
            sql.append(" AND REPLACE(p.pets_breed, ' ', '') ILIKE REPLACE(?, ' ', '')");
        }

        if (genders != null && genders.length > 0) {
            sql.append(" AND p.pets_gender IN (").append(String.join(",", Collections.nCopies(genders.length, "?"))).append(")");
        }

        if (breeds != null && breeds.length > 0) {
            sql.append(" AND p.pets_breed IN (").append(String.join(",", Collections.nCopies(breeds.length, "?"))).append(")");
        }

        sql.append(" ORDER BY p.pets_id");

        ps = con.prepareStatement(sql.toString());
        int index = 1;

        if (types != null && types.length > 0) {
            for (String type : types) {
                if (type != null && !type.isEmpty() && !"all".equals(type)) {
                    ps.setString(index++, type);
                }
            }
        }

        if (search != null && !search.isEmpty()) {
            ps.setString(index++, search);
        }

        if (genders != null && genders.length > 0) {
            for (String gender : genders) {
                ps.setString(index++, gender);
            }
        }

        if (breeds != null && breeds.length > 0) {
            for (String breed : breeds) {
                ps.setString(index++, breed);
            }
        }

        rs = ps.executeQuery();

        while (rs.next()) {
            PetBean p = new PetBean();
            p.setPetID(rs.getInt("pets_id"));
            p.setPetType(rs.getString("pets_type"));
            p.setPetName(rs.getString("pets_name"));
            p.setPetAge(rs.getString("pets_dob"));
            p.setPetGender(rs.getString("pets_gender"));
            p.setPetBreed(rs.getString("pets_breed"));
            p.setPetBeharvior(rs.getString("pets_beharvior"));
            p.setPetFavFood(rs.getString("pets_favfood"));

            byte[] imageData = rs.getBytes("pets_img");
            if (imageData != null && imageData.length > 0) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                p.setPetImgBase64(base64Image);
            }
            pets.add(p);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }

    return pets;
}

public static Connection getConnection() throws SQLException {
    String jdbcURL = "jdbc:postgresql://localhost:5432/AdoptionSystemDB";
    String username = "postgres";
    String password = "2021477394";
    return DriverManager.getConnection(jdbcURL, username, password);
}


}
