<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script type="text/javascript" src=""></script>

        <link rel="stylesheet" type="text/css" href="form.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <title>customer Register</title>



    </head>


    <body>

        <div id="wrapper">
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="page-content">

                            <div class="post">


                                <!-- Navbar -->
                                <div class="w3-top">
                                    <div class="w3-bar w3-black w3-card">
                                        <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                                        <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
                                        <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ABOUT SRILANKA</a>
                                        <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
                                        <a href="../Gallery_01.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">GALLERY</a>
                                        <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
                                        <div class="w3-dropdown-hover w3-hide-small">
                                            <button class="w3-padding-large w3-button" title="More">THINGS TO DO <i class="fa fa-caret-down"></i></button>     
                                            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                                                <a href="#" class="w3-bar-item w3-button">HOTEL & RESORT</a>
                                                <a href="#" class="w3-bar-item w3-button">SPA</a>
                                                <a href="#" class="w3-bar-item w3-button">ADVENTURS</a>
                                            </div>
                                        </div>
                                        <div class="w3-dropdown-hover w3-hide-small">
                                            <button class="w3-padding-large w3-button" title="More">HIRE FOR YOU <i class="fa fa-caret-down"></i></button>     
                                            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                                                <a href="#" class="w3-bar-item w3-button">VEHICLE</a>
                                                <a href="#" class="w3-bar-item w3-button">TOUR GUIDE</a>
                                                <a href="#" class="w3-bar-item w3-button">DRIVERS</a>
                                            </div>
                                        </div>
                                        <div class="w3-dropdown-hover w3-hide-small">
                                            <button class="w3-padding-large w3-button" title="More">BOOK & REQUEST <i class="fa fa-caret-down"></i></button>     
                                            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                                                <a href="#" class="w3-bar-item w3-button">TOUR PACKAGES</a>
                                                <a href="#" class="w3-bar-item w3-button">EVENT</a>
                                            </div>
                                        </div>
                                        <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG OUT</a>
                                        <a href="customerLogin.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG IN</a>   
                                        <a href="customerRegister.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">SIGN IN</a>

                                        <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>

                                <!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
                                <div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
                                    <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">ABOUT SRILANKA</a>
                                    <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MAP</a>
                                    <a href="../Contacts.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
                                    <a href="../Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MERCH</a>
                                </div>



                                <br><br><br><div class="form-style-5">


                                    <form action="" method="post" enctype="multipart/form-data">
                                        <fieldset>
                                            <i style='font-size:48px' class='fas'>&#xf183;</i><font color ="#00cc7a" size="8"> Customer Registration</font>

                                            <input type="text" name="fusername" placeholder=" First Name *" required >
                                            <input type="text" name="lusername" placeholder=" Last Name *" required >
                                            <input type="text" name="address" placeholder=" address *" required >
                                            <input type="text" name="nic" placeholder=" (NIC)123456789V *" required >
                                            <p><input type="radio" name="gender"  value="Male" />Male</input></p>
                                            <p><input type="radio" name="gender" id="gender" value="Female" />Female</input></p>
                                            <input type="text" name="dateofbirth" placeholder=" (DOB)yyyy-mm-dd" required >
                                            <input type="text" name="email" placeholder="(Email)tour@gmail.com" required >
                                            <input type="text" name="phone" placeholder="(Phone-No)011999999" required >
                                            <input type="text" name="username" placeholder="UserName" required > 
                                            <input type="text" name="password" placeholder="Password" required >
                                            <input type="text" name="repassword" placeholder="Re-Password" required >

                                        </fieldset>

                                        <input type="submit" value="Next" />
                                    </form>
                                    <i style="font-size:48px" class="fa">&#xf1cd;</i><a href="driverRegister.jsp"><font size="5">Register As A Driver</font></p></a>
                                    <i style='font-size:48px' class='fas'>&#xf3c5;</i><a href="tourGuideRegister.jsp"><font size="5">Register As A Tour Guide</font></p></a>
                                    <font size="5">Register As A Owner</font></p>
                                    <div class="dropdown-content">
                                        <li><i style='font-size:48px' class='fas'>&#xf1b9;</i><a href="test1.jsp" style="font-size: 20px">Vehicle..</a></li><br/>
                                        <li><i style='font-size:48px' class='fas'>&#xf236;</i><a href="test1.jsp" style="font-size: 20px">Spa..</a></li><br/>			
                                        <li><i style='font-size:48px' class='fas'>&#xf594;</i><a href="test1.jsp" style="font-size: 20px">Hotel & Resort..</a></li><br/>
                                        <li><i style='font-size:48px' class='fas'>&#xf6ec;</i><a href="adventureCompaniesRegister.jsp" style="font-size: 20px">Adventure Company..</a></li><br/>

                                    </div>


                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>

            <!-- End page content -->


        </div>

    </body>
</html>