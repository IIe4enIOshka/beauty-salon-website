package servlet;

import com.google.gson.Gson;
import dao.RequestDao;
import model.Request;
import model.Responce;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Scanner;

public class AddRequest extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Request request1 = null;

        //получить данные из запроса
        InputStream in = request.getInputStream();
        Scanner s = new Scanner(in, "UTF-8");
        String json = s.nextLine();
        System.out.println(json);

        Map result = new Gson().fromJson(json, Map.class);

        String date_string = (String) result.get("date_string");

        String name1 = (String) result.get("name1");
        String name2 = (String) result.get("name2");
        String time1 = (String) result.get("time1");
        String time2 = (String) result.get("time2");
        String login = (String) result.get("login");

        time1 = date_string + ' ' + time1;
        time2 = date_string + ' ' + time2;

        System.out.println(time1);
        System.out.println(time2);


        if(name1!=null && name2!=null) {
            request1 = new Request("Визаж", "Маникюр", name1, name2, time1, time2, login);
        }
        else if(name1==null){
            request1 = new Request("Маникюр", name2, time2, login);
        }
        else if(name2==null){
            request1 = new Request("Визаж", name1, time1, login);
        }

        RequestDao requestDao = new RequestDao();
        boolean res = requestDao.AddRequest(request1);
        if (res) {
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
