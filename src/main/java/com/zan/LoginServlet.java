package com.zan;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LoginServlet extends HttpServlet {
    private final static String PASSWORD = "admin";
    private final static String USERNAME = "admin";
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String password = request.getParameter("password");
        String username = request.getParameter("userid");
        if (password.equals(PASSWORD) && username.equals(USERNAME)){
            Cookie userIdCookie = new Cookie("userId", username);
            userIdCookie.setMaxAge(24 * 60 * 60);
            response.addCookie(userIdCookie);
            System.out.println("Activate");
            response.getWriter().write("success");
        } else {
            response.sendError(1,"Wrong Password");
            System.out.println("Wrong Password");
        }
    }
}

