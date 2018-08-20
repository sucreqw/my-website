<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sucre's Place</title>
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/style.css">
</head>
<body>
	<script src="jquery-3.3.1.min.js"></script>

	<script src="jquery.backstretch.min.js"></script>
	<script src="jquery.backstretch.js"></script>

	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
    <script > $.backstretch("img/share-bg.jpg");</script>

	<!-- HTML-->
	<nav class="navbar navbar-fixed-top ">
		<div class="container">
		<div class="thumbnail_container">
			<!-- navbar-header -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="true"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"  style="color:#fff" ><strong>----</strong></span> <span
						class="icon-bar"  style="color:#fff" ><strong>----</strong></span> <span
						class="icon-bar"  style="color:#fff" ><strong>----</strong></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img
					src="img/mylogo2.png"></a>
			</div>
			<!-- navbar-nav -->
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp"><strong>首页</strong></a></li>
					<li><a href="twitter.jsp"><strong>吹水区</strong></a></li>
					<li><a href="mydrone.jsp"><strong>我和无人机</strong></a></li>
					<li class="active"><a href="share.jsp"><strong>资源分享</strong></a></li>
					<li><a href="familytree.jsp"><strong>我们的族谱</strong></a></li>
					<li><a href="closet.jsp"><strong>我的橱窗</strong></a></li>
					<li><a href="about.jsp"><strong>关于网站</strong></a></li>
				</ul>
				
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	
	<div class="container">
	<div class="row" >
	<div class="col-md-12 col-sm-12 clo-xs-12">
	<ul class="share">
	<div class="panel panel-default">
	<div class="panel-body">
	<li>暂无分享,欢迎投稿或建议</li>
	</div>
	</div>
	
	</ul>
	</div>
	</div>
	</div>
	
</body>
</html>