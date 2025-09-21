package model;

public class PetBean {
	private int PetID;
	private int CustID;
	private String PetType;
	 private String PetName;
	 private String PetAge;
	 private String PetGender;
	 private String PetBreed;
	 private String PetBeharvior;
	 private String PetFavFood;
	 private byte[] PetImg; // Assuming you'll store the file path
	 private String PetImgBase64;
	 private int StaffID;
	 public int getStaffID() {
			return StaffID;
		}
		public void setStaffID(int staffID) {
			StaffID = staffID;
		}
	 public int getCustID() {
			return CustID;
		}
		public void setCustID(int custID) {
			CustID = custID;
		}
	 public int getPetID() {
	  return PetID;
	 }
	 public void setPetID(int petID) {
		 PetID = petID;
	 }
	 public String getPetName() {
	  return PetName;
	 }
	 public void setPetName(String petName) {
		 PetName = petName;
	 }
	 public String getPetType() {
	  return PetType;
	 }
	 public void setPetType(String petType) {
		PetType = petType;
	 }
	 public String getPetAge() {
	  return PetAge;
	 }
	 public void setPetAge(String petAge) {
		 PetAge = petAge;
	 }
	 public String getPetGender() {
	  return PetGender;
	 }
	 public void setPetGender(String petGender) {
		 PetGender = petGender;
	 }
	 public String getPetBreed() {
	  return PetBreed;
	 }
	 public void setPetBreed(String petBreed) {
		 PetBreed = petBreed;
	 }

	 public String getPetBeharvior() {
	  return PetBeharvior;
	 }
	 public void setPetBeharvior(String petBeharvior) {
		 PetBeharvior = petBeharvior;
	 }
	 
	 public String getPetFavFood() {
	  return PetFavFood;
	 }
	 public void setPetFavFood(String petFavFood) {
		 PetFavFood = petFavFood;
	 }
	 public byte[] getPetImg() {
	     return PetImg;
	 }
	 public void setPetImg(byte[] petImg) {
		 PetImg = petImg;
	 }
	 public String getPetImgBase64() {
	     return PetImgBase64;
	 }
	 public void setPetImgBase64(String petImgBase64) {
		 PetImgBase64 = petImgBase64;
	 }
}
