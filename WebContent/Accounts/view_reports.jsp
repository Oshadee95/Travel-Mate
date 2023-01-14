<%@page import="Account.Reports.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reports</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Reports</h6>
                </header>
            </div>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col">

                        <div class="row-padding">

                            <div class="row">
                                <div class="w3-col s4 w3-margin-right">
                                    <div class="w3-container w3-indigo w3-center">
                                        <h6>System Directory</h6>
                                    </div>
                                    <form class="w3-container w3-border w3-padding-16" action="<%=request.getContextPath()%>/Set_Path_Serverlet" method="POST">
                                        <p>
                                            <label>Folder Path</label>
                                            <input class="w3-input" type="text" value="<%=File.getfolderPath()%>" name="folderPath" style="outline:none"></p>
                                        <p class="w3-padding-16">
                                            <label>Report Path</label>
                                            <input class="w3-input" type="text" value="<%=File.getReportPath()%>" name="reportPath" style="outline:none"></p>
                                        <button class="w3-button w3-indigo w3-border w3-border-indigo w3-hover-border-indigo w3-hover-white w3-hover-text-indigo w3-right" type="submit">Update</button>
                                    </form>
                                </div>
                            </div>    

                            <div class="row">
                                <div class="w3-rest">

                                    <!--Income report-->
                                    <form action="<%=request.getContextPath()%>/Income_Report_Serverlet" method="POST">
                                        <div class="w3-container w3-blue" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span>Generate Department Income Report</span><button class="w3-button w3-right w3-blue w3-hover-white w3-text-white w3-border w3-border-blue w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-third">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="Hotel Income Report" style="outline:none" required>
                                                </div>
                                                <div class="w3-third">
                                                    <label class="w3-text-black">Department</label>
                                                    <select class="w3-select w3-margin-top" name="department" style="outline:none" required>
                                                        <option value="" disabled selected>Choose your department</option>
                                                        <option value="Hotel">Hotel</option>
                                                        <option value="Restaurant">Restaurant</option>
                                                        <option value="Guide">Guide</option>
                                                        <option value="Adventure">Adventure</option>
                                                        <option value="Travel">Travel</option>
                                                        <option value="Spa">Spa</option>
                                                        <option value="Vehicle">Vehicle</option>
                                                        <option value="Driver">Driver</option>
                                                        <option value="Packages">Packages</option>
                                                    </select>
                                                </div>
                                                <div class="w3-third">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End income report-->


                                    <!--Expense report-->
                                    <form action="<%=request.getContextPath()%>/Expense_Report_Serverlet" method="POST">
                                        <div class="w3-container w3-orange" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span class="w3-text-white">Generate Expense Report</span><button class="w3-button w3-right w3-orange w3-hover-white w3-text-white w3-border w3-border-orange w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="January Expense Report" style="outline:none" required>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End expense report-->
                                    
                                    
                                    <!--Bad debts report-->
                                    <form action="<%=request.getContextPath()%>/Bad_Debt_Report_Servelet" method="POST">
                                        <div class="w3-container w3-red" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span class="w3-text-white">Generate Bad Debts Report</span><button class="w3-button w3-right w3-red w3-hover-white w3-text-white w3-border w3-border-red w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="January Bad Debts Report" style="outline:none" required>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End bad debts report-->
                                    

                                    <!--Income statement report-->
                                    <form action="<%=request.getContextPath()%>/Income_Statement_Report_Serverlet" method="POST">
                                        <div class="w3-container w3-teal" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span class="w3-text-white">Generate Income Statement Report</span><button class="w3-button w3-right w3-teal w3-hover-white w3-text-white w3-border w3-border-teal w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="January Income Statement" style="outline:none" required>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End income statement report-->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
