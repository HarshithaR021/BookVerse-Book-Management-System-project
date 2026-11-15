package BookDAO;

import Beans.UserBean;
import DatabaseDetails.CreateConnection;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {

    public int registerUser(UserBean ub) {

        int k = 0;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO UserDetails (userName, userPassword, userPhoneNumber) VALUES (?, ?, ?)"
            );

            ps.setString(1, ub.getUserName());
            ps.setString(2, ub.getUserPassword());
            ps.setString(3, ub.getUserPhoneNumber());

            k = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return k;
    }
    public UserBean userLogin(String phone, String password) {

        UserBean ub = null;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM UserDetails WHERE userPhoneNumber=? AND userPassword=?"
            );

            ps.setString(1, phone);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ub = new UserBean();

                ub.setUserId(rs.getInt("userId"));
                ub.setUserName(rs.getString("userName"));
                ub.setUserPassword(rs.getString("userPassword"));
                ub.setUserPhoneNumber(rs.getString("userPhoneNumber"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ub;
    }
}