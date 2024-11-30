package uz.pdp.demo7.servlets.user;

import uz.pdp.demo7.db.DB;
import uz.pdp.demo7.entity.Basket;
import uz.pdp.demo7.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove")
public class RemoveFromBasketInside extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        Product product = DB.PRODUCTS.stream().filter(item -> item.getId().equals(productId)).findFirst().orElseThrow();
        HttpSession session = req.getSession();
        Basket basket = (Basket)session.getAttribute("basket");
        basket.getBasket().remove(product);
        session.setAttribute("basket", basket);
        resp.sendRedirect("/user/basket.jsp");
    }
}
