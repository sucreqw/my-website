<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.io.File"%>
<%@ page import="com.sucre.common.webUtils"%>
<%@ page import="com.sucre.entity.UserEntity"%>
<%@ page import="com.sucre.function.UserFunction"%>
<%@ page import="com.sucre.function.impl.UserFunctionImpl"%>
<%@ page import="com.sucre.component.CookieHandler"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page
	import="org.springframework.web.servlet.support.RequestContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>畅所欲言</title>
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/style.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/twitter.css">
 <link rel="stylesheet" href="photoswipe.css">
</head>
<body>
	<script>
		var page = 1;
		var picurl="";

	</script>
	<%
		CookieHandler.setUser(request);
	%>
	<script src="jquery-3.3.1.min.js"></script>

	<script src="jquery.backstretch.min.js"></script>
	<script src="jquery.backstretch.js"></script>
    <!-- Core JS file -->
	<script src="photoswipe.min.js"></script> 
	<script src="photoswipe-ui-default.min.js"></script> 
	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="Util.js"></script>

	<script>
		$.backstretch("img/bg.jpg");
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
							class="icon-bar" style="color: #000"><strong>----</strong></span>
						<span class="icon-bar" style="color: #000"><strong>----</strong></span>
						<span class="icon-bar" style="color: #000"><strong>----</strong></span>
					</button>
					<a class="navbar-brand" href="index.jsp"><img
						src="img/mylogo2.png"></a>
				</div>
				<!-- navbar-nav -->
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp"><strong>首页</strong></a></li>
						<li class="active"><a href="twitter.jsp"><strong>吹水区</strong></a></li>
						<li><a href="mydrone.jsp"><strong>我和无人机</strong></a></li>
						<li><a href="share.jsp"><strong>资源分享</strong></a></li>
						<li><a href="familytree.jsp"><strong>我们的族谱</strong></a></li>
						<li><a href="closet.jsp"><strong>我的橱窗</strong></a></li>
						<li><a href="about.jsp"><strong>关于网站</strong></a></li>
					</ul>

				</div>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>


	<div class="container">
		<div class="row" id="edit_form">

			<div class="col-sm-12">

				<p class="ficon_swtxt">
					<em class="spac1">有什么新</em><em class="spac2">鲜</em><em
						class="spac3">事想告诉大家</em><em class="spac4">?</em>
				</p>

				<br> <br>

				<div class="col-sm-12">

					<div contentEditable="true" id="content"
						class="form-control input-lg">
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
					</div>

				</div>

			</div>


			<div class="col-sm-12">

				<div>
					<a class="emoji" title="表情"><em class="W_face">o</em>表情</a> 
						<a class="S_txt1" href="" title="图片"
						style="position: relative;"><em class="W_image">p</em>图片
						<div style="position: absolute; left: 0px; top: 0px; display: block; overflow: hidden; background-color: rgb(0, 0, 0); opacity: 0; width: 49px; height: 24px;">
							<form id="pic_upload" name="pic_upload"  action="/cool/upload.do" target="framFile"
								enctype="multipart/form-data" method="POST"
								style="overflow: hidden; opacity: 0; height: 24px; width: 49px;">
								<input type="file" hidefoucs="true" name="pic1" accept="image/*"
									style="cursor: pointer; width: 1000px; height: 1000px; position: absolute; bottom: 0; right: 0; font-size: 200px;"
									id="swf_upbtn_15335319690982761" >
								  
							</form>
						</div></a>
					<button class="btn btn-success" type="button" id="sendbut"
						name="sendbut" >发布</button>
					<button class="btn btn-danger" type="button" id="sendpic" name="sendpic">上传</button>
					<iframe id="framFile" name="framFile" style="display:none;"></iframe>	
				</div>

			</div>


		</div>
		<!-- 表情框 -->
		<div class="container container_bg">
			<div class="row">
				<div class="col-sm-2"></div>

				<div class="col-sm-6 col-xs-12 my_edit">
					<div class="row" id="edit_form">
						<div class="myEmoji" style="display: none;">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active"><a href="#set" data-toggle="tab"> 表情
								</a></li>

							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="set">
									<div class="emoji_1">
										<%
											String dir = pageContext.getServletContext().getRealPath("/face");
											File f = new File(dir);
											File[] fs = f.listFiles();
											for (File file : fs) {
												out.println("<img src=\"" + "face/" + file.getName() + "\" style=\"width:25px;height:25px\">");
											}
										%>



									</div>

								</div>



							</div>

						</div>


					</div>
				</div>
			</div>
		</div>
		<!-- 表情框 -->

		

		<div class="container">
			<div class="myrow"></div>
		</div>
		<script>
		
		
			$(function() {
				
				//一开始显示数据
				//实际中应该是将分页的效果做成加载更多的效果 但是调取数据的原理 是一样的 就是显示数据的效果不一样

				ajax();
				
				
                
				
				$(document).scroll(function() {
					//滚动条滑动的时候获取滚动条距离顶部的距离
					var scroll = $(document).scrollTop();
					//屏幕的高度
					var client = $(window).height();
					var h = $(document).height();
					var flag = true;
					if (h <= scroll + client) { // 到达底部时,加载新内容
						if (flag == false) {
							return;
						}
						ajax();
					}

				});
				function ajax() {

					$
							.ajax({
								url : "/cool/time_line.do",
								type : "POST",
								data : {
									"page" : page,
								},
								contentType : "application/x-www-form-urlencoded; charset=utf-8",

								success : function(data, state) {
									//alert(data.data);
									var strs = new Array(); //定义一数组 
									var strs = data.data.split("weiboEntity");

									for (i = 1; i < strs.length; i++) {
                                        
										var id=midWord('id=',',',strs[i].toString());
										var avater=midWord('avater=',',',strs[i].toString());
				        				var time=midWord('postday=',',',strs[i].toString());
				        	            var mid=midWord('mid=',',',strs[i].toString());
				        	            var nickname= midWord('nickname=',',',strs[i].toString());
				        			    var content=midWord('content=',',',strs[i].toString());
				        	            var picurl=midWord('picurl=',']',strs[i].toString());
				        	            content=makeface(content);
				        	            
				        	            var data='';
				        	            data=data+('<div class=\"row item_msg\" >');
				        	          
				        	            data=data+('			<div class=\"panel panel-default\">');
				        	            data=data+('			   <div class=\"panel-body\">\r\n');
				        	            data=data+('				<div class=\"col-md-12 col-sm-12 col-xs-12 message\">');
				        	            data=data+('					<img t=\"avater\" src=\"'+ avater +'\"');
				        	            data=data+('						class=\"col-md-1 col-sm-2 col-xs-3\" style=\"border-radius: 50%\">');
				        	            data=data+('					<div class=\"col-md-11 col-sm-10 col-xs-9\">');
				        	            data=data+('						<span style=\"font-weight: bold;\" >'+ nickname +'</span> <br> <small');
				        	            data=data+('							class=\"date\" style=\"color: #999\">'+ time +'</small>');
				        	            data=data+('							');
				        	            data=data+('					<div class=\"msg_content\">');
				        	            data=data+('							<br>'+ content +'<br><br> </div></div>');
				        	            
				        	            if(picurl!=""){data=data +'<img class=\"mypic\" id=\"mypic_' + id + '\" src=\"/weiboimg/'+ picurl +'\" style=\"height: 200px;\" >';}
				        	            data=data+('						');
				        	            
				        	            data=data+('						<br><a class=\"comment\" id=\"' + id + '\" href=\"javascript:void(0);\" onclick=\"js_method()\" > <span><em class=\"W_face\"></em><em>评论</em></span></a>');
				        	                                               //<a class="emoji" title="表情"><em class="W_face">o</em>表情</a>
				        	            data=data+('				         <a class=\"like\" title=\"表情\" id=\"' + id + ' \" href=\"javascript:void(0);\" onclick=\"js_zan()\" ><em class="W_face">ñ</em><em id=\"counts_'+ id +'\">'+ mid +'</em></a> ');
				        	           
				        	            data=data+("</div><div class=\"panel panel-default panel-default_"+ id +"\" style=\"display: none; \">\r\n");
				        	            data=data+("			   <div class=\"panel-body\">\r\n");
				        	            data=data+("				\r\n");
				        	            data=data+("\r\n");
				        	            data=data+("				<div class=\"col-sm-12 col-xs-12 my_edit\">\r\n");
				        	            data=data+("					<div class=\"row\" id=\"edit_form\">\r\n");
				        	            data=data+("						<div class=\"myComment_"+ id +"\" style=\"display: none;\">\r\n");
				        	            data=data+("							<div contentEditable=\"true\" id=\"comments_"+ id +"\" class=\"form-control form_"+ id +"\" style=\"font-size: 14px;\">\r\n");
				        	            data=data+("							</div>\r\n");
				        	            data=data+("							<a class=\"emojiComment\" id=\""+ id +"\" title=\"表情\" href=\"javascript:void(0);\" onclick=\"js_face()\" ><em class=\"W_face\">o</em>表情</a>\r\n");
				        	            data=data+("							<button class=\"btn btn-success btn_comment\" type=\"button\" id=\"sendcomment\" name=\""+ id +"\">发布</button>\r\n");
				        	            data=data+("							\r\n");
				        	            data=data+("							<br>\r\n");
				        	            data=data+("							<div class=\"col-sm-12\"><br></div>\r\n");
				        	            data=data+("							    <div class=\"col-sm-12\">\r\n");
				        	         
				        	            //=================================                                        
				        	             data=data+("						<div class=\"myEmojiComment\" id=\"myEmojiComment_"+ id +"\"style=\"display: none;\" href=\"javascript:void(0);\" onclick=\"js_emo()\" >");
										 data=data+("							<ul id=\"myTab\" class=\"nav nav-tabs\">\r\n");
										 data=data+("								<li class=\"active\"><a href=\"#\" data-toggle=\"tab\">表情");
										 data=data+("								</a></li>");
										 data=data+("							</ul>");
										 data=data+("							<div id=\"myTabContent\" class=\"tab-content\">\r\n");
										 data=data+("								<div class=\"tab-pane fade in active\" id=\"set\">\r\n");
										 data=data+("									<div class=\"emoji_"+ id +"\">");
									    <%
											 dir = pageContext.getServletContext().getRealPath("/face");
											 f = new File(dir);
											 fs = f.listFiles();
											for (File file : fs) {
												out.println("data=data+(\"<img src=\\\"face/" + file.getName() + "\\\" style=\\\"width:25px;height:25px\\\" id=\\\"\" + id +\"\\\">\");");
											}
										%>
										
										data=data+("									\r\n");
										
										data=data+("								</div>\r\n");
									    data=data+("							</div>\r\n");
										data=data+("						</div>\r\n");
									    data=data+("						    </div>\r\n");
				        	            data=data+("				</div>\r\n");
				        	            data=data+("			</div>\r\n");
                                        //==========================================================
                                        //data.append("<div class=\"container-fluid\">\r\n");
										//data.append("	<div class=\"row-fluid\">\r\n");
										//data.append("		<div class=\"span12\">\r\n");
										data=data+("			 <button class=\"btn btn-block\" id=\""+ id +"\" name=\"2\" type=\"button\">加载更多</button>");
										//data.append("		</div>\r\n");
										//data.append("	</div>\r\n");
										//data.append("</div>\r\n");
				        	            //==========================================================================
				        	            
				        	           
				        	            data=data+("		</div>\r\n");
				        	            data=data+("	</div>\r\n");
				        	            
				        	            
				        	            
				        	            data=data+('					</div>');
				        	            data=data+('				');
				        	            data=data+('				</div>');
				        	            data=data+('				');
				        	            data=data+('               </div>');
				        	            data=data+('			</div>');
				        	            data=data+('		</div>');
				        	           
										$(".myrow").append(data);
									}

								}
							})
					page++;
				}
				;

			});
		</script>


