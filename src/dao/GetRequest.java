package dao;

import com.google.gson.Gson;
import model.RequestData;
import model.dataBD;

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
import java.util.logging.Level;
import java.util.logging.Logger;

public class GetRequest extends HttpServlet {

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
        List<RequestData> dataList = new LinkedList<RequestData>();
        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            InputStream in = request.getInputStream();
            Scanner s = new Scanner(in, "UTF-8");
            String json = s.nextLine();
// Опционально: десериализуем полученный JSON в Map. библиотека Gson.
            Map<String, Object> result = new Gson().fromJson(json, Map.class);

            String login = (String) result.get("login");

            System.out.println(login);

            ResultSet rs = statement.executeQuery("SELECT * FROM `request` WHERE `login` = '" + login + "' ORDER BY `time` ASC");

            while (rs.next()) {
                // По каждой записи выборки формируется
                // объект класса ReviewBD.
                // Значения свойств заполяются из полей записи
                RequestData requestData = new RequestData(
                        rs.getInt("id"),
                        rs.getString("Title"),
                        rs.getString("NameM"),
                        rs.getString("Time"));
                dataList.add(requestData);
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
}
