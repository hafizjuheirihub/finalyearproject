package model;
import java.sql.Date;
public class PostAdoptionBean {
	private int PostID;
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
	 private String Status;
	 private String Remarks;
	 private String PostActivity;
	 private byte[] PostImg; // Assuming you'll store the file path
	 private String PostImgBase64;
	 private Date submissionTime;
	 private Date updateTime;
	
	public int getPostID() {
		return PostID;
	}
	public void setPostID(int postID) {
		PostID = postID;
	}
	public int getRequestID() {
		return RequestID;
	}
	public void setRequestID(int requestID) {
		RequestID = requestID;
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
	public String getPetType() {
		return PetType;
	}
	public void setPetType(String petType) {
		PetType = petType;
	}
	public String getPetName() {
		return PetName;
	}
	public void setPetName(String petName) {
		PetName = petName;
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
	public String getCustName() {
		return CustName;
	}
	public void setCustName(String custName) {
		CustName = custName;
	}
	public int getCustPhoneNum() {
		return CustPhoneNum;
	}
	public void setCustPhoneNum(int custPhoneNum) {
		CustPhoneNum = custPhoneNum;
	}
	public String getCustEmail() {
		return CustEmail;
	}
	public void setCustEmail(String custEmail) {
		CustEmail = custEmail;
	}
	public String getCustPass() {
		return CustPass;
	}
	public void setCustPass(String custPass) {
		CustPass = custPass;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getRemarks() {
		return Remarks;
	}
	public void setRemarks(String remarks) {
		Remarks = remarks;
	}
	public String getPostActivity() {
		return PostActivity;
	}
	public void setPostActivity(String postActivity) {
		PostActivity = postActivity;
	}
	public byte[] getPostImg() {
		return PostImg;
	}
	public void setPostImg(byte[] postImg) {
		PostImg = postImg;
	}
	public String getPostImgBase64() {
		return PostImgBase64;
	}
	public void setPostImgBase64(String postImgBase64) {
		PostImgBase64 = postImgBase64;
	}
	public Date getSubmissionTime() {
		return submissionTime;
	}
	public void setSubmissionTime(Date submissionTime) {
		this.submissionTime = submissionTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}