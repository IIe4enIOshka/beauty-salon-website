package dao;

import com.google.gson.Gson;
import model.Request;
import model.dataBD;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RequestDao extends HttpServlet {
    private final String url = "jdbc:mysql://localhost:3306/site?useUnicode=true&serverTimezone=UTC";
    private final String username = "root";
    private final String pass = "";
    private Connection connection;
    private Statement statement;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");    // задание драйвера для связи с БД
            try {
                connection = DriverManager.getConnection(url, username, pass);
                System.out.println("Соединение установлено");
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        } catch (ClassNotFoundException exc) {
            System.out.println(exc.getMessage());
        }
        return connection;    //возврат объекта соединения с БД
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8"); //устанавливаем кодировку для ответа
        int i = 0;
        List<dataBD> dataList = new LinkedList<dataBD>();
        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            InputStream in = request.getInputStream();
            Scanner s = new Scanner(in, "UTF-8");
            String json = s.nextLine();
// Опционально: десериализуем полученный JSON в Map. библиотека Gson.
            Map<String, Object> result = new Gson().fromJson(json, Map.class);

            String dataLocal = (String) result.get("date_string");

            ResultSet rs = statement.executeQuery("SELECT * FROM `data` WHERE `date_string` >= '" + dataLocal + " 00:00:00' AND `date_string` <= '" + dataLocal + " 24:00:00'");
            while (rs.next()) {


                // По каждой записи выборки формируется
                // объект класса ReviewBD.
                // Значения свойств заполяются из полей записи
                dataBD dataBD = new dataBD(
                        rs.getInt("id"),
                        rs.getString("date_string"),
                        rs.getInt("id_master"));
                dataList.add(dataBD);
                i++;
            }

        } catch (SQLException e) {
        } finally {
            try {
                statement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (i > 0) {
            String employeeJsonString = new Gson().toJson(dataList);
            System.out.println(employeeJsonString);

            PrintWriter writer = response.getWriter();
            try {
                writer.println(employeeJsonString);
            } finally {
                writer.close();
            }
        } else {
            String employeeJsonString = "{\"status\":\"fail\",\"message\":\"fail\"}";
            System.out.println(employeeJsonString);

            PrintWriter writer = response.getWriter();
            try {
                writer.println(employeeJsonString);
            } finally {
                writer.close();
            }
        }
    }

    public boolean AddRequest(Request request1) {
        int res = 0;
        int id_master = 0;

        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            res = statement.executeUpdate(
                    "INSERT INTO request (`Title`, `NameM`, `login`, `time`)" +
                            "VALUES('" +
                            request1.getTitle1() + "', '" +
                            request1.getNameM1() + "', '" +
                            request1.getlogin() + "', '" +
                            request1.getTime1() + "');");    // выполнение запроса к БД


            if(request1.getNameM2()!=null){
                System.out.println(request1.getTitle1());
                System.out.println(request1.getTitle2());
                res = statement.executeUpdate(
                        "INSERT INTO request (`Title`, `NameM`, `login`, `time`)" +
                                "VALUES('" +
                                request1.getTitle2() + "', '" +
                                request1.getNameM2() + "', '" +
                                request1.getlogin() + "', '" +
                                request1.getTime2() + "');");    // выполнение запроса к БД
            }


            if(res == 1){


                if(request1.getNameM2()!=null){

                    if(request1.getNameM2().equals("Дубинина Татьяна")){
                        id_master = 1;
                    }

                    else if(request1.getNameM2().equals("Мазуренко Елена")){
                        id_master = 2;
                    }

                    else if(request1.getNameM2().equals("Калинина Елена")){
                        id_master = 3;
                    }

                    else if(request1.getNameM2().equals("Цветкова Ксения")){
                        id_master = 4;
                    }

                    res = statement.executeUpdate(
                            "INSERT INTO data (`date_string`, `id_master`)" +
                                    "VALUES('" +
                                    request1.getTime2() + "', '" +
                                    id_master + "');");    // выполнение запроса к БД
                }


                if(request1.getNameM1().equals("Дубинина Татьяна")){
                    id_master = 1;
                }

                else if(request1.getNameM1().equals("Мазуренко Елена")){
                    id_master = 2;
                }

                else if(request1.getNameM1().equals("Калинина Елена")){
                    id_master = 3;
                }

                else if(request1.getNameM1().equals("Цветкова Ксения")){
                    id_master = 4;
                }

                res = statement.executeUpdate(
                        "INSERT INTO data (`date_string`, `id_master`)" +
                                "VALUES('" +
                                request1.getTime1() + "', '" +
                                id_master + "');");    // выполнение запроса к БД
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (res == 0) return false;
        else return true;
    }
}
