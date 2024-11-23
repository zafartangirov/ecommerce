package uz.pdp.demo5.servlets;

import uz.pdp.demo5.DB;
import uz.pdp.demo5.entity.Category;
import uz.pdp.demo5.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


@WebServlet("/product/add")
@MultipartConfig

public class AddProductServlet extends HttpServlet {

    String absolutePath = "/Users/user/IdeaProjects/demo5/files/";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer categorySelect = Integer.parseInt(req.getParameter("category_select"));
        int categoryId = 0;
        for (Category category : DB.CATEGORIES) {
            if (category.getId().equals(categorySelect)){
                categoryId = category.getId();
            }
        }
        Part part = req.getPart("productImage");
        byte[] bytes = part.getInputStream().readAllBytes();
        Path path = Files.write(Path.of(absolutePath + UUID.randomUUID() + ".jpg"), bytes);

        String name = req.getParameter("name");

        int price = Integer.parseInt(req.getParameter("price"));
        String photoUrl = path.toString();
        Product product = new Product(
              name,
              price,
              categoryId,
              photoUrl
        );

        DB.PRODUCTS.add(product);
        resp.sendRedirect("/product.jsp");
    }
}
