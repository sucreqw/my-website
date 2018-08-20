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
	
    <script > $.backstretch("img/photo-top.jpg");</script>

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
					<li class="active"><a href="index.jsp"><strong>首页</strong></a></li>
					<li><a href="twitter.jsp"><strong>吹水区</strong></a></li>
					<li><a href="mydrone.jsp"><strong>我和无人机</strong></a></li>
					<li><a href="share.jsp"><strong>资源分享</strong></a></li>
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
		<div class="row">
			<section class="titles">
				<h1>I am Sucre</h1>
				<h2>I like to Code & Think</h2>
				<p>
					<strong>我想,最完美的人生,应该就是能一直做着自己喜欢的事,并能赖以生存.</strong>
				<p>
			</section>
		</div>
	</div>
	<br>
	<div class="container">
	<div class="row">
	<section class="titles">
	<a href="https://api.weibo.com/oauth2/authorize?client_id=920104979&response_type=code&redirect_uri=http%3A%2F%2Fec2-18-237-81-124.us-west-2.compute.amazonaws.com%2Fcool%2Fcallback.do" rel="noflow" title="新浪微博快速登录" class="btn-quick-login"><img src="img/sina.png" style="width:55px;height:55px; color:#FF0000; "><b>新浪微博快速登录</a>
	</section>
	</div>
	</div>
		<br>
	<br>

	<div class="container">
		<div class="row">
			<section class="talkZone">
				<h1>欢迎来到我的小站!</h1>
				<div class="scrollspy_item scrollspy-title">
					<p class="pp2">
						<strong>这个网站是做什么的?</strong>
					</p>
					<p class="pp3">
						<strong>这里可以吐槽,可以分享,可以记录自己的生活,或者可能你可以在这里找到自己需要的东西</strong>.
					</p>
					<p class="pp3">
						<strong>周围逛逛,希望你喜欢这里,如果您有什么好的建议,请大胆留言</strong>.
					</p>
				</div>

			</section>
		</div>
	</div>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<section class="sub">
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="twitter.jsp" title=""> <img src="img/blowwater.jpg"
								class="img-responsive img-thumbnail">
								<h4 style="text-align: center">进入吹水区</h4>
								<p style="text-align: center">在这里可以畅所欲言,说不定还有你认识的朋友.</p>
						</a>


					</div>
				</div>

				<!-- 第二个版块 -->
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="mydrone.jsp" title=""> <img src="img/mydrone.jpg"
								class="img-responsive img-thumbnail">
								<h4 style="text-align: center">进入无人机</h4>
								<p style="text-align: center">我用无人机拍的图片,视频.全景图,都分享在这里.</p>
						</a>


					</div>
				</div>
				<!-- 第三个版块 -->
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="share.jsp" title=""> <img src="img/share.jpg"
								class="img-responsive img-thumbnail">
								<h4 style="text-align: center">进入分享区</h4>
								<p style="text-align: center">分享好用的软件、应用、歌曲,有需要的告诉我,我会尽量找到上传!</p>
						</a>


					</div>
				</div>

				<!-- 第四个版块 -->
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="familytree.jsp" title=""> <img src="img/chen.png"
								class="img-responsive img-thumbnail">
								<h4 style="text-align: center">陈氏族谱</h4>
								<p style="text-align: center">各位宗亲兄弟来这里提交自己的信息.以方便收集之用!</p>
						</a>


					</div>
				</div>

				<!-- 第六个版块 -->
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="closet.jsp" title=""> <img src="img/tao.jpg"
								class="img-responsive img-thumbnail">
								<h4 style="text-align: center">我的橱窗</h4>
								<p style="text-align: center">需要卖广告的朋友,来这里.大家看看有没有你需要的.</p>
						</a>

					</div>
				</div>
           
			</section>
		</div>
	</div>

<footer>
	<nav class="navbar-defaulf navbar-fixed-bottom text-center">
	     Copyright &copy; sucre 
	</nav>
</footer>

</body>
</html>