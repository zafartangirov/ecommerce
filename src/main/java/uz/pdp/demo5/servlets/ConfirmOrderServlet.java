package uz.pdp.demo5.servlets;

import uz.pdp.demo5.DB;
import uz.pdp.demo5.entity.Order;
import uz.pdp.demo5.entity.OrderItem;
import uz.pdp.demo5.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;

@WebServlet("/order/confirm")
public class ConfirmOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        boolean isAuthenticated = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("token".equals(cookie.getName())) {
                    String tokenValue = cookie.getValue();
                    if ("busirlikalitso'z".equals(tokenValue)) {
                        isAuthenticated = true;
                        break;
                    }
                }
            }
        }

        if (isAuthenticated) {
            Order order = new Order();
            order.setDateTime(LocalDateTime.now());
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")){
                    Integer cookieUserId = Integer.parseInt(cookie.getValue());
                    order.setUserId(cookieUserId);
                }
            }
            for (Map.Entry<Product, Integer> entry : DB.basket.entrySet()) {
                DB.ORDER_ITEMS.add(new OrderItem(order.getId(), entry.getKey().getId(), entry.getValue()));
            }
            DB.ORDERS.add(order);
            DB.basket.clear();
            resp.sendRedirect("/order.jsp");
        } else {
            resp.sendRedirect("/login/login.jsp");
        }
    }
}
