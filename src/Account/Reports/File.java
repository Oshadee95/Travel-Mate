package Account.Reports;

import Accounts.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class File {

    private static String sql;
    private PreparedStatement ps;
    private static ResultSet res;
    static String reportPath = null;
    static String folderPath = null;

    public int setReportPath(String reportPath) throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            sql = "UPDATE `file_path` SET path=? WHERE type=?";
            ps = con.prepareStatement(sql);

            ps.setString(1, reportPath);
            ps.setString(2, "Accounts Report");
            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }

    public int setFolderPath(String folderPath) throws ClassNotFoundException, SQLException {
        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            sql = "UPDATE `file_path` SET path=? WHERE type=?";
            ps = con.prepareStatement(sql);

            ps.setString(1, folderPath);
            ps.setString(2, "Accounts Folder");

            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }

    public static String getReportPath() throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `path` FROM `file_path` WHERE `type` = 'Accounts Report'";

            res = st.executeQuery(sql);
            while (res.next()) {
                reportPath = res.getString("path");
            }
        }
        return reportPath;
    }

    public static String getfolderPath() throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `path` FROM `file_path` WHERE `type` = 'Accounts Folder'";

            res = st.executeQuery(sql);
            while (res.next()) {
                folderPath = res.getString("path");
            }
        }
        return folderPath;
    }


}
