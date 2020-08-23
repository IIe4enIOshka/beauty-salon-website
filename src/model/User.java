package model;

import java.io.Serializable;

public class User  implements Serializable
{
    // методы доступа к полям бина
    public String getUser(){return user;}
    public void setUser(String user){this.user = user;}
    public String getPassword(){return password;}
    public void setPassword(String password){this.password = password;}
    public String getEmail(){return email;}
    public String getFame(){return Fame;}
    public String getLame(){return Lame;}
    public void setFame(String Fame){this.Fame = Fame;}
    public void setLame(String Lame){this.Lame = Lame;}
    public void setEmail(String email){this.email = email;}

    private String user;
    private String password;
    private String email;
    private String Fame;
    private String Lame;
}