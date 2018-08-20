<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.sucre.component.CookieHandler"%>
<%@ page import="com.sucre.common.webUtils"%>
<%@ page import="com.sucre.entity.UserEntity"%>
<%@ page import="com.sucre.entity.weiboEntity"%>
<%@ page import="com.sucre.entity.commentEntity"%>
<%@ page import="com.sucre.entity.DroneEntity"%>
<%@ page import="com.sucre.entity.DroneCommentEntity"%>
<%@ page import="com.sucre.entity.GenerationEntity"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager page</title>
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">

</head>
<body>
	<%
		CookieHandler.setUser(request);
		HttpSession s = request.getSession();
		String source = (String) s.getAttribute("source");
		String pages = (String) s.getAttribute("page");
		if (webUtils.getCookie(request.getCookies(), "cool") == "") {
			out.println("未登录!");
			return;
		} else {

			UserEntity u = (UserEntity) s.getAttribute("currentUser");
			if (u != null && u.isIsmanager() && !u.isIsblock()) {

			} else {
				out.println("权限不足!");
				return;
			}
		}
	%>

	<script src="jquery-3.3.1.min.js"></script>

	<script src="jquery.backstretch.min.js"></script>
	<script src="jquery.backstretch.js"></script>

	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script>
		
	<%out.println("var page=" + pages);
			out.println("var source=" + source);%>
		
	</script>
	<br>
	<br>
	<br>

	<img src="${sessionScope.currentUser.avater}">

	<div></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<form action="manager.do" method="POST">
						<select name="source" value="${sessionScope.source}">

							<%
								String[] n = {"user", "weibo", "comments", "drone", "dronecommant", "generation"};
								String selected = "";
								for (int i = 0; i <= 5; i++) {
									if (String.valueOf(i).equals(source)) {
										selected = "selected=\" select \"";
									}
									out.println("<option value=\"" + i + "\" " + selected + ">" + n[i] + "</option>");
									selected = "";
								}
							%>


						</select> <input type="hidden" name="page" value="1" />
						<button class="btn btn-success" type="submit">查询</button>
					</form>
				</div>
				<table class="table"
					style="border: 1px #ccc solid; margin-left: 1px; width: 100%; height: 30%; padding: 98px;">

					<%
						List<?> ret = CookieHandler.getAll(source, pages);
						if (ret == null) {
							out.println("出错了!");
							return;
						}

						switch (source) {
							//user表
							case ("0") :
								out.println(
										"<thead><tr><th>ID</th><th>Token</th><th>注册日期</th><th>注册ip</th><th>Uid</th><th>昵称</th><th>密码</th><th>RefreshToken</th><th>黑名单</th><th>Cookie</th><th>头像</th><th>管理员</th></tr></thead>");
								out.println("<tbody>");
								for (int i = 0; i < ret.size(); i++) {
									//token,regday,regip,uid,nickname,psd,refresh_token,isblock,cookie,avater,ismanager
									UserEntity u = (UserEntity) ret.get(i);
									out.println("<tr class=\"success tableDetail\" id=\" " + u.getId() + " \"><td>" + u.getId()
											+ "</td>" + "<td>" + u.getToken() + "</td>" + "<td>" + u.getRegday() + "</td>" + "<td>"
											+ u.getRegip() + "</td>" + "<td>" + u.getUid() + "</td>" + "<td>" + u.getNickname()
											+ "</td>" + "<td>" + u.getPsd() + "</td>" + "<td>" + u.getRefresh_token() + "</td>"
											+ "<td>" + u.isIsblock() + "</td>" + "<td>" + u.getCookie() + "</td>" + "<td>"
											+ u.getAvater() + "</td>" + "<td>" + u.isIsmanager() + "</td></tr>");
								}
								out.println("</tbody>");
								//
								break;

							//weibo 
							case ("1") :
								out.println(
										"<thead><tr><th>ID</th><th>Token</th><th>发布日期</th><th>发布ip</th><th>mid</th><th>昵称</th><th>头像</th><th>内容</th><th>图片地址</th></tr></thead>");
								out.println("<tbody>");
								for (int i = 0; i < ret.size(); i++) {
									// <!-- token, postday,postip,mid,nickname,avater,content,picurl -->
									weiboEntity u = (weiboEntity) ret.get(i);

									out.println("<tr class=\"success tableDetail\" id=\" " + u.getId() + " \"><td>" + u.getId()
											+ "</td>" + "<td>" + u.getToken() + "</td>" + "<td>" + u.getPostday() + "</td>" + "<td>"
											+ u.getPostip() + "</td>" + "<td>" + u.getMid() + "</td>" + "<td>" + u.getNickname()
											+ "</td>" + "<td>" + u.getAvater() + "</td>" + "<td>" + u.getContent() + "</td>"
											+ "<td>" + u.getPicurl() + "</td></tr>");
								}
								out.println("</tbody>");
								break;

							//comments
							case ("2") :
								out.println(
										"<thead><tr><th>ID</th><th>发布ip</th><th>发布日期</th><th>昵称</th><th>Token</th><th>头像</th><th>内容</th><th>wid</th></tr></thead>");
								out.println("<tbody>");
								for (int i = 0; i < ret.size(); i++) {
									// <!-- postip,postday,nickname,token,avater,content,wid -->
									commentEntity u = (commentEntity) ret.get(i);

									out.println("<tr class=\"success tableDetail\" id=\" " + u.getId() + " \"><td>" + u.getId()
											+ "</td>" + "<td>" + u.getPostip() + "</td>" + "<td>" + u.getPostday() + "</td>"
											+ "<td>" + u.getNickname() + "</td>" + "<td>" + u.getToken() + "</td>" + "<td>"
											+ u.getAvater() + "</td>" + "<td>" + u.getContent() + "</td>" + "<td>" + u.getWid()
											+ "</td></tr>");
								}
								out.println("</tbody>");
								break;

							//drone
							case ("3") :
								out.println("<thead><tr><th>ID</th><th>类型</th><th>作品地址</th><th>喜欢数</th><th>内容</th></tr></thead>");
								out.println("<tbody>");
								for (int i = 0; i < ret.size(); i++) {
									// <!-- type,urls,likecount,content -->
									DroneEntity u = (DroneEntity) ret.get(i);

									out.println("<tr class=\"success tableDetail\" id=\" " + u.getId() + " \"><td>" + u.getId()
											+ "</td>" + "<td>" + u.getType() + "</td>" + "<td>" + u.getUrls() + "</td>" + "<td>"
											+ u.getLikecount() + "</td>" + "<td>" + u.getContent() + "</td></tr>");
								}
								out.println("</tbody>");
								break;

							//dronecommant
							case ("4") :
								out.println(
										"<thead><tr><th>ID</th><th>Mid</th><th>Token</th><th>头像</th><th>昵称</th><th>内容</th><th>发布ip</th><th>发布日期</th></tr></thead>");
								out.println("<tbody>");
								for (int i = 0; i < ret.size(); i++) {
									// <!-- mid, token ,avater ,nickname ,content,postip,postday-->
									DroneCommentEntity u = (DroneCommentEntity) ret.get(i);

									out.println("<tr class=\"success tableDetail\" id=\" " + u.getId() + " \"><td>" + u.getId()
											+ "</td>" + "<td>" + u.getMid() + "</td>" + "<td>" + u.getToken() + "</td>" + "<td>"
											+ u.getAvater() + "</td>" + "<td>" + u.getNickname() + "<td>" + u.getContent() + "</td>"
											+ "<td>" + u.getPostip() + "</td>" + "<td>" + u.getPostday() + "</td>" + "</td></tr>");
								}
								out.println("</tbody>");
								break;

							//generation
							case ("5") :
								out.println(
										"<thead><tr><th>ID</th><th>姓名</th><th>配偶姓名</th><th>性别</th><th>父亲ID</th><th>子女ID</th><th>详细内容</th><th>代数</th><th>生日</th><th>头像</th><th>Cookie</th></tr></thead>");
								out.println("<tbody>");
								for (int i = 0; i < ret.size(); i++) {
									// <!--nickname,wife,gender,father,sons,details,generation,birthday,avater,cookie-->
									GenerationEntity u = (GenerationEntity) ret.get(i);

									out.println("<tr class=\"success tableDetail\" id=\" " + u.getId() + " \"><td>" + u.getId()
											+ "</td>" + "<td>" + u.getNickname() + "</td>" + "<td>" + u.getWife() + "</td>" + "<td>"
											+ u.getGender() + "</td>" + "<td>" + u.getFather() + "<td>" + u.getSons() + "</td>"
											+ "<td>" + u.getDetails() + "</td>" + "<td>" + u.getGeneration() + "</td>" + "<td>"
											+ u.getBirthday() + "</td>" + "<td>" + u.getAvater() + "</td>" + "<td>" + u.getCookie()
											+ "</td>" + "</td></tr>");
								}
								out.println("</tbody>");
								break;

						}
						//out.println(webUtils.getEntity(ret));
					%>


				</table>
			</div>


			<nav aria-label="...">
				<ul class="pagination pagination-lg">
					<li class="page-item"><a class="page-link"
						href="manager.do?page=${sessionScope.page -1 }&source=${sessionScope.source}"
						tabindex="-1">上一页</a></li>
					<li class="page-item"><a class="page-link"
						href="manager.do?page=${sessionScope.page +1 }&source=${sessionScope.source}">下一页</a></li>
				</ul>
			</nav>
			<p></p>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<input type="text" name="id" id="id" style="width: 10%" />
				<p></p>
				<input type="text" name="content" id="content" style="width: 90%" />
				<p></p>
				<button class="btn btn-danger" type="button" onclick="deletes()">删除</button>
				<button class="btn btn-danger" type="button" onclick="insert()">插入</button>
				<button class="btn btn-danger" type="button" onclick="updata()">更改</button>
			</div>


		</div>
	</div>

	<script>
		function updata() {
			var s = document.getElementById("id");
			var id = s.value;
			var c = document.getElementById("content");
			var data = c.value;
			$
					.ajax({
						url : "/cool/updata.do",
						type : "POST",
						data : {
							data : data,
							source : source,
							id : id
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						success : function(data, state) {
							alert(data.data);
						}

					})
		}

		function insert() {
			var c = document.getElementById("content");
			var data = c.value;
			$
					.ajax({
						url : "/cool/insert.do",
						type : "POST",
						data : {
							data : data,
							source : source
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						success : function(data, state) {
							alert(data.data);
						}

					})

		}

		function deletes() {
			var s = document.getElementById("id");
			var id = s.value;

			$
					.ajax({
						url : "/cool/delete.do",
						type : "POST",
						data : {
							id : id,
							source : source
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						success : function(data, state) {
							alert(data.data);
						}

					})

		}

		$(document).on('click', '.tableDetail', function() {
			var id = $(this).attr('id').trim();
			var content = $(this).html();
			var s = document.getElementById("id");
			var c = document.getElementById("content");
			s.value = id;
			c.value = content;
		});
	</script>
</body>
</html>