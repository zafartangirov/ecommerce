package uz.pdp.demo5.servlets;


import uz.pdp.demo5.DB;
import uz.pdp.demo5.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/order/details")
public class OrderDetailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer orderId = Integer.parseInt(req.getParameter("orderId"));
        List<Order> orders = DB.ORDERS.stream().filter(order -> order.getId().equals(orderId)).toList();
        for (Order order : orders) {
            resp.sendRedirect("/orderDetails.jsp?orderId="+order.getId());
        }
    }
}
