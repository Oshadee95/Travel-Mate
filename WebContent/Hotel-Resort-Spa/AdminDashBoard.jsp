<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <!-- Header -->
            


            <div class="w3-panel">
                <div class="w3-row" style="margin-top:25px !important">
                    <div class="w3-col s9">
                    	<div class="w3-row">
	                    	<div class="w3-col s7 w3-padding w3-padding-24">
		                    	<canvas id="myChart" width="175" height="100"></canvas> 
		                    </div>
		                    <div class="w3-col s5 w3-border-left w3-padding-24">
		                        <canvas id="myChart1" width="150" height="100"></canvas>
		                    </div>
		                    <div class="w3-border-bottom w3-col 12"></div>
		                    <div class="w3-row">
			                	<div class="w3-col s12" style="margin-top:50px">
			                		<canvas id="myChart2" width="240" height="75"></canvas>
			                	</div>
			                </div>
	                    </div>
                    </div>
                    <div class="w3-rest" style="padding-left:50px !important; ">
                            <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminHotelView.jsp">
                                <div class="w3-col s12">
                                    <div class="w3-container w3-red w3-border w3-border-red w3-hover-white w3-hover-text-red w3-padding-32">
                                        <div class="w3-left w3-padding"><i class="fa fa-hotel w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Hotel</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminRestaurantsView.jsp" style="text-decoration:none">
                                <div class="w3-col s12">
                                    <div class="w3-container w3-pink w3-border w3-border-pink w3-hover-white w3-hover-text-pink w3-text-white w3-padding-32">
                                        <div class="w3-left w3-padding"><i class="fa fa-concierge-bell w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding" style="padding-right: 10px !important">
                                            <h3>Restaurant</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminSpaView.jsp" style="text-decoration:none">
                                <div class="w3-col s12">
                                    <div class="w3-container w3-purple w3-border w3-border-purple w3-hover-white w3-hover-text-purple w3-text-white w3-padding-32">
                                        <div class="w3-left w3-padding"><i class="fa fa-spa w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding" style="padding-right: 10px !important">
                                            <h3>Spa</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminOwnerView.jsp" style="text-decoration:none">
                                <div class="w3-col s12">
                                    <div class="w3-container w3-indigo w3-border w3-border-indigo w3-hover-white w3-hover-text-indigo w3-text-white w3-padding-32">
                                        <div class="w3-left w3-padding"><i class="fa fa-user-tie w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding" style="padding-right: 10px !important">
                                            <h3>Owner</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/view_reports.jsp" style="text-decoration:none">
                                <div class="w3-col s12">
                                    <div class="w3-container w3-blue w3-border w3-border-blue w3-hover-white w3-hover-text-blue w3-text-white w3-padding-32">
                                        <div class="w3-left w3-padding"><i class="fa fa-file-contract w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding" style="padding-right: 10px !important">
                                            <h3>Report</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/Home.jsp" style="text-decoration:none">
                                <div class="w3-col s12">
                                    <div class="w3-container w3-cyan w3-border w3-border-cyan w3-hover-white w3-hover-text-cyan w3-text-white w3-padding-32">
                                        <div class="w3-left w3-padding"><i class="fa fa-globe-asia w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding" style="padding-right: 10px !important">
                                            <h3>Home</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                    </div>
                </div>
                
            </div>
            
            

            <%@ include file="template/scripts.jsp" %>
            
            <script>
            var chartBorderColors = [
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
                ] 
            
            var chartBackgroundColors = [
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
            ]
            
            

            <%               
            
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false", "root", "");
                
                PreparedStatement ps;
                ResultSet rs;
                
                
                
                
                
                

                // Start of getting business registration cities
                
                ps = con.prepareStatement("SELECT `address` FROM `hotel10` GROUP BY `address`");
                
				rs = ps.executeQuery();
                
                ArrayList<String> categoricalPlacesList = new ArrayList<String>();
                

                while (rs.next()) {
                	categoricalPlacesList.add("'"+rs.getString(1)+"'");
                }
                
                out.print("var labelSet01 = "+categoricalPlacesList+";");
                
                // End of getting business registration cities
                
                
                // Start of getting business registration city count 
                ps = con.prepareStatement("SELECT Count(`address`) FROM `hotel10` GROUP BY `address`");
                
				rs = ps.executeQuery();
                
                ArrayList<String> categoricalPlacesCountList = new ArrayList<String>();
                

                while (rs.next()) {
                	categoricalPlacesCountList.add(rs.getString(1));
                }
                
                out.print("var dataSet01 = "+categoricalPlacesCountList+";");
                
             	// End of getting business registration city count 
             	
             	//-------------------------------------------------------------------------------------
             	
             	
             	
             	
             	
             	
             	
             	
             	// Start of getting business types
                ps = con.prepareStatement("SELECT `part` FROM `hotel10` GROUP BY `part`");
                
				rs = ps.executeQuery();
                
                ArrayList<String> businessTypesList = new ArrayList<String>();
                

                while (rs.next()) {
                	businessTypesList.add("'"+rs.getString(1)+"'");
                }
                
                businessTypesList.add("'Spa'");
                
                out.print("var labelSet02 = "+businessTypesList+";");
                
             	// End of getting business types 

             	
             	// Start of getting business type count 
                ps = con.prepareStatement("SELECT COUNT(`part`) FROM `hotel10` GROUP BY `part`");
                
				rs = ps.executeQuery();
                
                ArrayList<String> businessTypeCountList = new ArrayList<String>();
                

                while (rs.next()) {
                	businessTypeCountList.add(rs.getString(1));
                }
                
                // Start of getting spa count
 				ps = con.prepareStatement("SELECT Count(`address`) FROM `hotel10` GROUP BY `address`");
                
				String spaCount = null;
				rs = ps.executeQuery();
				while (rs.next()) {
                	spaCount = rs.getString(1);
                }
				
				// Adding spa count to arrylist
				businessTypeCountList.add(spaCount);
				
                out.print("var dataSet02 = "+businessTypeCountList+";");
                
             	// End of getting business type count 
             	
             	//------------------------------------------------------------------------------------
             	
             	
             	
             	
             	
             	
             	
             	// Start of getting hotel monthly stat
                ps = con.prepareStatement("SELECT MONTHNAME(`reg_date`) FROM `hotel10` WHERE YEAR(`reg_date`) = YEAR(CURDATE()) AND `part` = 'hotel' GROUP BY MONTH(`reg_date`)");
                
				rs = ps.executeQuery();
                
                ArrayList<String> HotelMonthList = new ArrayList<String>();
                

                while (rs.next()) {
                	HotelMonthList.add("'"+rs.getString(1)+"'");
                }
                
                out.print("var labelSet03 = "+HotelMonthList+";");
                
             	// End of getting business types 

             	
             	// Start of getting business type count 
                ps = con.prepareStatement("SELECT Count(`reg_date`) FROM `hotel10` WHERE YEAR(`reg_date`) = YEAR(CURDATE()) AND `part` = 'hotel' GROUP BY MONTH(`reg_date`)");
                
				rs = ps.executeQuery();
                
                ArrayList<String> hotelMonthlyCountList = new ArrayList<String>();
                

                while (rs.next()) {
                	hotelMonthlyCountList.add(rs.getString(1));
                }
				
                out.print("var dataSet03 = "+hotelMonthlyCountList+";");
                
             	// End of getting business type count 
             	
             	//------------------------------------------------------------------------------------

             	
             	
             	
             	
             	
             	
             	
             	// Start of getting business type count 
                ps = con.prepareStatement("SELECT Count(`reg_date`) FROM `hotel10` WHERE YEAR(`reg_date`) = YEAR(CURDATE()) AND `part` = 'Restaurant' GROUP BY MONTH(`reg_date`)");
                
				rs = ps.executeQuery();
                
                ArrayList<String> RestaurantMonthlyCountList = new ArrayList<String>();
                

                while (rs.next()) {
                	RestaurantMonthlyCountList.add(rs.getString(1));
                }
				
                out.print("var dataSet04 = "+RestaurantMonthlyCountList+";");
                
             	// End of getting business type count 
             	
             	//------------------------------------------------------------------------------------
             	
             	
             	
             	
             	
          
             
             	

                
                
            }catch(Exception e){
            	out.println(e.getMessage());
            }

       		 %>
            	
         	// For a pie chart
         	var ctx = document.getElementById("myChart1").getContext('2d');
         	var myPieChart = new Chart(ctx, {
         	    type: 'pie',
         	   data: {
                   labels: labelSet02,
                   datasets:[{
                	   		data: dataSet02,
                	   		backgroundColor: chartBackgroundColors
                	   		}]
                   }
         	});
         
         
            var ctx01 = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'bar',
                data: {
                    labels: labelSet01,
                    datasets: [{
                            data: dataSet01,
                            backgroundColor: chartBackgroundColors,
                            borderColor: chartBorderColors,
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
                                    labelString: 'Business Registration Categorically',
                                    fontSize: 15
                                },
                                gridLines: {
                                    display: true
                                },
                                ticks: {
                                    beginAtZero:true
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
            
            var ctxline = document.getElementById("myChart2").getContext('2d');
            var myLineChart = new Chart(ctxline, {
                type: 'line',
                data: {
                    labels: labelSet03,
                    datasets:[{
	                    		label: 'Hotel Registrations',
	                 	   		data: dataSet03,
	                 	   		fill: true,
	                 	   		backgroundColor: [
		                 	   		'rgba(244, 67, 54, 0.8)' //red
	                        	],	
		                 	   	borderColor: [
		                 	   		'rgba(244, 67, 54, 1)' //red
	                        	]},
	                        
		                     	{
			            		label: 'Restaurant Registrations',
			         	   		data: dataSet04,
			         	   		fill: true,
			         	   		backgroundColor: [
		                 	   		'rgba(54, 162, 235, 0.8)' //blue
	                        	],
			             	   	borderColor: [
			                        'rgba(54, 162, 235, 1)' //blue
			                 ]}
		                     ]
                    },
                    options: {
                        legend: {
                            display: true,
                        },
                        scales: {
                            yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Hotel / Restaurant Registrations (This Year)',
                                        fontSize: 15
                                    },
                                    gridLines: {
                                        display: false
                                    },
                                    ticks: {
                                        beginAtZero:true
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

        </div>
    </body>

</html>
