
package BookServlets;

import Beans.BookBean;
import BookDAO.BookDataBaseOperation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AddToCart")
public class CartServlet extends HttpServlet {

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

        int bookId = Integer.parseInt(req.getParameter("bookId"));

        BookBean book =
                new BookDataBaseOperation().showBookUsingId(bookId);

        if (book != null) {

            ArrayList<BookBean> cart =
                    (ArrayList<BookBean>) session.getAttribute("Cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean alreadyAdded = false;

            for (BookBean item : cart) {
                if (item.getBookId() == bookId) {
                    alreadyAdded = true;
                    break;
                }
            }

            if (!alreadyAdded) {
                cart.add(book);
            }

            session.setAttribute("Cart", cart);
        }

        resp.sendRedirect("Cart.jsp");
    }
}
