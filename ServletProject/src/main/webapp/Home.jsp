<%@page import="com.tnaneen.servletproject.Product"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ustora Demo</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


        <style>
            .dropbtn {
                background-color: #F7FDF9;
                color: black;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #5A87CA}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #5A87CA;
            }
        </style>
    </head>
    <body>
        <!--no login-->
        <c:choose>
            <c:when test="${sessionScope.user==null}">
                <div class="header-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="user-menu">
                                    <ul>
                                        <!--
            <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
            <li><a href="cart.html"><i class="fa fa-user"></i> My Cart</a></li>
            <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>
                                        -->
                                        <li><a href="logIn.jsp"><i class="fa fa-user"></i> Login</a></li>
                                        <li><a href="sign up.jsp"><i class="fa fa-user"></i> Sign up</a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- End header area -->
            </c:when>
            <c:otherwise>
                <!--with log in -->

                <div class="header-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="user-menu">
                                    <ul>
                                        <!--
            <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
            <li><a href="cart.html"><i class="fa fa-user"></i> My Cart</a></li>
            <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>
                                        -->
                                        <li><a href="Editacc.jsp"><i class="fa fa-user"></i>My Account</a></li>
                                        <li><a href="logoutServlet"><i class="fa fa-user"></i> Log out</a></li>
                                        <li><a href="charge.jsp"><i class="fa fa-money"></i> Recharge</a></li>    
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- End header area -->
            </c:otherwise>
        </c:choose>




        <!--No Login-->
        <c:choose>

            <c:when test="${sessionScope.user==null}">

                <div class="site-branding-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="logo">
                                    <h1><a href="Home.jsp"><img src="img/logo.png"></a></h1>
                                </div>
                            </div>								
                        </div>
                    </div>
                </div> <!-- End site branding area -->
            </c:when>


            <c:otherwise>
                <!--with Log in-->
                <div class="site-branding-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="logo">
                                    <h1><a href="Home.jsp"><img src="img/logo.png"></a></h1>
                                </div>
                            </div>			
                            <div class="col-sm-6">
                                <div class="shopping-item">
                                    <a href="cart.jsp">Cash - <span class="cart-amunt">$${sessionScope.user.getCreditLimit()}</span> <i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>			
                        </div>
                    </div>
                </div> <!-- End site branding area -->
            </c:otherwise>
        </c:choose>


        <!--NoLogIn-->
        <c:choose>
            <c:when test="${sessionScope.user==null}">
                <div class="mainmenu-area">
                    <div class="container">
                        <div class="row">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div> 
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="Home.jsp">Home</a></li>
                                    <!--
                                     <li><a href="#">Category</a></li>
                                    -->
                                    <div class="dropdown">
                                        <button class="dropbtn">Categories</button>
                                        <div class="dropdown-content">
                                            <a href="getAllProductsServlet?category=mobiles">Mobile phone</a>
                                            <a href="getAllProductsServlet?category=laptops">Laptops</a>
                                            <a href="getAllProductsServlet?category=gaming">Gaming</a>
                                            <a href="getAllProductsServlet?category=headphones">headphones</a>
                                        </div>
                                     
                                    </div>
                                      <div class="dropdown">
                                      <button class="dropbtn">Prices</button>
                                            <div class="dropdown-content">
                                                <a href="SearchServlet?minPrice=1000&maxPrice=6000">1000-6000</a>
                                                <a href="SearchServlet?minPrice=6000&maxPrice=12000">6000-12000</a>
                                                <a href="SearchServlet?minPrice=12000&maxPrice=18000">12000-18000</a>
                                                <a href="SearchServlet?minPrice=18000&maxPrice=24000">18000-24000</a>
                                            </div>
                                      </div>
                                    
                                    <!--
           <li><a href="checkout.html">Checkout</a></li>
          <li><a href="single-product.html">Single product</a></li>
                                   <li><a href="shop.html">Shop page</a></li>
 
           <li><a href="cart.html">Cart</a></li>					   
           <li><a href="#">Others</a></li>
           <li><a href="#">Contact</a></li>
                                    -->
                                </ul>
                            </div>  
                        </div>
                    </div>
                </div> <!-- End mainmenu area -->

            </c:when>

            <c:otherwise>
                <!--Login-->

                <div class="mainmenu-area">
                    <div class="container">
                        <div class="row">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div> 
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="Home.jsp">Home</a></li>

                                    <div class="dropdown">
                                        <button class="dropbtn">Categories</button>
                                        <div class="dropdown-content">
                                            <a href="getAllProductsServlet?category=mobiles">Mobile phone</a>
                                            <a href="getAllProductsServlet?category=laptops">Laptops</a>
                                            <a href="getAllProductsServlet?category=gaming">Gaming</a>
                                            <a href="getAllProductsServlet?category=headphones">headphones</a>
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button class="dropbtn">Prices</button>
                                        <div class="dropdown-content">
                                            <a href="SearchServlet?minPrice=1000&maxPrice=6000">1000-6000</a>
                                            <a href="SearchServlet?minPrice=6000&maxPrice=12000">6000-12000</a>
                                            <a href="SearchServlet?minPrice=12000&maxPrice=18000">12000-18000</a>
                                            <a href="SearchServlet?minPrice=18000&maxPrice=24000">18000-24000</a>
                                        </div>
                                    </div>
                                    <li ><a href="cart.jsp">MyCart</a></li>		
                                    <!--
           <li><a href="checkout.html">Checkout</a></li>
          <li><a href="single-product.html">Single product</a></li>
                                   <li><a href="shop.html">Shop page</a></li>
 
                              
           <li><a href="#">Others</a></li>
           <li><a href="#">Contact</a></li>
                                    -->
                                </ul>
                            </div>  
                        </div>
                    </div>
                </div> <!-- End mainmenu area -->
            </c:otherwise>
        </c:choose>




        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4">
                <ul class="" id="bxslider-home4">
                    <li>
                        <img src="img/h4-slide.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                iPhone <span class="primary">6 <strong>Plus</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Dual SIM</h4>
                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                    <li><img src="img/h4-slide2.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                by one, get one <span class="primary">50% <strong>off</strong></span>
                            </h2>
                            <h4 class="caption subtitle">school supplies & backpacks.*</h4>
                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                    <li><img src="img/h4-slide3.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Apple <span class="primary">Store <strong>Ipod</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Select Item</h4>
                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                    <li><img src="img/h4-slide4.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                Apple <span class="primary">Store <strong>Ipod</strong></span>
                            </h2>
                            <h4 class="caption subtitle">& Phone</h4>
                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                </ul>
            </div>
            <!-- ./Slider -->
        </div> <!-- End slider area -->

        <div class="promo-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo1">
                            <i class="fa fa-refresh"></i>
                            <p>30 Days return</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo2">
                            <i class="fa fa-truck"></i>
                            <p>Free shipping</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo3">
                            <i class="fa fa-lock"></i>
                            <p>Secure payments</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo4">
                            <i class="fa fa-gift"></i>
                            <p>New products</p>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End promo area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">Products</h2>

                            <div class="product-carousel">
                                <c:choose>
                                    <c:when test="${sessionScope.filteredProducts==null}" >
                                        <% System.out.println("7amada fash5"); %>
                                        <c:forEach items="${sessionScope.products}" var="product">
                                            <div class="single-product">
                                                <div class="product-f-image">
                                                    <img src="img/${product.getImage()}" alt="">
                                                    <div class="product-hover">
                                                        <a href="CheckIfLoggedIn?selectedProduct=${product.getId()}&productName=${product.getName()}&productPrice=${product.getPrice()}&productImage=${product.getImage()}" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                        <a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                    </div>
                                                </div>

                                                <h2><a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}">${product.getName()}</a></h2>

                                                <div class="product-carousel-price">
                                                    <ins>$${product.getPrice()}</ins> <del>$100.00</del>
                                                </div> 
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <% System.out.println("7amada fash5 tenen"+((ArrayList<Product>) session.getAttribute("filteredProducts")).size()); %>
                                        <c:forEach items="${sessionScope.filteredProducts}" var="product">
                                            
                                            <div class="single-product">
                                                <div class="product-f-image">
                                                    <img src="img/${product.getImage()}" alt="">
                                                    <div class="product-hover">
                                                        <a href="CheckIfLoggedIn?selectedProduct=${product.getId()}&productName=${product.getName()}&productPrice=${product.getPrice()}&productImage=${product.getImage()}" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                        <a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                    </div>
                                                </div>

                                                <h2><a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}">${product.getName()}</a></h2>

                                                <div class="product-carousel-price">
                                                    <ins>$${product.getPrice()}</ins> <del>$100.00</del>
                                                </div> 
                                            </div>
                                        </c:forEach> 
                                            <% session.removeAttribute("filteredProducts"); %>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->







        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>

        <!-- Slider -->
        <script type="text/javascript" src="js/bxslider.min.js"></script>
        <script type="text/javascript" src="js/script.slider.js"></script>
    </body>
</html>
