<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.io.File"%>
<%@ page import="com.sucre.component.CookieHandler"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我和无人机</title>
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
<meta name="referrer" content="never">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/style.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/twitter.css">
<link rel="stylesheet" href="photoswipe.css"> 
<link rel="stylesheet" href="default-skin.css"> 
</head>
<body>
<!-- Core JS file -->
<script src="photoswipe.min.js"></script> 

<!-- UI JS file -->
<script src="photoswipe-ui-default.min.js"></script> 

	<script src="jquery-3.3.1.min.js"></script>

	<script src="jquery.backstretch.min.js"></script>
	<script src="jquery.backstretch.js"></script>

	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="Util.js"></script>
	<script src="index.js"></script>
    <script>
    var page='1';
  
    </script>
    <%
		CookieHandler.setUser(request);
	%>
	<!--  <script > $.backstretch("img/photo-top.jpg");</script>-->

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
						<li><a href="twitter.jsp"><strong>吹水区</strong></a></li>
						<li class="active"><a href="mydrone.jsp"><strong>我和无人机</strong></a></li>
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
			<div class="myrow">
			 
			</div>
			
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
                   
					$.ajax({
								url : "/cool/getdrone.do",
								type : "POST",
								data : {
									"page" : page,
								},
								contentType : "application/x-www-form-urlencoded; charset=utf-8",

								success : function(data, state) {
									
									var strs = new Array(); //定义一数组 
									var strs = data.data.split("DroneEntity");
                                   //type=1, urls=https://cn-videos.dji.net/video_trans/ff97a179945c4b398ddc92a1b63205a1/1080.mp4, likecount=0, content=飞来湖半景,第一次拍,明显不稳.]
									for (i = 1; i < strs.length; i++) {
										var id=midWord("id=",",",strs[i]);
                                        var type=midWord("type=",",",strs[i]);
                                        var urls=midWord("urls=",",",strs[i]);
                                        var likecount=midWord("likecount=",",",strs[i]);
                                        var content=midWord("content=","]",strs[i]);
                                       
                                        var data="";
                                        data=data+("<div class=\"col-sm-12\">\r\n");
                                        data=data+("				<section>\r\n");
                                        data=data+("				<br><br><span><strong>"+ content +"</strong></span><br><br>\r\n");
                                      
                                        if(type=="1"){data=data+("					<video src=\""+ urls +"\" style=\"width: 100%; height: 100%; object-fit: fill\" controls=\"controls\"></video>\r\n")}else if(type=="0"){
                                        	
                                        	var pics = new Array(); //定义一数组 
        									var pics = urls.split("\|");
                                        	data=data+"<div class=\"col-md-12 col-sm-12 col-xs-12\">";
        									 for (j = 0; j < pics.length; j++) {
        										
        									data=data+"<div class=\"col-md-3 col-sm-6 col-xs-6 \"> <div class=\"thumbnail\"  ><img src=\"/weiboimg/"+ pics[j].trim() +"\" style=\"width: 100%; height: 100%; \" ></div></div>";	
        									} 
        									 data=data+"</div>";
        								}else if(type=="2"){
        									  // alert(urls);
        										data=data+"<iframe name=\"main\" id=\"main\" style=\"width: 100%; height: 100%; object-fit: fill\" ></iframe> <a href=\""+ urls +".jsp\" target=\"main\">打开全景图</a><em>---</em><a href=\""+ urls+".jsp\" >全屏打开</a>";
        										
        									 
                                        	
                                        };
                                        
                                        data=data+("				</section>\r\n");
                                       // data=data+("			</div>\r\n");
                                        //data=data+("           </div>\r\n");
                                        data=data+("          <a class=\"comment\" id=\"" + id + "\" href=\"javascript:void(0);\" onclick=\"js_method()\" > <span><em class=\"W_face\"></em><em>评论</em></span></a>\r\n");
                                        data=data+("		  <a class=\"like\" title=\"表情\" id=\""+id +"\" href=\"javascript:void(0);\" onclick=\"js_zan()\" ><em class=\"W_face\">ñ</em><em id=\"counts_"+ id +"\">"+ likecount +"</em></a> \r\n");
                                        data=data+("			<br>\r\n");
                                        data=data+("		<div class=\"panel panel-default_"+ id +"\" style=\"display: none;\">\r\n");
                                        data=data+("			   <div class=\"panel-body\">\r\n");
                                        data=data+("				\r\n");
                                        data=data+("\r\n");
                                        data=data+("				<div class=\"col-sm-12 col-xs-12 my_edit\">\r\n");
                                        data=data+("					<div class=\"row\" id=\"edit_form\">\r\n");
                                        data=data+("						<div class=\"myComment_"+ id + "\" style=\"display: none;\">\r\n");
                                        data=data+("							<div contentEditable=\"true\" id=\"comments_"+ id +"\" class=\"form-control form_"+ id +"\">\r\n");
                                        data=data+("							</div>\r\n");
                                        data=data+("							<a class=\"emojiComment\" id=\""+ id +"\" title=\"表情\" href=\"javascript:void(0);\" onclick=\"js_face()\"  ><em class=\"W_face\">o</em>表情</a>\r\n");
                                        data=data+("							<button class=\"btn btn-success btn_comment\" type=\"button\" id=\"sendcomment_" + id +"\" name=\""+ id +"\">发布</button>\r\n");
                                        data=data+("							\r\n");
                                        data=data+("							<br>\r\n");
                                        data=data+("							<div class=\"col-sm-12\"><br></div>\r\n");
                                        data=data+("							<div class=\"col-sm-12\">\r\n");
                                        //=================================                                        
				        	             data=data+("						<div class=\"myEmojiComment\" id=\"myEmojiComment_"+ id +"\"style=\"display: none;\" href=\"javascript:void(0);\" onclick=\"js_emo()\">");
										 data=data+("							<ul id=\"myTab\" class=\"nav nav-tabs\">\r\n");
										 data=data+("								<li class=\"active\"><a href=\"#\" data-toggle=\"tab\">表情");
										 data=data+("								</a></li>");
										 data=data+("							</ul>");
										 data=data+("							<div id=\"myTabContent\" class=\"tab-content\">\r\n");
										 data=data+("								<div class=\"tab-pane fade in active\" id=\"set\">\r\n");
										 data=data+("									<div class=\"emoji_"+ id +"\">");
									    <%
											 String dir = pageContext.getServletContext().getRealPath("/face");
											 File f = new File(dir);
											 File[] fs = f.listFiles();
											for (File file : fs) {
												out.println("data=data+(\"<img src=\\\"face/" + file.getName() + "\\\" style=\\\"width:25px;height:25px\\\" id=\\\"\" + id +\"\\\">\");");
											}
										%>
										
                                        data=data+("						                \r\n");
                                        data=data+("						 \r\n");
                                        data=data+("						    </div>\r\n");
                                        data=data+("                     </div>\r\n");
                                        data=data+("				</div>\r\n");
                                        data=data+("			</div>\r\n");
                                        data=data+("		</div>\r\n");
                                      
                                        data=data+("							</div>\r\n");
                                        data=data+("							</div>\r\n");
                                        data=data+("			 <button class=\"btn btn-block\" id=\""+ id +"\" name=\"2\" type=\"button\">加载更多</button>");
									     $(".myrow").append(data);
									}

								}
							})
					page++;
				}
				;

			});
		</script>
			
