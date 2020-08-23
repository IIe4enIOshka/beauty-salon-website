package model;

public class ReviewBD {
    private int id;
    private String USERNAME;
    private String FAM;
    private String Message;
    private String data;

    public ReviewBD() {
    }

    public ReviewBD(int id, String USERNAME, String FAM, String message, String data) {
        this.id = id;
        this.USERNAME = USERNAME;
        this.FAM = FAM;
        this.Message = message;
        this.data = data;
    }
    public int getID(){return id;}
    public String getUSERNAME(){return USERNAME;}
    public String getFAM(){return FAM;}
    public String getMessage(){return Message;}
    public String getData(){return data;}
    public void setID(int id){this.id = id;}
    public void setUSERNAME(String USERNAME){this.USERNAME = USERNAME;}
    public void setFAM(String FAM){this.FAM = FAM;}
    public void setMessage(String message){this.Message = message;}
    public void setData(String data){this.data = data;}
}
