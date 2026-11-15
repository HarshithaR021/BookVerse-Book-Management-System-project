
package BookDAO;
import java.sql.ResultSet;
import java.util.ArrayList;
import Beans.BookUserBean;
import DatabaseDetails.CreateConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BookUserDAO {

    public int buyBook(BookUserBean bub) {

        int k = 0;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO BookUser (bookId, userId, price) VALUES (?, ?, ?)"
            );

            ps.setInt(1, bub.getBookId());
            ps.setInt(2, bub.getUserId());
            ps.setDouble(3, bub.getPrice());

            k = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return k;
    }

    public ArrayList<BookUserBean> getUserPurchases(int userId) {

        ArrayList<BookUserBean> purchases = new ArrayList<>();

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM BookUser WHERE userId=?"
            );

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BookUserBean bub = new BookUserBean();

                bub.setBookId(rs.getInt("bookId"));
                bub.setUserId(rs.getInt("userId"));
                bub.setPrice(rs.getDouble("price"));

                purchases.add(bub);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return purchases;
    }

}
