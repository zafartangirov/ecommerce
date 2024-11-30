package uz.pdp.demo7.servlets.user;

import uz.pdp.demo7.db.DB;
import uz.pdp.demo7.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/register")
@MultipartConfig

public class RegisterServlet extends HttpServlet {
    String absolutePath = "/Users/user/IdeaProjects/demo5/files/";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phone = req.getParameter("phone");
        String password = req.getParameter("pass word");

        Optional<User> userOptional = DB.USERS.stream().filter(item -> item.getPhone().equals(phone)).findFirst();
        if (userOptional.isPresent()){
            resp.sendRedirect("/message/error.jsp");
        }else{
            User user = new User(
                    firstName,
                    lastName,
                    phone,
                    password
            );
            DB.USERS.add(user);
            resp.sendRedirect("/message/success.jsp");
        }
    }
}
