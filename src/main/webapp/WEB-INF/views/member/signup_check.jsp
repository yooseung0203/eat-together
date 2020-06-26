<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav id="navbar-example2" class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="#">Navbar</a>
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link" href="#fat">@fat</a></li>
			<li class="nav-item"><a class="nav-link" href="#mdo">@mdo</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#one">one</a> <a
						class="dropdown-item" href="#two">two</a>
					<div role="separator" class="dropdown-divider"></div>
					<a class="dropdown-item" href="#three">three</a>
				</div></li>
		</ul>
	</nav>
	<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
		<h4 id="fat">@fat</h4>
		<p>...</p>
		<h4 id="mdo">@mdo</h4>
		<p>...</p>
		<h4 id="one">one</h4>
		<p>...</p>
		<h4 id="two">two</h4>
		<p>...</p>
		<h4 id="three">three</h4>
		<p>...</p>
	</div>
</body>
</html>