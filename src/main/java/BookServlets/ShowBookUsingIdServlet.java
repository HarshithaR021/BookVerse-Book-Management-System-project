
package BookServlets;

import Beans.BookBean;
import BookDAO.BookDataBaseOperation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ShowBookUsingId")
public class ShowBookUsingIdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(req.getParameter("bookId"));

        BookBean bb =
                new BookDataBaseOperation().showBookUsingId(bookId);

        resp.setContentType("text/html;charset=UTF-8");

        PrintWriter pw = resp.getWriter();

        if (bb != null) {
            pw.println("<h2>Book Details</h2>");
            pw.println("<p>Book ID: " + bb.getBookId() + "</p>");
            pw.println("<p>Book Name: " + bb.getBookName() + "</p>");
            pw.println("<p>Book Price: " + bb.getBookPrice() + "</p>");
        } else {
            pw.println("<h2>Book Not Found!</h2>");
        }

        pw.println("<br><a href='ShowBookUsingId.jsp'>Search Another Book</a>");
        pw.println("<br><a href='ShowAllBooks'>View All Books</a>");
    }
}
