package uz.pdp.demo7.servlets.user;

import uz.pdp.demo7.db.DB;
import uz.pdp.demo7.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;

@WebServlet("/order/confirm")
public class ConfirmOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Basket basket = (Basket) req.getSession().getAttribute("basket");
        if (!basket.getBasket().isEmpty()) {
            Order order = new Order();
            order.setDateTime(LocalDateTime.now());
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                order.setUserId(user.getId());
                DB.ORDERS.add(order);
                resp.sendRedirect("/user/order.jsp");
            } else {
                resp.sendRedirect("/login/login.jsp");
            }
            for (Map.Entry<Product, Integer> entry : basket.getBasket().entrySet()) {
                if (entry.getValue() > 0) {
                    OrderItem orderItem = new OrderItem(
                            order.getId(),
                            entry.getKey().getId(),
                            entry.getValue()
                    );
                    DB.ORDER_ITEMS.add(orderItem);
                }
            }
            basket.getBasket().clear();
            req.getSession().setAttribute("basket", basket);
        }else{
            resp.sendRedirect("/user/basket.jsp");
        }
    }
}
