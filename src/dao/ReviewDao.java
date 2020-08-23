package dao;

import com.google.gson.Gson;
import model.Responce;
import model.Review;
import model.ReviewBD;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
public class ReviewDao extends HttpServlet {
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


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8"); //устанавливаем кодировку для ответа
        int i = 0;
        List<ReviewBD> reviewBDList = new LinkedList<ReviewBD>();
        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM `review` ORDER BY id DESC");

            while (rs.next()) {
                // По каждой записи выборки формируется
                // объект класса ReviewBD.
                // Значения свойств заполяются из полей записи
                ReviewBD reviewBD = new ReviewBD(
                        rs.getInt("id"),
                        rs.getString("Fname"),
                        rs.getString("Lname"),
                        rs.getString("message"),
                        rs.getString("data_message"));
                reviewBDList.add(reviewBD);

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
//            request.setAttribute("list", reviewBDList);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
//            requestDispatcher.forward(request, response);

            String employeeJsonString = new Gson().toJson(reviewBDList);
            System.out.println(employeeJsonString);

            PrintWriter writer = response.getWriter();
            try {
                writer.println(employeeJsonString);
            } finally {
                writer.close();
            }
        }
        else{
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

    public boolean AddReview(Review review) {
        int res = 0;
        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            System.out.println(dateFormat.format(date));//2016/11/16

                res = statement.executeUpdate(
                        "INSERT INTO review (`Fname`, `Lname`, `message`, `data_message`)" +
                                "VALUES('" +
                                review.getFame() + "', '" +
                                review.getLame() + "', '" +
                                review.getMessage() + "', '" +
                                dateFormat.format(date) + "')");   // выполнение запроса к БД
        } catch (SQLException e) {
        } finally {
            try {
                statement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (res == 0) return false;
        else return true;
    }

    public boolean DeleteReview(int id) {
        int res = 0;
        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();
            //сложный запрос или через два запроса
            res = statement.executeUpdate("DELETE FROM review WHERE id = '" + id + "'");
        } catch (SQLException e) {
        } finally {
            try {
                statement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (res == 0) return false;
        else return true;
    }
}
