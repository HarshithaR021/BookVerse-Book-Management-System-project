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

@WebServlet("/UpdateBook")
public class UpdateBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(req.getParameter("bookId"));
        String bookName = req.getParameter("bookName");
        double bookPrice = Double.parseDouble(req.getParameter("bookPrice"));

        BookBean bb = new BookBean();

        bb.setBookId(bookId);
        bb.setBookName(bookName);
        bb.setBookPrice(bookPrice);

        int k = new BookDataBaseOperation().updateBookData(bb);

        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();

        if (k > 0) {
            pw.println("<h2>Book Updated Successfully!</h2>");
        } else {
            pw.println("<h2>Book Not Found or Update Failed!</h2>");
        }

        pw.println("<a href='ShowAllBooks'>View All Books</a>");
    }
}
