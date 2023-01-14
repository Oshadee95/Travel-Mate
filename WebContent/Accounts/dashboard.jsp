<%@page import="Accounts.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Accounts.Statistics"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Accounts.Income_Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DateFormat month_Format = new SimpleDateFormat("MM");
    DateFormat year_Format = new SimpleDateFormat("yyyy");

    Date date = new Date();

    String month = month_Format.format(date);
    String year = year_Format.format(date);

    //To reset the generated figure to current month net income
    Income_Statement.getIncomeBeforeDiscount(month, year);
    Income_Statement.getDiscountFigure(month, year);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard</h6>
                </header>
            </div>

            <div class="w3-row-padding w3-margin-bottom">
                <div class="w3-quarter">
                    <div class="w3-container w3-red w3-padding-16">
                        <div class="w3-left"><i class="fa fa-hand-holding-usd w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>Rs. <% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getNetIncomeAfterDiscount(month, year)));%></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Net <% out.println(Income_Statement.getNetIncomeStatus());%></h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-blue w3-padding-16">
                        <div class="w3-left"><i class="fa fa-money-bill-alt w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>Rs. <% out.println(Income_Statement.getNumberWithSeparator(Statistics.getTotalMonthlyIncome()));%></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Revenue</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-teal w3-padding-16">
                        <div class="w3-left"><i class="fa fa-credit-card w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>Rs. <% out.println(Income_Statement.getNumberWithSeparator(Statistics.getTotalMonthlyExpenses()));%></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Expenses</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-orange w3-text-white w3-padding-16">
                        <div class="w3-left"><i class="fa fa-user-minus w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>Rs. <% out.println(Income_Statement.getNumberWithSeparator(Income_Statement.getCurrentYearCurrentMonthTotalDebt(month, year)));%></h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Bad Debts</h4>
                    </div>
                </div>
            </div>


            <div class="w3-panel w3-padding-64">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <div class="w3-col s6">
                            <canvas id="myChart" width="200" height="100"></canvas>
                        </div>

                        <div class="w3-rest" style="padding-left: 40px">

                            <table class="w3-table w3-striped w3-white">
                                <%
                                    ResultSet res;
                                    res = Log.viewBusinessLog();
                                    while (res.next()) {
                                %>
                                <tr>
                                    <td><i class="fa fa-<%=res.getString("log_icon")%> w3-large"></i></td>
                                    <td><%=res.getString("log_details")%></td>
                                    <td><%=res.getTime("log_time")%></td>
                                </tr>
                                <% } %>
                            </table>


                        </div>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>


        </div>

        <script>
            var ctx01 = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'bar',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                            data: [<% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("01", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("02", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("03", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("04", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("05", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("06", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("07", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("08", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("09", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("10", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("11", year));%>,
                                    <% out.println(Income_Statement.getCurrentYearMonthlyNetIncomeAfterDiscount("12", year));%>],
                            backgroundColor: [
                                'rgba(244, 67, 54, 0.6)', //red
                                'rgba(255, 99, 132, 0.6)', //pink
                                'rgba(153, 102, 255, 0.6)', //deep purple 
                                'rgba(156, 39, 176, 0.6)', //purple
                                'rgba(54, 162, 235, 0.6)', //blue
                                'rgba(0, 188, 212, 0.6)', //marine blue
                                'rgba(75, 192, 192, 0.6)', //teal
                                'rgba(255, 206, 86, 0.6)', //yellow
                                'rgba(255, 159, 64, 0.6)', //amber
                                'rgba(251, 140, 0, 0.6)', //yellow
                                'rgba(139, 195, 74, 0.6)', //green
                                'rgba(96, 125, 139, 0.6)'   //grey
                            ],
                            borderColor: [
                                'rgba(244, 67, 54, 1)', //red
                                'rgba(255, 99, 132, 1)', //pink
                                'rgba(153, 102, 255, 1)', //deep purple 
                                'rgba(156, 39, 176, 1)', //purple
                                'rgba(54, 162, 235, 1)', //blue
                                'rgba(0, 188, 212, 1)', //marine blue
                                'rgba(75, 192, 192, 1)', //teal
                                'rgba(255, 206, 86, 1)', //yellow
                                'rgba(255, 159, 64, 1)', //amber
                                'rgba(251, 140, 0, 1)', //yellow
                                'rgba(139, 195, 74, 1)', //green
                                'rgba(96, 125, 139, 1)'   //grey
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    legend: {
                        display: false,
                    },
                    scales: {
                        yAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Net Income',
                                    fontSize: 15
                                },
                                gridLines: {
                                    display: true
                                }
                            }],
                        xAxes: [{
                                scaleLabel: {
                                    display: false
                                },
                                gridLines: {
                                    display: false
                                }
                            }]
                    }
                }
            });
        </script>
    </body>
</html>
