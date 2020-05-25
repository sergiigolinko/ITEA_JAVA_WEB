<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Photoshoot 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20110926

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>TENNIS STORE</title>
<link href="/les8/static/styles/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="jquery.poptrox-0.1.js"></script>
</head>
<body>
<div id="header" class="container">
	<div id="logo">
		<h1><a href="#">WORLD OF TENNIS</a></h1>
		<p>EVERYTHING YOU WANT IS HERE<a href="http://www.freecsstemplates.org"></a></p>
	</div>
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="index.php">Главная</a></li>
			<li><a href="/les8/products">Товары</a></li>
			<li><a href="registration.php">Регистрация</a></li>
			<li><a href="login.php">Вход</a></li>
			<li><a href="/les8/CartController">Корзина</a></li>
		</ul>
	</div>
</div>
<!-- end #header -->
<div id="poptrox">
	<!-- start -->
	<ul id="gallery">
		<li><a href="static/images/10.jpg"><img src="/les8/static/images/10.jpg" title="Phasellus nec erat sit amet nibh pellentesque congue." alt="" /></a></li>
		<li><a href="static/images/12.jpg"><img src="/les8/static/images/12.jpg" title="Phasellus nec erat sit amet nibh pellentesque congue." alt="" /></a></li>
		<li><a href="static/images/14.jpg"><img src="/les8/static/images/14.jpg" title="Phasellus nec erat sit amet nibh pellentesque congue." alt="" /></a></li>
		<li><a href="static/images/15.jpg"><img src="/les8/static/images/15.jpg" title="Phasellus nec erat sit amet nibh pellentesque congue." alt="" /></a></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	<br class="clear" />
	<script type="text/javascript">
		$('#gallery').poptrox();
		</script>
	<!-- end -->
</div>
<div id="page">
	<div id="bg1">
		<div id="bg2">
			<div id="bg3">
				<div id="content">
					<center>
    <c:forEach var="product" items="${sessionScope.CART}">
    
    

    
    <table border='0'>
      <tr>
      <td width='200px'><b>${product.key.name}</b></td>
      <td width='100px'><form method='post'><input type='hidden' name='idProduct' value='${product.key.id}'><input type='submit' value='More'/></form></td>
      </tr>
      <tr>
      <td width='100px'><img height='${imgHeight}' src="/les8/static/images/${product.key.id}.jpg"/></td>
      <td>${product.key.description}</td>
      </tr>
       <tr>
       <td><i>price:</i>${product.key.price}</td>
       <td align='right'><form action='CartController' method='post'><input type='hidden' name='idProduct' value='${product.key.id}'><input type='submit' value='${product.value}'></form></td>
       </tr>
       
    </table>
        
    </c:forEach>
</center> 
            </div>
            
				<div id="sidebar">
					<table border=1>
                    <tr>
                    <td width="252" align="left">
                    <font color=white>
                    <br />
                    В вашей корзине 0 товаров.
                    </font>
                    </td>
                    </tr>
                    </table>
                    <h2>Боковое меню</h2>
					<ul>
						<li><a href="?category=TennisBalls">TennisBalls</a></li>
						<li><a href="?category=TennisRackets">TennisRackets</a></li>
						<li><a href="?category=TennisTables">TennisTables</a></li>
						<li><a href="registration.php">Регистрация</a></li>
						<li><a href="login.php">Вход</a></li>
						<li><a href="cart.php">Корзина</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<p>Cactus Studios</p>
</div>
<!-- end #footer -->
</body>
</html>