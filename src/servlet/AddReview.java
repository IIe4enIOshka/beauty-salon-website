package servlet;

import com.google.gson.Gson;
import dao.ReviewDao;
import model.Responce;
import model.Review;

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

public class AddReview extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //получить данные из запроса
        InputStream in = request.getInputStream();
        Scanner s = new Scanner(in, "UTF-8");
        String json = s.nextLine();
        System.out.println(json);

        Map result = new Gson().fromJson(json, Map.class);

        String Fame = (String) result.get("Fame");
        String Lame = (String) result.get("Lame");
        String message = (String) result.get("message");

        System.out.println(message);
        response.setContentType("application/json; charset=utf-8"); //устанавливаем кодировку для ответа


        Review review = new Review(Fame, Lame, message);

        ReviewDao reviewDao = new ReviewDao();
        boolean res = reviewDao.AddReview(review);
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