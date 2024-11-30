package uz.pdp.demo7.servlets.user;

import uz.pdp.demo7.db.DB;
import uz.pdp.demo7.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public static User currentUser = null;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        Optional<User> userOptional = DB.USERS.stream()
                .filter(item -> item.getPhone().equals(phone) && item.getPassword().equals(password))
                .findFirst();

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            currentUser = user;

            if ("ADMIN".equals(user.getRole())) {
                resp.sendRedirect("/admin/admin.jsp");
            } else if ("USER".equals(user.getRole())) {
                resp.sendRedirect("/user/market.jsp");
            }
        } else {
            resp.sendRedirect("/login/login.jsp");
        }
    }
}
