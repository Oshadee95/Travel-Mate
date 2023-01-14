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
@WebServlet(name = "Traveling_Places_Income_Report_Serverlet", urlPatterns = {"/Traveling_Places_Income_Report_Serverlet"})
public class Traveling_Places_Income_Report_Serverlet extends HttpServlet {

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

            try {

                //Report name (pdf)
                String fileName = "traveling-places-income-report";

                //Report template name (jrxml)
                String reportName = "traveling_places_income_template";

                //Report query
                String query = "SELECT `Transaction_Id`, `Date`, `Business_name`, SUM(`Amount`) AS 'Amount' FROM `booking_payment` WHERE `Department` = 'Traveling' AND MONTH(`Date`) = '" + Report.getMonth() + "' AND YEAR(`Date`) = '" + Report.getYear() + "'  AND `Status` = 'confirmed' GROUP BY `Business_name`";

                //Generating new report
                Report report = new Report();
                report.generateReport(reportName, query, fileName);

                response.sendRedirect(request.getContextPath() + "/Accounts/view_traveling_places_income.jsp");

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
