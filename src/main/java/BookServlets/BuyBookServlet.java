
package BookServlets;

import Beans.BookBean;
import Beans.BookUserBean;
import Beans.UserBean;
import BookDAO.BookDataBaseOperation;
import BookDAO.BookUserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/BuyBook")
public class BuyBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("UserDetails") == null) {
            resp.sendRedirect("UserLogin.jsp");
            return;
        }

        UserBean user =
                (UserBean) session.getAttribute("UserDetails");

        int bookId = Integer.parseInt(req.getParameter("bookId"));

        BookBean book =
                new BookDataBaseOperation().showBookUsingId(bookId);

        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = resp.getWriter();

        if (book == null) {
            pw.println("<h2>Book Not Found!</h2>");
            pw.println("<a href='UserHome.jsp'>Back to Home</a>");
            return;
        }

        BookUserBean bub = new BookUserBean();
        bub.setBookId(book.getBookId());
        bub.setUserId(user.getUserId());
        bub.setPrice(book.getBookPrice());

        int k = new BookUserDAO().buyBook(bub);

        if (k > 0) {
            pw.println("<h2>Book Purchased Successfully!</h2>");
            pw.println("<p>Book Name: " + book.getBookName() + "</p>");
            pw.println("<p>Price: " + book.getBookPrice() + "</p>");
        } else {
            pw.println("<h2>Purchase Failed!</h2>");
        }

        pw.println("<a href='UserHome.jsp'>Back to Home</a>");
    }
}
