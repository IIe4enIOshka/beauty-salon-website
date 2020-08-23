package model;

public class dataBD {

    private int id;
    private String Data;
    private int id_master;

    public dataBD(int id, String Data, int id_master) {
        this.id = id;
        this.Data = Data;
        this.id_master = id_master;
    }
    public int getID(){return id;}

    public void setID(int id){this.id = id;}

    public String getData() {
        return Data;
    }

    public void setData(String Data) {
        this.Data = Data;
    }

    public int getid_master() {
        return id_master;
    }

    public void setid_master(int id_master) { this.id_master = id_master; }

}
