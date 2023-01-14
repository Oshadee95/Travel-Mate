<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Spa</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <%                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false", "root", "");

                    String hotel_id = request.getParameter("id");

                    PreparedStatement ps = con.prepareStatement("select * from spa where id = '" + hotel_id + "'");

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {

            %>

            <div class="w3-panel w3-padding-24">
                <div class="w3-row w3-margin-top">
                    <div class="w3-col s12">

                        <div class="row-padding w3-margin-left">


                            <div class="w3-col s4 w3-margin-right w3-margin-left">
                                <div class="w3-container w3-black w3-center">
                                    <h6><%=rs.getString(2)%> Spa</h6>
                                </div>
                                <div class="w3-container" style="padding: 0">
                                    <div class="w3-rest w3-center">
                                        <img src="../images/<%=rs.getString(4)%>" style="width: 100%">
                                    </div>
                                </div>
                                <div class="w3-container w3-border w3-padding-32 w3-white" style="height:340px">
                                    <table class="w3-table w3-bordered">
                                    	<tr>
                                    		<td>Hotel identification</td>
                                    		<td><%=rs.getString(3)%></td>
                                    	</tr>
                                    	<tr>
                                    		<td>Hotel Name</td>
                                    		<td><%=rs.getString(2)%></td>
                                    	</tr>
                                    	<tr>
                                    		<td>Hotel location</td>
                                    		<td><%=rs.getString(10)%></td>
                                    	</tr>
                                    	<tr>
                                    		<td>Registered On</td>
                                    		<td><%=rs.getDate(13)%></td>
                                    	</tr>
                                    </table>
                                </div>
                                <div class="row">
                                	<button class="w3-btn w3-block w3-red w3-padding-16">Remove Spa</button>
                                </div>
                            </div> 
                            
                            <div class="w3-rest">

                                <div class="row w3-margin-left">
                                    <div class="w3-col s5 w3-margin-right w3-margin-left">
										<div class="w3-card-4">
										  <div class="w3-center w3-padding w3-blue-gray "><i class="fa fa-mortar-pestle w3-xxxlarge"></i></div>
										  <div class="w3-container w3-center w3-blue-gray">
										    <p>Facial</p>
										  </div>
										  <div style="height: 117px !important; overflow-y: auto; overflow-x: hidden;">
										  <table class="w3-table w3-bordered w3-white w3-blue-gray">
											<tr>
										  	<%=rs.getString(5).replace("*", "</tr><tr><td>") %>
										  </table>
										  </div>
										</div>
                                    </div>
                                    <div class="w3-col s5 w3-margin-right w3-margin-left">
										<div class="w3-card-4">
										  <div class="w3-center w3-padding w3-blue-gray "><i class="fa fa-user-nurse w3-xxxlarge"></i></div>
										  <div class="w3-container w3-center w3-blue-gray">
										    <p>Waxing</p>
										  </div>
										  <div style="height: 117px !important; overflow-y: auto; overflow-x: hidden;">
											  <table class="w3-table w3-bordered w3-white w3-blue-gray">
												<tr>
											  	<%=rs.getString(6).replace("*", "</tr><tr><td>") %>
											  </table>
										  </div>
										</div>
                                    </div>
                                    <div class="w3-col s5 w3-margin-top w3-margin-right w3-margin-left">
										<div class="w3-card-4 w3-text-white">
										  <div class="w3-center w3-padding w3-blue-gray "><i class="fa fa-heartbeat w3-xxxlarge"></i></div>
										  <div class="w3-container w3-center w3-blue-gray ">
										    <p>Body</p>
										  </div>
										  <div style="height: 117px !important; overflow-y: auto; overflow-x: hidden;">
										  <table class="w3-table w3-bordered w3-white">
											<tr>
										  	<%=rs.getString(7).replace("*", "</tr><tr><td>") %>
										  </table>
										  </div>
										</div>
                                    </div>
                                    <div class="w3-col s5 w3-margin-top w3-margin-right w3-margin-left">
										<div class="w3-card-4 w3-text-white w3-border-bottom">
										  <div class="w3-center w3-blue-gray w3-padding"><i class="fa fa-user-md w3-xxxlarge"></i></div>
										  <div class="w3-container w3-center w3-blue-gray">
										    <p>Massage</p>
										  </div>
										  <div style="height: 370px !important; overflow-y: auto; overflow-x: hidden;">
										  <table class="w3-table w3-bordered w3-white">
											<tr>
										  	<%=rs.getString(8).replace("*", "</tr><tr><td>") %>
										  </table>
										  </div>
										</div>
                                    </div>
                                    <div class="w3-col s5 w3-margin-top w3-margin-right w3-margin-left" style="margin-top: -235px !important">
										<div class="w3-card-4 w3-text-white">
										  <div class="w3-center w3-padding w3-blue-gray "><i class="fa fa-spray-can w3-xxxlarge"></i></div>
										  <div class="w3-container w3-center w3-blue-gray ">
										    <p>Tinting</p>
										  </div>
										  <div style="height: 117px !important; overflow-y: auto; overflow-x: hidden;">
										  <table class="w3-table w3-bordered w3-white">
											<tr>
										  	<%=rs.getString(9).replace("*", "</tr><tr><td>") %>
										  </table>
										  </div>
										</div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <% }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }

        %>

        <%@ include file="template/scripts.jsp" %>
    </div>
</body>

</html>
