package BookServlets;

import BookDAO.BookDataBaseOperation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteBook")
public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(req.getParameter("bookId"));

        int k = new BookDataBaseOperation().deleteBookData(bookId);

        resp.setContentType("text/html");

        PrintWriter pw = resp.getWriter();

        if (k > 0) {
            pw.println("<h2>Book Deleted Successfully!</h2>");
        } else {
            pw.println("<h2>Book Not Found or Delete Failed!</h2>");
        }

        pw.println("<a href='ShowAllBooks'>View All Books</a>");
    }
}
