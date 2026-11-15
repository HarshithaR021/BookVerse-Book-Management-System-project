
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

@WebServlet("/ShowAllBooks")
public class ShowAllBooksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        ArrayList<BookBean> al =
                new BookDataBaseOperation().retriveBookData();

        HttpSession hs = req.getSession();

        hs.setAttribute("AllBooks", al);

        req.getRequestDispatcher("/ShowAllBook.jsp")
                .forward(req, resp);
    }
}
