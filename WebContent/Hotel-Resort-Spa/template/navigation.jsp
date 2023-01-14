<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4;">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
    <span class="w3-bar-item w3-right">Eco Travels</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-black w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <i class="fas fa-users-cog fa-4x"></i>
        </div>
        <div class="w3-col s8 w3-bar">
            <span>Welcome, <strong>${username}</strong></span><br>
            <a href="" class="w3-bar-item w3-btn"><i class="fa fa-user"></i></a>
            <a href="" class="w3-bar-item w3-btn"><i class="fa fa-cog"></i></a>
            <a href="<%= request.getContextPath()%>/Logout_Serverlet" class="w3-bar-item w3-btn"><i class="fa fa-sign-out-alt"></i></a>
        </div>
    </div>
    <hr style="border: 1px solid transparent">
    
    <div class="w3-container" style="text-align: center">
        <h5>Dashboard</h5>
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
        <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/AdminDashBoard.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-tachometer-alt fa-fw"></i>&nbsp; Dashboard</a>
        <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminHotelView.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-hotel fa-fw"></i>&nbsp; Hotels</a>
        <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminRestaurantsView.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-concierge-bell fa-fw"></i>&nbsp; Restaurants</a>
        <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminSpaView.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-spa fa-fw"></i>&nbsp; Spa</a>
        <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/adminOwnerView.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-user-tie fa-fw"></i>&nbsp; Owners</a>
        
        <a href="<%= request.getContextPath()%>/Hotel-Resort-Spa/view_reports.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-file-contract fa-fw"></i>&nbsp; Reports</a>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>


<%
    try {
        Object username = request.getSession(false).getAttribute("username");
        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/admin_login.jsp");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>