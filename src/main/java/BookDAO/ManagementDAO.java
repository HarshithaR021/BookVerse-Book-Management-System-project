package BookDAO;

import Beans.ManagementBean;
import DatabaseDetails.CreateConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagementDAO {

    public boolean managementLogin(ManagementBean ab) {

        boolean status = false;

        try {
            Connection con = CreateConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM bookmanagement WHERE userId=? AND password=?"
            );

            ps.setString(1, ab.getAdminId());
            ps.setString(2, ab.getAdminPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}