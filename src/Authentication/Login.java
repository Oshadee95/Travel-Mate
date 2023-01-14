package Authentication;

import Accounts.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login {

    private String sql;
    private PreparedStatement ps;
    private ResultSet res;

    private String username;
    private String password;

    public int validateAdmin(String username, String password) throws SQLException, ClassNotFoundException {

        this.username = username;
        this.password = password;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT COUNT(*) AS 'count' FROM `admin` WHERE `a_username` = '" + username + "' AND `a_pasword` = '" + password + "'";
            res = st.executeQuery(sql);

            int rowCount = 0;

            while (res.next()) {
                rowCount = res.getInt("count");
            }
            return rowCount;

        }
        return 0;
    }

    public String getDepartment() throws SQLException, ClassNotFoundException {

        String department = "";

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT a_category AS 'category' FROM `admin` WHERE `a_username` = '" + username + "' AND `a_pasword` = '" + password + "'";
            res = st.executeQuery(sql);

            while (res.next()) {
                department = res.getString("category");
            }
            return department;

        }
        return department;
    }

}
