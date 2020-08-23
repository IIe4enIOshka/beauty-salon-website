package model;

public class RequestData {
    int id;
    private String Title;
    private String NameM;
    private String Time;

    public RequestData(int id, String Title, String NameM, String Time) {
        this.id = id;
        this.Title = Title;
        this.NameM = NameM;
        this.Time = Time;
    }

    public int getId(){return id;}

    public void setId(int id){this.id = id;}

    public String getTitle(){return Title;}

    public void setTitle(String Title){this.Title = Title;}

    public String getNameM() {
        return NameM;
    }

    public void setNameM(String NameM) {
        this.NameM = NameM;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) { this.Time = Time; }
}
