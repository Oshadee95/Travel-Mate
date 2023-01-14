<%@page import="Hrs.Reports.File"%>
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
                                    <form class="w3-container w3-border w3-padding-16" action="<%=request.getContextPath()%>/Set_Hrs_Path_Serverlet" method="POST">
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

                                    <!--Hotel report-->
                                    <form action="<%=request.getContextPath()%>/Monthly_Hotel_Registration_Serverlet" method="POST">
                                        <div class="w3-container w3-blue" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span>Generate Hotel Report</span><button class="w3-button w3-right w3-blue w3-hover-white w3-text-white w3-border w3-border-blue w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="Hotel Registrations Report" style="outline:none" required>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End Hotel report-->


                                    <!--Restaurant report-->
                                    <form action="<%=request.getContextPath()%>/Monthly_Restaurant_Registration_Serverlet" method="POST">
                                        <div class="w3-container w3-orange" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span class="w3-text-white">Generate Restaurant Report</span><button class="w3-button w3-right w3-orange w3-hover-white w3-text-white w3-border w3-border-orange w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="Restaurant Registrations Report" style="outline:none" required>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End Restaurant report-->
                                    
                                    
                                    <!--Spa report-->
                                    <form action="<%=request.getContextPath()%>/Monthly_Spa_Registration_Serverlet" method="POST">
                                        <div class="w3-container w3-red" style="padding-right: 0">
                                            <h6 style="margin-bottom: 0"><span class="w3-text-white">Generate Spa Report</span><button class="w3-button w3-right w3-red w3-hover-white w3-text-white w3-border w3-border-red w3-hover-text-black" style="margin-top: -10px;"><i class="fas fa-print"></i></button></h6>

                                        </div>
                                        <div class="w3-container w3-border w3-padding-16 w3-margin-bottom">
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Name</label>
                                                    <input class="w3-input w3-margin-top" type="text" name="reportName" placeholder="Spa Registrations Report" style="outline:none" required>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-black">Report Period</label>
                                                    <input class="w3-input w3-margin-top" type="month" name="reportDate" style="outline:none" required>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--End Spa report-->
                                    
                                    
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
