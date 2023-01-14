<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hotels</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Restaurants</h6>
                </header>
            </div>
            
            <div class="w3-panel">
            
            <div class="w3-row">
                    <div class="w3-col s10"><p></p></div>
                    <div class="w3-rest w3-right">
                        <form action="<%=request.getContextPath()%>/All_Restaurant_Registrations_Serverlet" method="POST">
                            <button class="w3-button w3-block w3-blue w3-border w3-border-blue w3-hover-white w3-hover-text-blue" name="printReport">Print Report <i class="fas fa-print" style="padding-left: 5px"></i></button>
                        </form>
                    </div>
                </div>


                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table id="datatable" class="display table table-data-width w3-table w3-bordered w3-white">
                            <thead>
                                <tr class="w3-black">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Location</th>
                                    <th>Registered On</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                    	
                                    	String delete_id = request.getParameter("d_id");
                                    	
                                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false", "root", "");
                                        
                                        PreparedStatement ps;
                                        ResultSet rs;
                                        
                                        
										if(delete_id != null){
                                    		
											ps = con.prepareStatement("DELETE FROM `hotel10` WHERE `hotel10`.`hotel_id` = ?");
	                                        ps.setString(1, delete_id);
											ps.executeUpdate();

                                    		
                                    	}
                                    	

                                        ps = con.prepareStatement("select * from hotel10 WHERE part = 'Restaurant'");

                                        rs = ps.executeQuery();

                                        while (rs.next()) {

                                %>

                                <tr class="w3-white">
                                	<td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><img src="<%=rs.getString(3)%>" style="width:45px;"></td>
                                    <td><%=rs.getString(12)%></td>
                                    <td><%=rs.getDate(15)%></td>
                                    <td style="width: 15px"><a class="w3-button w3-blue w3-border w3-border-blue w3-hover-border-blue w3-hover-white w3-hover-text-blue w3-small" href="<%=request.getContextPath()%>/Hotel-Resort-Spa/adminRestaurantOwnerView.jsp?id=<%=rs.getString(3)%>"><i class="fa fa-spinner"> </i> View</a></td>
                                	<td style="width: 15px"><a class="w3-button w3-red w3-border w3-border-red w3-hover-border-red w3-hover-white w3-hover-text-red w3-small" href="<%=request.getContextPath()%>/Hotel-Resort-Spa/adminRestaurantsView.jsp?d_id=<%=rs.getString(3)%>"><i class="fa fa-trash"> </i> Delete</a></td>
                                </tr>
                                <% }
                                        rs.close();
                                        ps.close();
                                        con.close();
                                    } catch (Exception e) {
                                        System.out.println(e);
                                    }

                                %>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
