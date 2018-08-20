<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About this WebSite</title>
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
	<script src="index.js"></script>
    <script > $.backstretch("img/aboutbg.jpg");</script>
	
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
						class="icon-bar"  style="color:#000" ><strong>----</strong></span> <span
						class="icon-bar"  style="color:#000" ><strong>----</strong></span> <span
						class="icon-bar"  style="color:#000" ><strong>----</strong></span>
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
					<li><a href="share.jsp"><strong>资源分享</strong></a></li>
					<li><a href="familytree.jsp"><strong>我们的族谱</strong></a></li>
					<li><a href="closet.jsp"><strong>我的橱窗</strong></a></li>
					<li class="active" ><a href="about.jsp"><strong>关于网站</strong></a></li>
				</ul>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	
	<div class="container" style="text-align: center;">
		<div class="row">
		 <div class="col-md-12 col-sm-12 col-xs-12">
			
	         <h1>关于本站</h1>
             
             <h3>做这个网站最大的目的,是为了让自己所学的知识有所实现.</h3>
             <h3>加上本族准备修订族谱,有个网络作为平台给大家提交信息的话</h3>
             <h3>会节省很多时间和减少同错的机率</h3>
             <h3>服务器跟域名都是一年的免费期,相信一年的时间来收集也够了</h3>
             <h3>至于一年后网站还会不会继续,如果一年后我的收入不紧张的话,我想是会继续的.</h3>
             <h3>==================================</h3>
             <h3>网站前端用的是 bootstrap+backstretch+jquery+PhotoSwipe</h3>
             <h3>网站后端用的是 maven+springmvc+jstl+mybatis+c3p0</h3>
             <h3>运行环境为:tomcat</h3>
             <h3>运行平台为:AWS上的Red Hat Enterprise Linux 7.5</h3>
             <h3>数据库用的是 MySQL</h3>
	   
	    </div>
	    </div>
	    </div>
    
</body>
</html>