package com.zan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

//@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Map<String, Integer>> studentDataByDepartment = WelcomeService.getStudentDataByDepartment();
        request.setAttribute("studentDataByDepartment", studentDataByDepartment);
        request.getRequestDispatcher("welcome.jsp").forward(request, response);
    }
}
