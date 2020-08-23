package model;

public class Review {
    private String Fame;
    private String Lame;
    private String message;

    public Review(String Fame, String Lame, String message) {
        this.Fame = Fame;
        this.Lame = Lame;
        this.message = message;
    }

    public void setFame(String Fame) {
        this.Fame = Fame;
    }

    public void setLame(String Lame) {
        this.Lame = Lame;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFame() {
        return Fame;
    }

    public String getLame() {
        return Lame;
    }

    public String getMessage() {
        return message;
    }
}
