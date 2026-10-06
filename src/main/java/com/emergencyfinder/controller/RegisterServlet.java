package com.emergencyfinder.controller;

import com.emergencyfinder.dao.UserDAO;
import com.emergencyfinder.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setMobile(request.getParameter("mobile"));
        user.setPassword(request.getParameter("password"));

        if (new UserDAO().register(user)) {
            response.sendRedirect("login.jsp?success=Registration successful");
        } else {
            response.sendRedirect("register.jsp?error=Email may already exist");
        }
    }
}
