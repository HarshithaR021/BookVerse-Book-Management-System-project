package BookServlets;

import Beans.UserBean;
import BookDAO.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserRegistration")
public class UserRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String userName = req.getParameter("userName");
        String userPassword = req.getParameter("userPassword");
        String userPhoneNumber = req.getParameter("userPhoneNumber");

        UserBean ub = new UserBean();

        ub.setUserName(userName);
        ub.setUserPassword(userPassword);
        ub.setUserPhoneNumber(userPhoneNumber);

        int k = new UserDAO().registerUser(ub);

        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();

        if (k > 0) {
            pw.println("<h2>Registration Successful!</h2>");
            pw.println("<p>Welcome to BookVerse, " + userName + "!</p>");
        } else {
            pw.println("<h2>Registration Failed!</h2>");
            pw.println("<p>Please check your details. The phone number may already be registered.</p>");
        }

        pw.println("<a href='UserRegistration.jsp'>Register Again</a>");
        pw.println("<br><a href='index.html'>Back to Home</a>");
    }
}