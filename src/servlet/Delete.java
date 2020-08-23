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
import java.util.Map;
import java.util.Scanner;

public class Delete extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
        //получить данные из запроса
        InputStream in = request.getInputStream();
        Scanner s = new Scanner(in, "UTF-8");
        String json = s.nextLine();
        System.out.println(json);

        Map<String, Object> result = new Gson().fromJson(json, Map.class);

        String id = (String) result.get("id");
        System.out.println(id);
        int id2 = Integer.parseInt(id);
        ReviewDao reviewDao = new ReviewDao();
        boolean res = reviewDao.DeleteReview(id2);
        if(res){
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
    }
}
