package dao;

import com.google.gson.Gson;
import model.RequestData;
import model.Responce;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class DeleteDao extends HttpServlet {

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
        int res = 0;
        List<RequestData> dataList = new LinkedList<RequestData>();
        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            InputStream in = request.getInputStream();
            Scanner s = new Scanner(in, "UTF-8");
            String json = s.nextLine();
// Опционально: десериализуем полученный JSON в Map. библиотека Gson.
            Map<String, Object> result = new Gson().fromJson(json, Map.class);

            String id = (String) result.get("id");

            ResultSet rs = statement.executeQuery("SELECT * FROM `request` WHERE `id` = '" + id + "'");
            String Time = "";
            while(rs.next()){
                Time = rs.getString("Time");
            }

            res = statement.executeUpdate("DELETE FROM `request` WHERE id = '" + id + "'");

            if(res == 1){
                res = statement.executeUpdate("DELETE FROM `data` WHERE date_string = '" + Time + "'");
            }

            if(res == 1){
                Responce responce = new Responce("success", "success");
                String employeeJsonString = new Gson().toJson(responce);
                System.out.println(employeeJsonString);

                PrintWriter out = response.getWriter();

                out.print(employeeJsonString);
                out.flush();

            } else {

                Responce responce = new Responce("fail", "fail");
                String employeeJsonString = new Gson().toJson(responce);
                System.out.println(employeeJsonString);

                PrintWriter out = response.getWriter();

                out.print(employeeJsonString);
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
