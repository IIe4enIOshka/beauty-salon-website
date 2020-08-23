package servlet;

import com.google.gson.Gson;
import dao.UserDao;
import model.User;
import model.Responce;


import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Map;
import java.util.Scanner;

public class AddUser extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
//      получить данные из запроса
        InputStream in = request.getInputStream();
        Scanner s = new Scanner(in, "UTF-8");
        String json = s.nextLine();
// Опционально: десериализуем полученный JSON в Map. библиотека Gson.
        Map<String, Object> result = new Gson().fromJson(json, Map.class);

        String login = (String) result.get("login");
        String password = (String) result.get("password");
        String email = (String) result.get("email");
        String Fame = (String) result.get("Fame");
        String Lame = (String) result.get("Lame");

        password = Base64.getEncoder().encodeToString(password.getBytes());

        // создать    JavaBean
        User newUser = new User();
        newUser.setUser(login);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setFame(Fame);
        newUser.setLame(Lame);

        // сохранить пользователя в БД
        UserDao userDao = new UserDao();
        boolean res = userDao.AddUser(newUser);
        if (res) {
//            request.setAttribute("user", newUser);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/successRegistration.jsp");
//            requestDispatcher.forward(request, response);
            Responce responce = new Responce("success", "success");
            String employeeJsonString = new Gson().toJson(responce);
            System.out.println(employeeJsonString);

            PrintWriter out = response.getWriter();
            response.setContentType("application/json; charset=utf-8");

            out.print(employeeJsonString);
            out.flush();

        } else {
            Responce responce = new Responce("fail", "fail");
            String employeeJsonString = new Gson().toJson(responce);
            System.out.println(employeeJsonString);

            PrintWriter out = response.getWriter();
            response.setContentType("application/json; charset=utf-8");

            out.print(employeeJsonString);
            out.flush();
        }
    }
}
