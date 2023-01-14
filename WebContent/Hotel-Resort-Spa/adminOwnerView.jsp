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
                    <h6>Dashboard / Owners</h6>
                </header>
            </div>
            
            <div class="w3-panel">


                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table id="datatable" class="display table table-data-width w3-table w3-bordered w3-white">
                            <thead>
                                <tr class="w3-black">
                                    <th>First name</th>
                                    <th>Last name</th>
                                    <th>Address</th>
                                    <th>NIC</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false", "root", "");

                                        PreparedStatement ps = con.prepareStatement("select * from owner");

                                        ResultSet rs = ps.executeQuery();

                                        while (rs.next()) {

                                %>

                                <tr class="w3-white">
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td style="width: 15px"><a class="w3-btn w3-blue w3-small" href="/viewOwner?id=<%=rs.getString(4)%>">View</a></td>

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
