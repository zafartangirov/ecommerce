package uz.pdp.demo5.servlets;

import uz.pdp.demo5.DB;
import uz.pdp.demo5.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/category/add")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        DB.CATEGORIES.add(new Category(name));
        resp.sendRedirect("/category.jsp");
    }
}
