package BookServlets;

import Beans.ManagementBean;
import BookDAO.ManagementDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/managementLogin")
public class ManagementLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String adminId = req.getParameter("adminId");
        String adminPassword = req.getParameter("adminPassword");

        ManagementBean ab = new ManagementBean();
        ab.setAdminId(adminId);
        ab.setAdminPassword(adminPassword);

        boolean status = new ManagementDAO().managementLogin(ab);

        if (status) {

            HttpSession session = req.getSession();
            session.setAttribute("ManagementDetails", ab);

            req.getRequestDispatcher("/ManagementHome.jsp")
                    .forward(req, resp);

        } else {

            resp.setContentType("text/html");
            PrintWriter pw = resp.getWriter();

            pw.println("<h2>Invalid User ID or Password!</h2>");
            pw.println("<a href='index.html'>Back to Home</a>");
        }
    }
}
