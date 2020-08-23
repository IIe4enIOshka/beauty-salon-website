package model;

public class Request {
    private String Title1;
    private String Title2;
    private String NameM1;
    private String NameM2;
    private String Time1;
    private String Time2;
    private String login;


    public Request(String Title1, String Title2, String NameM1, String NameM2, String Time1, String Time2, String login) {
        this.Title1 = Title1;
        this.Title2 = Title2;
        this.NameM1 = NameM1;
        this.NameM2 = NameM2;
        this.Time1 = Time1;
        this.Time2 = Time2;
        this.login = login;
    }

    public Request(String Title, String NameM, String Time, String login) {
        this.Title1 = Title;
        this.NameM1 = NameM;
        this.Time1 = Time;
        this.login = login;
    }

    public void setTitle1(String Title1) {
        this.Title1 = Title1;
    }

    public void setTitle2(String Title2) {
        this.Title2 = Title2;
    }

    public void setNameM1(String NameM1) { this.NameM1 = NameM1; }

    public void setNameM2(String NameM2) {
        this.NameM2 = NameM2;
    }

    public void setTime1(String Time1) {
        this.Time1 = Time1;
    }

    public void setTime2(String Time2) {
        this.Time2 = Time2;
    }

    public void setlogin(String login) {
        this.login = login;
    }


    public String getTitle1() {
        return Title1;
    }

    public String getTitle2() {
        return Title2;
    }

    public String getNameM1() {
        return NameM1;
    }

    public String getNameM2() {
        return NameM2;
    }

    public String getTime1() {
        return Time1;
    }

    public String getTime2() { return Time2; }

    public String getlogin() {
        return login;
    }

}