<script >
    
    function showComment(id,pages){
    	
       
		
		
		$.ajax({
			url : "/cool/getdronecomment.do",
			type : "POST",
			data : {
				"page" : pages,
				"mid" : id,
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",

			success : function(data, state) {
				//[id=3, mid=2, avater=super.jpg, nickname=SuperUser, content=2352345, postday=2018-8-9 20:35:00]
				
				var strs = new Array(); //定义一数组 
				var strs = data.data.split("DroneCommentEntity");
				for (i = 1; i < strs.length; i++) 
				{
					 var cid=midWord("id=",",",strs[i]);
					 var postday=midWord("postday=","]",strs[i]);
		             var nickname=midWord("nickname=",",",strs[i]);
		             var avater=midWord("avater=",",",strs[i]);
		             var content=midWord("content=",",",strs[i]);
		             var wid=midWord("mid=",",",strs[i]);
		            
		             content=makeface(content);
		             
		             var data="";
					    data=data+("						 <img t=\"avater\" src=\""+ avater +"\" class=\"col-md-1 col-sm-1 col-xs-3\" style=\"border-radius: 50%\">\r\n");
						data=data+("						 <div class=\"col-md-11 col-sm-11 col-xs-9\">\r\n");
						data=data+("				        	            <span style=\"font-weight: bold;\" >"+ nickname +" :</span> <span>    "+ content +"</span> <br> <small class=\"date\" style=\"color: #999\">"+ postday +"</small>\r\n");
		               data=data+("<span> <br><br></span>")
		             
					
				    $(".myComment_"+id).append(data);
		               
		         }
				return pages;
			}
			})
			
	  return pages;
    	
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
//赞 被点击! 
	$(document).on('click','.like',function (){
		var id=$(this).attr("id").trim();
		var f="counts_"+id;
		var a = document.getElementById(f);
		a.innerText=parseInt(a.innerText)+1;
		//alert("??");
		$.ajax({
			url : "/cool/adddronelike.do",
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
			url : "/cool/adddronelike.do",
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
//评论下的发布!
	$(document).on('click','.btn_comment',function (){
		 var mid=$(this).attr("name").trim();
		    var content = $("#comments_"+ mid)[0].innerHTML
		    
		    content=content.replace(/\t/g,"");
		    content=content.replace(/\r/g,"");
		    content=content.replace(/\n/g,"");
		    
		    var s=document.getElementById("myEmojiComment_"+ mid);
			var ss=s.style.display;//="block";
			//alert(ss);
			if(ss=="block"){
				s.style.display="none";
		
			} 
		    
		    $.ajax({
				url : "/cool/adddronecomment.do",
				type : "POST",
				data : {
					"content" : content,
					"mid":mid
				},
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
		
				success : function(data, state) {
					alert(data.data);
					if(data.data=="发布成功!"){
				    var data=$(".myComment_"+mid)[0].innerHTML;
					$(".myComment_"+mid)[0].innerHTML=data.substring(0,data.indexOf('<img t=\"avater\" src=\"'));
					showComment(mid,"1");
					}
					//window.location.reload()
				}
			})
			
	});
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
    //加载更多按钮!
  //btn-block
$(document).on('click','.btn-block',function (){
		var id=$(this).attr("id").trim();
		var page=$(this).attr("name").trim();
		var p=showComment(id,page);	
		var np=parseInt(page)+1;
		$(this).attr("name", np);
		
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


//thumbnail 图片被点击放大
$(document).on('click','.thumbnail img',function (){
	    //alert($(this)[0].src);
		openPhotoSwipe($(this)[0].src);
		
	});
</script>

</body>
</html>