package Hrs.Reports;

import Accounts.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public class Report {

    private static String sql;
    private PreparedStatement ps;
    private static ResultSet res;

    static Date currentDate = new Date();

    public static String getDate() {
        DateFormat date_Format = new SimpleDateFormat("dd");
        String date = date_Format.format(currentDate);
        return date;
    }

    public static String getMonth() {
        DateFormat month_Format = new SimpleDateFormat("MM");
        String month = month_Format.format(currentDate);
        return month;
    }

    public static String getYear() {
        DateFormat year_Format = new SimpleDateFormat("yyyy");
        String year = year_Format.format(currentDate);
        return year;
    }

    public void generateReport(String reportName, String query, String fileName) throws SQLException, ClassNotFoundException, JRException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            String dbReportPath = File.getReportPath();

            String reportPath = dbReportPath + reportName+".jrxml";

            Map<String, Object> parameters = new HashMap<String, Object>();

            //loading the design from the file path
            JasperDesign jasperDesign = JRXmlLoader.load(reportPath);

            //Designing the query for the report
            JRDesignQuery newQuery = new JRDesignQuery();

            //setting the query text
            newQuery.setText(query);

            //seeting the query for the report design
            jasperDesign.setQuery(newQuery);

            //compile the jasper report for the design
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);

            //creating a JasperPrint object to fill the report
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, con);

            //JasperViewer.viewReport(jasperPrint);
            String dbFolderPath = File.getfolderPath();
            JasperExportManager.exportReportToPdfFile(jasperPrint, dbFolderPath + fileName + "_" + getDate() + "-" + getMonth() + "-" + getYear() + ".pdf");
        }
    }

}
