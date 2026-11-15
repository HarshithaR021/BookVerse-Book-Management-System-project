
package BookServlets;

import Beans.BookBean;
import BookDAO.BookDataBaseOperation;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addbook")
public class AddBookServlet extends GenericServlet {

  @Override
  public void service(ServletRequest req, ServletResponse res)
          throws ServletException, IOException {

    String bookIdValue = req.getParameter("bookId");
    String bookName = req.getParameter("bookName");
    String bookPriceValue = req.getParameter("bookPrice");
    if (bookIdValue == null || bookName == null || bookPriceValue == null ||
            bookName.trim().length() < 2 ||
            bookIdValue.trim().isEmpty() ||
            bookPriceValue.trim().isEmpty()) {

      res.setContentType("text/html;charset=UTF-8");
      PrintWriter out = res.getWriter();

      out.println("<h2>Invalid book details. Please try again.</h2>");
      out.println("<a href='AddBook.html'>Go Back</a>");

      return;
    }
    int bookId;
    double bookPrice;

    try {
      bookId = Integer.parseInt(bookIdValue);
      bookPrice = Double.parseDouble(bookPriceValue.trim());
    } catch (NumberFormatException e) {
      res.setContentType("text/html;charset=UTF-8");
      PrintWriter out = res.getWriter();

      out.println("<h2>Invalid Book ID or Book Price!</h2>");
      out.println("<a href='AddBook.html'>Go Back</a>");

      return;
    }
    if (bookId <= 0 || bookPrice <= 0 || bookPrice > 1000000) {
      res.setContentType("text/html;charset=UTF-8");
      PrintWriter out = res.getWriter();

      out.println("<h2>Book ID and Price must be valid positive values!</h2>");
      out.println("<a href='AddBook.html'>Go Back</a>");

      return;
    }
    BookBean bb = new BookBean();

    bb.setBookId(bookId);
    bb.setBookName(bookName.trim());
    bb.setBookPrice(bookPrice);

    int k = new BookDataBaseOperation().insertBookData(bb);

    res.setContentType("text/html;charset=UTF-8");

    PrintWriter out = res.getWriter();

    if (k > 0) {

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>BookVerse | Success</title>");
      out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");

      out.println("<style>");
      out.println("body { background:#f6f3ec; font-family:Arial; min-height:100vh; display:flex; align-items:center; justify-content:center; }");
      out.println(".card { max-width:450px; padding:40px; border:none; border-radius:16px; text-align:center; box-shadow:0 8px 30px rgba(16,28,45,0.1); }");
      out.println("h2 { color:#101c2d; }");
      out.println(".btn-main { background:#101c2d; color:white; padding:11px 20px; text-decoration:none; border-radius:6px; display:inline-block; margin-top:10px; }");
      out.println(".btn-main:hover { background:#243a56; color:#e8bb72; }");
      out.println("</style>");

      out.println("</head>");
      out.println("<body>");

      out.println("<div class='card'>");
      out.println("<h1 style='color:green'>&#10004;</h1>");
      out.println("<h2>Book Added Successfully!</h2>");
      out.println("<p>Your new book has been added to BookVerse.</p>");

      out.println("<a href='AddBook.html' class='btn-main'>Add Another Book</a>");
      out.println("<br>");
      out.println("<a href='ManagementHome.jsp' class='btn-main'>Back to Dashboard</a>");

      out.println("</div>");
      out.println("</body>");
      out.println("</html>");

    } else {

      out.println("<h2 style='color:red;text-align:center;'>Book Not Added!</h2>");
      out.println("<p style='text-align:center;'>Something went wrong. Please try again.</p>");
      out.println("<div style='text-align:center;'>");
      out.println("<a href='AddBook.html'>Try Again</a>");
      out.println("</div>");

    }
  }
}
