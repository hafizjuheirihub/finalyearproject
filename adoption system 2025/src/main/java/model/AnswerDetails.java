package model;
public class AnswerDetails {
    private int AnswerID;
    private String AnswerText;
    private int CustID;
    private int QuestionID;
    private String QuestionExample;

	// Getters and Setters
    public int getAnswerID() {
        return AnswerID;
    }

    public void setAnswerID(int answerID) {
        this.AnswerID = answerID;
    }

    public String getAnswertext() {
        return AnswerText;
    }

    public void setAnswertext(String answerText) {
        this.AnswerText = answerText;
    }

    public int getCustId() {
        return CustID;
    }

    public void setCustId(int custID) {
        this.CustID = custID;
    }

    public int getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(int questionID) {
        this.QuestionID = questionID;
    }

    public String getQuestionExample() {
        return QuestionExample;
    }

    public void setQuestionExample(String questionExample) {
        this.QuestionExample = questionExample;
    }
}