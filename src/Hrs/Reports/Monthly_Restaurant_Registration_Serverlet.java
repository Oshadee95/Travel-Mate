/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hrs.Reports;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Monthly_Restaurant_Registration_Serverlet", urlPatterns = {"/Monthly_Restaurant_Registration_Serverlet"})
public class Monthly_Restaurant_Registration_Serverlet extends HttpServlet {

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

                fileName = "restaurant-registrations-report";
                month = Report.getMonth();
                year = Report.getYear();
            }

            try {

                //Report template name (jrxml)
                String reportName = "monthly_restaurant_template";

                //Report query
                String query = "SELECT `hotel_id` AS 'RID',`name` AS 'RNAME', `address` AS 'RADDRESS', DATE(`reg_date`) AS 'RREGDATE' FROM `hotel10` WHERE `part` = 'Restaurant'  AND MONTH(`reg_date`) = '"+month+"' AND YEAR(`reg_date`) = '"+year+"'";

                //Generating new report
                Report report = new Report();
                report.generateReport(reportName, query, fileName);

                response.sendRedirect(request.getContextPath() + "/Hotel-Resort-Spa/view_reports.jsp");

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
