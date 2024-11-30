package uz.pdp.demo7.filter;

import uz.pdp.demo7.entity.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class Filter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (req.getRequestURI().contains("/admin")) {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null && "ADMIN".equals(user.getRole())) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/login/login.jsp");
                return;
            }
        } else {
            chain.doFilter(req, res);
        }
    }
}
