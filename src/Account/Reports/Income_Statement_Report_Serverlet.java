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
@WebServlet(name = "Income_Statement_Report_Serverlet", urlPatterns = {"/Income_Statement_Report_Serverlet"})
public class Income_Statement_Report_Serverlet extends HttpServlet {

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

            if (request.getParameter("reportName") != null) {

                //Report name (pdf)
                fileName = request.getParameter("reportName");

                //Report name (pdf)
                String queryDate = request.getParameter("reportDate");

                year = queryDate.substring(0, 4);
                month = queryDate.substring(6, 7);

                int temp_month = Integer.parseInt(month);
                if (temp_month < 10) {
                    month = '0' + month;
                } else {
                    month = month;
                }

            } else {

                fileName = "income-statement-report";
                month = Report.getMonth();
                year = Report.getYear();
            }

            try {

                //Income Report
                String incFileName = "[01] " + fileName;
                //Report template name (jrxml)
                String incReportName = "income_statement_template";

                //Report query
                String incQuery = "SELECT `Department`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' AND `Status` = 'confirmed' GROUP BY `Department`";

                //Generating new report
                Report incReport = new Report();
                incReport.generateReport(incReportName, incQuery, incFileName);
                //End Income Report

                
                //Expense Report
                String expFileName = "[02] " + fileName;
                //Report template name (jrxml)
                String expReportName = "expenses_template";

                //Report query
                String expQuery = "SELECT `Transaction_Id`, `Date`, `Type`, SUM(`Amount`) AS 'Amount' FROM `business_payment` WHERE MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' GROUP BY `Type`";

                //Generating new report
                Report expReport = new Report();
                expReport.generateReport(expReportName, expQuery, expFileName);
                //End Expense Report

                
                //Bad Debts Report
                String debtFileName = "[03] " + fileName;
                //Report template name (jrxml)
                String debtReportName = "bad_debts_template";

                //Report query
                String debtQuery = "SELECT `Date`,`Department`,`Business_name`, SUM(`Amount`) AS 'Amount' FROM `bad_debts` WHERE MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' GROUP BY `Business_name`";

                //Generating new report
                Report debtReport = new Report();
                debtReport.generateReport(debtReportName, debtQuery, debtFileName);
                //End Bad Debts Report
                
                response.sendRedirect(request.getContextPath() + "/Accounts/view_income_statement.jsp");

            } catch (Exception e) {
                out.println(e);
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
