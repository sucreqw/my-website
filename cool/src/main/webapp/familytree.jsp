<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.sucre.component.CookieHandler"%>
<%@ page import="com.sucre.common.webUtils"%>

<!!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>陈氏族谱</title>
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/twitter.css">

<style>
.fullsize {
	width: 100%;
	height: 70%;
	overflow-x: hidden;
}
</style>

<%
	CookieHandler.setUser(request);
%>

</head>
<body>
	<script src="jquery-3.3.1.min.js"></script>

	<script src="jquery.backstretch.min.js"></script>
	<script src="jquery.backstretch.js"></script>

	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="Util.js"></script>


	<script>
		$.backstretch("img/test.jpg");
	</script>
	<script>
		var currentId;
		var picurl = '';
	</script>
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
						class="icon-bar" style="color: #fff"><strong>----</strong></span>
					<span class="icon-bar" style="color: #fff"><strong>----</strong></span>
					<span class="icon-bar" style="color: #fff"><strong>----</strong></span>
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
					<li class="active"><a href="familytree.jsp"><strong>我们的族谱</strong></a></li>
					<li><a href="closet.jsp"><strong>我的橱窗</strong></a></li>
					<li><a href="about.jsp"><strong>关于网站</strong></a></li>
				</ul>

			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>


	<IFRAME NAME="treeframe" ID="treeframe" SRC="tree.jsp" CLASS="fullsize"
		frameborder="0"></IFRAME>
	<IFRAME NAME="detailframe" ID="detailframe" SRC="" CLASS="fullsize"
		frameborder="0" style="display: none;"></IFRAME>

	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<table
					style="border: 1px #ccc solid; margin-left: 1px; width: 100%; height: 30%; padding: 98px;">

					<tr>
						<td><em id="name"></em></td>
					</tr>
					<tr>
						<td><input class="btn btn-info" value="查看他的详细信息"
							type="button" onclick="checkInfo()" />
					</tr>
					<tr>
						<td><b><input id="r1" type="radio" value="0" name="info">为他添加父亲</input><b><input
									id="r2" type="radio" value="1" name="info">为他添加子女</input> <input
									id="g1" type="radio" value="0" name="gender">女</input><input
									id="g2" type="radio" value="1" name="gender" checked="checked">男</input></td>
					</tr>

					<tr>
						<td><input type="text" id="nickname" placeholder="姓名"
							style="width: 20%;"></input> <input type="text" id="wifename"
							placeholder="配偶姓名" style="width: 20%;"></input> <input
							type="text" id="birthday" placeholder="出生日期:1999-03-03 12:00"
							style="width: 55%;"></input>

							<div contentEditable="true" id="content"
								class="form-control input-lg" style="height: 125px">
								<%
									/* ServletContext sc = this.getServletContext();  
									ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);  
									CookieHandler cookie = (CookieHandler) ac.getBean("abc"); */

									/* 	ApplicationContext ac = RequestContextUtils.findWebApplicationContext(request);
										UserFunctionImpl abc = (UserFunctionImpl) 
												ac.getBean("user");
										//abc.setUser(request); */
									if (webUtils.getCookie(request.getCookies(), "cool") == "") {
										out.println("请先登录!");
									}
								%>
							</div></td>
					</tr>
					<tr>
						<td>
							<button class="btn btn-success" type="button" id="sendbut">提交</button>
							<button class="btn btn-danger" type="button" id="sendpic">上传</button>
							<a class="S_txt1" href="" title="图片" style="position: relative;"><em
								class="W_image">p</em>图片
								<div
									style="position: absolute; left: 0px; top: 0px; display: block; overflow: hidden; background-color: rgb(0, 0, 0); opacity: 0; width: 49px; height: 24px;">
									<form id="pic_upload" name="pic_upload"
										action="/cool/upload.do" target="framFile"
										enctype="multipart/form-data" method="POST"
										style="overflow: hidden; opacity: 0; height: 24px; width: 49px;">
										<input type="file"
											accept="image/jpg,image/jpeg,image/png,image/gif"
											hidefoucs="true" name="pic1"
											style="cursor: pointer; width: 1000px; height: 1000px; position: absolute; bottom: 0; right: 0; font-size: 200px;"
											id="swf_upbtn_15335319690982761" >

									</form>
								</div></a> <iframe id="framFile" name="framFile" style="display: none;"></iframe>
						</td>
					</tr>
					<tr>
						<td>
							<p></p> <input id="searchname" type="text"
							,placeholder="在这里输入姓名搜索" style="width: 20%;" /> <input
							class="btn btn-info" value="搜索" type="button" onclick="search()" />
							<p></p>

							<table class="searchtable" style="display:none;">
								<thead>
									<tr>
										<th>结果</th>
									</tr>

								</thead>
								<tbody>
									<tr>
										<td></td>
									</tr>
								</tbody>
							</table>
							<p></p>
						</td>
					</tr>

				</table>
			</div>
			<form id="getdetails" action="/cool/detail.do" method="POST"
				target="detailframe">
				<input type='hidden' name='id' id='id' value='' />
			</form>

		</div>
	</div>

	<script>
		//frameborder="0" scrolling="no"

		//页面点击事件
		/*  $(document).click(function(e) {
			// alert(e);
		 });  */

		//搜索一个人
		function search() {
			 $(".searchtable").html('');
			var nickname = document.getElementById("searchname").value;
			$
					.ajax({
						url : "/cool/search.do",
						type : "POST",
						data : {
							"nickname" : nickname
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",

						success : function(data, state) {
							var arr=new Array();
							arr=data.data.split("SonEntity");
							for(i=1;i<arr.length;i++){
								//searchtable id=32, nickname=陈景维字强, wife=祝伙霞]
								var id=midWord("id=",",",arr[i]);
								var nickname=midWord("nickname=",",",arr[i]);
								var wife=midWord("wife=","]",arr[i]);

								$(".searchtable").append('<div class=\"result\" id=\"'+ id +'\"> 姓名: '+ nickname +' 妻子姓名:'+ wife+ '</div>');
							}
							$(".searchtable")[0].style.display = "block";
						}
					})
		}
		//设置当前选中的人的id
		function setName(id) {
			var s = document.getElementById("name");
			s.innerText = $(id).text().trim();
			currentId = $(id).attr('id');
			//$('#treeframe').scrollTop( $('#treeframe')[0].scrollHeight );

		}

		function checkInfo() {
			if (currentId != null && currentId != "" && currentId != 0) {
				var input_id = document.getElementById('id');
				input_id.value = currentId;
				var form = document.getElementById('getdetails');
				form.submit();
				var tree = document.getElementById('treeframe');
				tree.style.display = "none";
				var detail = document.getElementById('detailframe');
				detail.style.display = "block";
			}
		}
		function doneCheckInfo() {
			var tree = document.getElementById('treeframe');
			tree.style.display = "block";
			var detail = document.getElementById('detailframe');
			detail.style.display = "none";
			window.frames["treeframe"].window.rolls(currentId);
		}
		$(document)
				.on(
						'click',
						'.btn-success',
						function() {

							var data = $("#content")[0].innerText;
							data = data.replace(/\t/g, "");
							data = data.replace(/\r/g, "");
							data = data.replace(/\n/g, "");
							//alert(data);
							var id;
							var nickname;
							var wife;
							var details;
							var avater;
							var birthday;
							var isfather;
							var gender;

							id = currentId;
							nickname = document.getElementById("nickname").value;
							;
							wife = document.getElementById("wifename").value;
							birthday = document.getElementById("birthday").value;
							details = data;
							avater = picurl;
							if (document.getElementById("r1").checked) {
								isfather = "0";
							} else {
								isfather = "1";
							}
							if (document.getElementById("g1").checked) {
								gender = "0";
							} else {
								gender = "1";
							}

							$
									.ajax({
										url : "/cool/addperson.do",
										type : "POST",
										data : {
											"id" : id,
											"nickname" : nickname,
											"wife" : wife,
											"gender" : gender,
											"details" : details,
											"avater" : avater,
											"birthday" : birthday,
											"isfather" : isfather
										},
										contentType : "application/x-www-form-urlencoded; charset=utf-8",

										success : function(data, state) {
											alert(data.data);

										}
									})

						});

		//搜索结果点击
		//result
		$(document).on('click', '.result', function() {
			var id=$(this).attr('id').trim();
			
			window.frames["treeframe"].window.clearAll();
			//getallfather.do
			$.ajax({
						url : "/cool/getallfather.do",
						type : "POST",
						data : {
							"id" : id
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",

						success : function(data, state) {
							var data=data.data;
							var arr=new Array();
							arr=data.split("\|");
							
							//for(i=1;i<arr.length-1;i++){
								window.frames["treeframe"].window.getdataAll(arr);
								
								//alert(arr[i]);
							//}
							
							
						}
					})
			
			//
			
		});
		
		//上传图片按钮!
		//btn-danger
		$(document).on('click', '.btn-danger', function() {
			document.getElementById("sendpic").innerHTML = "正在上传!";
			document.getElementById("sendbut").disabled = true;
			$("#pic_upload").submit();
		});
		//framFile
		var oFrm = document.getElementById("framFile");

		//监听frame的变化信息
		oFrm.onload = oFrm.onreadystatechange = function() {
			if (this.readyState && this.readyState != "complete")
				return;
			var content = oFrm.contentDocument.activeElement.innerText;
			picurl = midWord("filename:", "\"", content);
			document.getElementById("sendpic").innerHTML = "上传成功!";
			document.getElementById("sendbut").disabled = false;
		}
		
		window.onload = function(){
		     //alert("网页可见区域宽："+document.body.clientWidth+"\n 屏幕可用工作区宽度："+ window.screen.availWidth+"\n");
		 
		     if (navigator.userAgent.match(/iPad|iPhone/i)){
		    	 
		    	 document.body.style.width = (window.screen.availWidth/document.body.clientWidth)*100+'%';
		     }
		         
		}
		    	 //return false;}
		     //如果是iphone,ipad，则重新修改body宽度值
		    // document.body.style.width = (window.screen.availWidth/document.body.clientWidth)*100+'%';<br>}   
		
		
	</script>
</body>
</html>