<!-- 图片放大框 -->
<!-- Root element of PhotoSwipe. Must have class pswp. -->
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

    <!-- Background of PhotoSwipe. 
         It's a separate element, as animating opacity is faster than rgba(). -->
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">

        <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
        <div class="pswp__container">
            <!-- don't modify these 3 pswp__item elements, data is added later on -->
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <!--  Controls are self-explanatory. Order can be changed. -->

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                <button class="pswp__button pswp__button--share" title="Share"></button>

                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
                <!-- element will get class pswp__preloader--active when preloader is running -->
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                      <div class="pswp__preloader__cut">
                        <div class="pswp__preloader__donut"></div>
                      </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div> 
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

          </div>

        </div>

</div>
<!-- 图片放大框 -->

	</div>
	<!-- container! -->

 
 <!-- 评论框 -->
          
			<div class="panel panel-default" style="display: none;">
			   <div class="panel-body">
				

				<div class="col-sm-12 col-xs-12 my_edit">
					<div class="row" id="edit_form">
						<div class="myComment" style="display: none;">
							<div contentEditable="true" id="comments" class="form-control input-lg">
							</div>
							<a class="emoji" title="表情"><em class="W_face">o</em>表情</a>
							<button class="btn btn-success" type="button" id="sendcomment" name="1">发布</button>
							
							<br>
							<div class="col-sm-12"><br></div>
							<div class="col-sm-12">
						 <img src="/cool/avater/super.jpg" class="col-sm-1 col-xs-3" style="border-radius: 50%">
						 <div class="col-sm-11 col-xs-9">
				        	            <span style="font-weight: bold;" >superuser :</span> <span>    厉害我的歌</span> <br> <small class="date" style="color: #999">2018-08-08 15:02:48</small>
						                
						 
						    </div>
                     </div>
				</div>
			</div>
		</div>
		
	</div>

 <!-- 评论框 -->

    <script src="index.js"></script>
    <script >
    
    function showComment(id,pages){
    	
       
		
		
		$.ajax({
			url : "/cool/getcomments.do",
			type : "POST",
			data : {
				"page" : pages,
				"wid" : id,
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",

			success : function(data, state) {
				//commentEntity [id=1, postday=2018-8-8 16:06:01, nickname=SuperUser, avater=super.jpg, content=wqwqwq, wid=1]
				
				var strs = new Array(); //定义一数组 
				var strs = data.data.split("commentEntity");
				for (i = 1; i < strs.length; i++) 
				{
					 var cid=midWord("id=",",",strs[i]);
					 var postday=midWord("postday=",",",strs[i]);
		             var nickname=midWord("nickname=",",",strs[i]);
		             var avater=midWord("avater=",",",strs[i]);
		             var content=midWord("content=",",",strs[i]);
		             var wid=midWord("wid=","]",strs[i]);
		            
		             content=makeface(content);
		             
		             var data="<div class=col-md-12 col-sm-12 col-xs-12>";
					    data=data+("						 <img t=\"avater\" src=\""+ avater +"\" class=\"col-md-1 col-sm-1 col-xs-3\" style=\"border-radius: 50%\">\r\n");
						data=data+("						 <div class=\"col-md-11 col-sm-11 col-xs-9\">\r\n");
						data=data+("				        	            <span style=\"font-weight: bold;\" >"+ nickname +" :</span> <span>    "+ content +"</span> <br> <small class=\"date\" style=\"color: #999\">"+ postday +"</small>\r\n");
		               data=data+("<span> <br><br></span></div>")
		             
					
				    $(".myComment_"+id).append(data);
		               
		         }
				return pages;
			}
			})
			
	  return pages;
    	
    }
    
    
    
    </script>
  <script>
  //评论里的表情按钮
  $(document).on('click','.emojiComment',function (){
		var id=$(this).attr("id").trim();
		//alert(id);
		var s=document.getElementById("myEmojiComment_"+id);
		var ss=s.style.display;//="block";
		if(ss=="block"){
			s.style.display="none";
			
		}else{
			
			s.style.display="block";
		}
	});
  function js_face(){
	  
		var id=$(this).attr("id").trim();
		//alert(id);
		var s=document.getElementById("myEmojiComment_"+id);
		var ss=s.style.display;//="block";
		if(ss=="block"){
			s.style.display="none";
			
		}else{
			
			s.style.display="block";
		} 
	  
  }
  </script>  
  
    <script>
  //评论里的表情框  myEmojiComment
$(document).on('click','.myEmojiComment img',function (){
	    var id=$(this).attr("id").trim();
	    var url = getname($(this)[0].src);
	    $(".form_"+id).append(url);
	});
  
  function js_emo(){
	  var id=$(this).attr("id").trim();
	    var url = getname($(this)[0].src);
	    $(".form_"+id).append(url);
  }
  </script>  
  
    <script>
    //评论被点击
$(document).on('click','.comment',function (){
		var id=$(this).attr("id").trim();
		$(".myComment_"+id).show();
		$(".panel-default_"+id).show();
		 showComment(id,"1");	
	});
    
    
    function js_method(){
    	var id=$(this).attr("id").trim();
		$(".myComment_"+id).show();
		$(".panel-default_"+id).show();
		 showComment(id,"1");	
    	
    }
</script>


    <script>
    //加载更多按钮!
  //btn-block
$(document).on('click','.btn-block',function (){
		var id=$(this).attr("id").trim();
		var page=$(this).attr("name").trim();
		var p=showComment(id,page);	
		var np=parseInt(page)+1;
		$(this).attr("name", np);
		//$(this).attr("name")=np;
		//alert($(this).attr("name"));
		
	});
</script>

 <script>
    //上传图片按钮!
  //btn-danger
$(document).on('click','.btn-danger',function (){
	document.getElementById("sendpic").innerHTML="正在上传!";
	document.getElementById("sendbut").disabled=true;
	$("#pic_upload").submit();
	});
    //framFile
var oFrm = document.getElementById("framFile");
//监听frame的变化信息
oFrm.onload = oFrm.onreadystatechange = function() {
	if (this.readyState && this.readyState != "complete") return;
         var content=oFrm.contentDocument.activeElement.innerText;
         picurl=midWord("filename:","\"",content);
         document.getElementById("sendpic").innerHTML="上传成功!";
         document.getElementById("sendbut").disabled=false;
}   
    
</script>


<script>
//评论下的发布!
	$(document).on('click','.btn_comment',function (){
		 var wid=$(this).attr("name").trim();
		    var content = $("#comments_"+ wid)[0].innerHTML
		    content=content.replace(/\t/g,"");
		    content=content.replace(/\r/g,"");
		    content=content.replace(/\n/g,"");
		    
		    var s=document.getElementById("myEmojiComment_"+wid);
			var ss=s.style.display;//="block";
			if(ss=="block"){
				s.style.display="none";
		
			}
		    
		    //alert(content);
			$.ajax({
				url : "/cool/addcomment.do",
				type : "POST",
				data : {
					"content" : content,
					"wid":wid
				},
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
		
				success : function(data, state) {
					alert(data.data);
					if(data.data=="发布成功!"){
				    var data=$(".myComment_"+wid)[0].innerHTML;
					$(".myComment_"+wid)[0].innerHTML=data.substring(0,data.indexOf('<img t=\"avater\" src=\"'));
					showComment(wid,"1");
					}
					//window.location.reload()
				}
			})
			
	});
	</script>



	<script>
//赞 被点击! 
	$(document).on('click','.like',function (){
		var id=$(this).attr("id").trim();
		var f="counts_"+id;
		var a = document.getElementById(f);
		a.innerText=parseInt(a.innerText)+1;
		//alert("??");
		$.ajax({
			url : "/cool/addlike.do",
			type : "POST",
			data : {
				"id" : id,
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",

			success : function(data, state) {
				
			}
		})	
		
	});
	
	function js_zan(){
		var id=$(this).attr("id").trim();
		var f="counts_"+id;
		var a = document.getElementById(f);
		a.innerText=parseInt(a.innerText)+1;
		//alert("??");
		$.ajax({
			url : "/cool/addlike.do",
			type : "POST",
			data : {
				"id" : id,
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",

			success : function(data, state) {
				
			}
		})	
		
	}
	</script>
	
	

<script>

var openPhotoSwipe = function(arr) {
    var pswpElement = document.querySelectorAll('.pswp')[0];

    // build items array
    var items = [
        {
            src: arr,
            w: 1024,
            h: 1024
        }
    ];
    
    // define options (if needed)
    var options = {
             // history & focus options are disabled on CodePen        
        history: false,
        focus: false,

        showAnimationDuration: 0,
        hideAnimationDuration: 0
        
    };
    
    var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
    gallery.init();
};

function js_zoom(){
	var s=document.getElementById("pic");
	openPhotoSwipe($(s)[0].src);
}

//微博图片被点击了
$(document).on('click','.mypic',function (){
	//alert(this);
	var id=$(this).attr("id").trim();
	openPhotoSwipe($(this)[0].src);
	
});


</script>	
	
	
	
	
	
	
</body>
</html>