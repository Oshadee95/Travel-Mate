<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Accounts.Income_Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String month = null;
    String year = null;
    String this_month = null;
    String this_year = null;

    DateFormat month_Format = new SimpleDateFormat("MM");
    DateFormat year_Format = new SimpleDateFormat("yyyy");

    Date date = new Date();
     this_month = month_Format.format(date);
     this_year = year_Format.format(date);
     
    if (request.getParameter("searchMonth") != null) {
        String search_date = request.getParameter("searchMonth");
        year = search_date.substring(0, 4);

        month = search_date.substring(6, 7);
        int temp_month = Integer.parseInt(month);
        if (temp_month < 10) {
            month = '0' + month;
        } else {
            month = month;
        }

    } else {
        month = month_Format.format(date);
        year = year_Format.format(date);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Income Statement</title>
        <%@ include file="template/styles.jsp" %>

    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Income Statement</h6>
                </header>
            </div>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">
                        <!--Type Here-->
                        <table class= "w3-table w3-bordered w3-white w3-col s9 w3-border w3-hoverable">
                            <thead>
                                <tr class="w3-black">
                                    <th class="w3-center w3-padding" colspan="2">Income Statement For <%=month + "/" + year%></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Income-->
                                <tr class="w3-light-grey">
                                    <td class="w3-left">Income</td>
                                    <td></td>
                                </tr>
                                
                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Hotel</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Hotel", month, year)));%></td>
                                </tr>
                                
                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Restaurant</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Restaurant", month, year)));%></td>
                                </tr>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Guide</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Guide", month, year)));%></td>
                                </tr>
                                
                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Adventure</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Adventure", month, year)));%></td>
                                </tr>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Travel</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Travel", month, year)));%></td>
                                </tr>
                                
                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Spa</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Spa", month, year)));%></td>
                                </tr>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Vehicle</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Vehicle", month, year)));%></td>
                                </tr>
                                
                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Driver</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Driver", month, year)));%></td>
                                </tr>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Package</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearMonthlyDepartmentIncome("Packages", month, year)));%></td>
                                </tr>

                                
                                <!-- End Income -->

                                <!--Business Expenses-->
                                <tr class="w3-light-grey">
                                    <td class="w3-left">Business Expenses</td>
                                    <td></td>
                                </tr>


                                <%
                                    ResultSet res;
                                    res = Income_Statement.getCurrentYearMonthlyExpenseTransactions(month, year);
                                    while (res.next()) {
                                %>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding"><%= res.getString("Type")%></td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><%= Income_Statement.getNumberWithSeparator(res.getString("Total"))%></td>
                                </tr>

                                <% } %>
                                <!--End Business Expenses-->

                                <!--Other Expenses-->
                                <tr class="w3-light-grey">
                                    <td class="w3-left">Other Expenses</td>
                                    <td></td>
                                </tr>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Bad Debts</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearCurrentMonthTotalDebt(month, year)));%></td>
                                </tr>

                                <!--End Other Expenses-->

                                <!-- Net income before discount -->
                                <tr class="w3-light-grey">
                                    <td class="w3-left">Net Income</td>
                                    <td></td>
                                </tr>

                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Monthly Income Before Discount</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getIncomeBeforeDiscount(month, year)));%></td>
                                </tr>
                                <!--End income before discount-->


                                <!-- Discount -->
                                <tr style="text-indent: 50px;">
                                    <td class="w3-padding">Monthly Discount (85%)</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getDiscountFigure(month, year)));%></td>
                                </tr>
                                <!--End Discount-->


                                <!-- Net income after discount -->

                                <tr class="w3-blue-gray" style="text-indent: 50px;">
                                    <td class="w3-padding">Monthly Net Income ( <% out.println(Income_Statement.getNetIncomeStatus());%> )</td>
                                    <td class="w3-right w3-padding" style="margin-right: 100px !important"><% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getNetIncomeAfterDiscount(month, year)));%></td>
                                </tr>
                                <!--End Net income after discount-->

                            </tbody>
                        </table>

                        <div class="w3-rest">
                            <div class="w3-row-padding w3-padding">
                                <div class="w3-col s10 w3-padding w3-left"><p style="margin-top: -0px">Print Income report for <%=this_year%> - <%=this_month%></p></div>
                                <div class="w3-col s2 w3-right">
                                    <form action="<%=request.getContextPath()%>/Income_Statement_Report_Serverlet" method="POST">
                                        <input type="text" name="reportName" value="income-statement-report" hidden>
                                        <input type="month" name="reportDate" value="<%=year%>-<%=month%>" hidden>
                                        <button class="w3-button w3-white w3-border w3-border-black w3-hover-blue w3-hover-border-blue" type="submit"><i class="fas fa-print"></i></button>
                                    </form>
                                </div>
                            </div>
                            <form action="" method="POST">
                                <div class="w3-row-padding w3-padding-16">
                                    <div class="w3-col s1"><p></div>
                                    <div class="w3-col s11">
                                        <input class="w3-input" type="month" id="search-y-m" name="searchMonth" value="<%=year%>-<%=month%>">
                                    </div>
                                </div>
                                <div class="w3-row-padding w3-padding-16">
                                    <div class="w3-col s9"><p></p></div>
                                    <div class="w3-col s2">
                                        <button class="w3-button w3-blue w3-border w3-border-blue w3-hover-border-blue w3-hover-white w3-hover-text-blue">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
