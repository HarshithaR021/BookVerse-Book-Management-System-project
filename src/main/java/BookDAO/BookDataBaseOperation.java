package BookDAO;

import Beans.BookBean;
import DatabaseDetails.CreateConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDataBaseOperation {

    public int insertBookData(BookBean bb) {
        int k = 0;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO book VALUES(?,?,?)"
            );

            ps.setInt(1, bb.getBookId());
            ps.setString(2, bb.getBookName());
            ps.setDouble(3, bb.getBookPrice());

            k = ps.executeUpdate();

        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            return -1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return k;
    }

    public ArrayList<BookBean> retriveBookData(){
        ArrayList<BookBean> al=new ArrayList<BookBean>();
        BookBean bb=null;
        try {
            Connection con=CreateConnection.getCon();
            PreparedStatement ps=con.prepareStatement
                    ("select * from book");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                bb=new BookBean();
                bb.setBookId(rs.getInt(1));
                bb.setBookName(rs.getString(2));
                bb.setBookPrice(rs.getDouble(3));
                al.add(bb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    public BookBean showBookUsingId(int bookId){
        BookBean bb=null;
        try {
            Connection con= CreateConnection.getCon();
            PreparedStatement ps=con.prepareStatement
                    ("select  * from book where bookId=?");
            ps.setInt(1,bookId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                bb=new BookBean();
                bb.setBookId(rs.getInt(1));
                bb.setBookName(rs.getString(2));
                bb.setBookPrice(rs.getDouble(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bb;
    }
    public int updateBookData(BookBean bb) {
        int k = 0;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE book SET bookName=?, bookPrice=? WHERE bookId=?"
            );

            ps.setString(1, bb.getBookName());
            ps.setDouble(2, bb.getBookPrice());
            ps.setInt(3, bb.getBookId());

            k = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return k;
    }
    public int deleteBookData(int bookId) {
        int k = 0;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM book WHERE bookId=?"
            );

            ps.setInt(1, bookId);

            k = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return k;
    }
}


