package dao;

import model.ReviewBD;
import model.User;

import java.sql.Connection;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao {
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
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        } catch (ClassNotFoundException exc) {
            System.out.println(exc.getMessage());
        }
        return connection;    //возврат объекта соединения с БД
    }

    public boolean AddUser(User newUser) {
        int res = 0;
        try {

            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM `users` WHERE `login`='" + newUser.getUser() + "'");

            if (!rs.next())
                System.out.println(res);
                res = statement.executeUpdate(
                        "INSERT INTO `users` (`login`, `password`, `email`, `Fname`, `Lname`) " +
                                "VALUES('" +
                                newUser.getUser() + "', '" +
                                newUser.getPassword() + "', '" +
                                newUser.getEmail() + "', '" +
                                newUser.getFame() + "', '" +
                                newUser.getLame() + "')");    // выполнение запроса к БД
            System.out.println("hello");
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

    public boolean SearchUser(User user) {
        int res = 0;

        try {
            connection = getConnection();    // соединение с БД
            statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM `users` WHERE `login`='" + user.getUser() + "' AND `password` = '" + user.getPassword() + "'");
            if (rs.next()) {
                user.setFame(rs.getString("Fname"));
                user.setLame(rs.getString("Lname"));
                System.out.println("В узердао"+ user.getLame());
                res = 1;
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

        if (res == 0) return false;
        else return true;
    }
}