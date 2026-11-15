package BookServlets;

import Beans.UserBean;
import BookDAO.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserLogin")
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String phone = req.getParameter("userPhoneNumber");
        String password = req.getParameter("userPassword");

        UserBean ub = new UserDAO().userLogin(phone, password);

        if (ub != null) {

            HttpSession session = req.getSession();
            session.setAttribute("UserDetails", ub);

            req.getRequestDispatcher("/UserHome.jsp")
                    .forward(req, resp);

        } else {

            resp.setContentType("text/html");
            PrintWriter pw = resp.getWriter();

            pw.println("<h2>Invalid Phone Number or Password!</h2>");
            pw.println("<a href='UserLogin.jsp'>Try Again</a>");
        }
    }
}