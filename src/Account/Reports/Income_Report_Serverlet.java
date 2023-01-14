/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Account.Reports;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Redhw
 */
@WebServlet(name = "Income_Report_Serverlet", urlPatterns = {"/Income_Report_Serverlet"})
public class Income_Report_Serverlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String month = null;
            String year = null;
            String fileName = null;
            String department = null;

            //Report name (pdf)
            fileName = request.getParameter("reportName");

            //Report name (pdf)
            String queryDate = request.getParameter("reportDate");

            //Report department
            department = request.getParameter("department");

            year = queryDate.substring(0, 4);
            month = queryDate.substring(6, 7);

            int temp_month = Integer.parseInt(month);
            if (temp_month < 10) {
                month = '0' + month;
            } else {
                month = month;
            }

            try {

                if (department.equalsIgnoreCase("Hotel")) {

                    //Report template name (jrxml)
                    String reportName = "hotel_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Hotel' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'  AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_hotel_income.jsp");

                }

                if (department.equalsIgnoreCase("Restaurant")) {

                    //Report template name (jrxml)
                    String reportName = "restaurant_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Restaurant' AND MONTH(`Date`) = '" + Report.getMonth() + "' AND YEAR(`Date`) = '" + Report.getYear() + "'  AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_restaurant_income.jsp");

                }

                if (department.equalsIgnoreCase("Guide")) {

                    //Report template name (jrxml)
                    String reportName = "guide_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Guide' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_guide_income.jsp");

                }

                if (department.equalsIgnoreCase("Adventure")) {

                    //Report template name (jrxml)
                    String reportName = "adventure_places_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Adventure' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_adventure_places_income.jsp");

                }

                if (department.equalsIgnoreCase("Travel")) {

                    //Report template name (jrxml)
                    String reportName = "traveling_places_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Traveling' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'  AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_traveling_places_income.jsp");

                }

                if (department.equalsIgnoreCase("Spa")) {

                    //Report template name (jrxml)
                    String reportName = "spa_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Spa' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_spa_income.jsp");

                }

                if (department.equalsIgnoreCase("Vehicle")) {

                    //Report template name (jrxml)
                    String reportName = "vehicle_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Vehicle' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'  AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_vehicle_income.jsp");

                }

                if (department.equalsIgnoreCase("Driver")) {

                    //Report template name (jrxml)
                    String reportName = "driver_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Driver' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_driver_income.jsp");

                }

                if (department.equalsIgnoreCase("Packages")) {

                    //Report template name (jrxml)
                    String reportName = "packages_income_template";

                    //Report query
                    String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Packages' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'  AND `Status` = 'confirmed' GROUP BY `Business_name`";

                    //Generating new report
                    Report report = new Report();
                    report.generateReport(reportName, query, fileName);

                    response.sendRedirect(request.getContextPath() + "/Accounts/view_packages_income.jsp");

                }

            } catch (Exception e) {
                out.println(e.getMessage());
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
