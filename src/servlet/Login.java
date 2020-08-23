package servlet;

import com.google.gson.Gson;
import dao.UserDao;
import model.Responce;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Map;
import java.util.Scanner;

public class Login extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String login = request.getParameter("login");
//        byte[] array = login.getBytes("UTF-8");
//
//        String password = request.getParameter("password");
//
//        password = Base64.getEncoder().encodeToString(password.getBytes());

//         получить данные из запроса
        InputStream in = request.getInputStream();
        Scanner s = new Scanner(in, "UTF-8");
        String json = s.nextLine();

        Map<String, Object> result = new Gson().fromJson(json, Map.class);

        String login = (String) result.get("login");
        String password = (String) result.get("password");

        System.out.print(login);

        password = Base64.getEncoder().encodeToString(password.getBytes());

        User user = new User();
        user.setUser(login);
        user.setPassword(password);

        UserDao userDao = new UserDao();
        boolean res = userDao.SearchUser(user);
        if (res) {
            request.getSession().setAttribute("login", login);
            request.getSession().setAttribute("Fame", user.getFame());
            request.getSession().setAttribute("Lame", user.getLame());
            System.out.println("В логин"+ user.getLame());

            //request.setAttribute("user", user);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
//            requestDispatcher.forward(request, response);

            Responce responce = new Responce("success", "success");
            String employeeJsonString = new Gson().toJson(responce);
            System.out.println(employeeJsonString);

            PrintWriter out = response.getWriter();
            response.setContentType("application/json; charset=utf-8");

            out.print(employeeJsonString);
            out.flush();

        } else {
//            request.setAttribute("status", "Fail_login");
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
//            requestDispatcher.forward(request, response);

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
