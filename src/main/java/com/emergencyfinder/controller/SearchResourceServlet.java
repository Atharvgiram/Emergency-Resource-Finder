package com.emergencyfinder.controller;

import com.emergencyfinder.dao.ResourceDAO;
import com.emergencyfinder.model.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search-resource")
public class SearchResourceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        String type = request.getParameter("type");
        String area = request.getParameter("area");

        List<Resource> resources = new ResourceDAO().search(category, type, area);

        request.setAttribute("resources", resources);
        request.setAttribute("category", category);
        request.getRequestDispatcher("search-results.jsp").forward(request, response);
    }
}
