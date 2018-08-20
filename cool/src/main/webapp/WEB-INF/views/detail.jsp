<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.sucre.entity.GenerationEntity"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>详细信息</title>
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/twitter.css">
    <link rel="stylesheet" href="photoswipe.css">
    	<script src="jquery-3.3.1.min.js"></script>

	<script src="jquery.backstretch.min.js"></script>
	<script src="jquery.backstretch.js"></script>

	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- Core JS file -->
	<script src="photoswipe.min.js"></script> 
	<script src="photoswipe-ui-default.min.js"></script> 
	
</head>
<body>

<br>
<br>
 <script >$.backstretch("img/test.jpg");</script>
<div class="container">
<div class="row">

<% 
HttpSession s=request.getSession();
GenerationEntity gen= (GenerationEntity) s.getAttribute("currentPerson");
if( gen.getAvater()!=null &&!"".equals(gen.getAvater())){
	
	out.println(" <img  id=\"pic\" class=\"thumbnail\" href=\"javascript:void(0);\" onclick=\"js_zoom()\" src=\"/weiboimg/" + gen.getAvater() + "\" style=\"width:30%;height:10%\">");
}

%>

<table style="border: 1px #ccc solid; margin-left: 1px; width: 100%; height: 30%; padding: 98px;">
<tr><td><b>第${sessionScope.currentPerson.generation} 世 </td></tr>
<tr><td>姓名:${sessionScope.currentPerson.nickname} </td></tr>
<tr><td>配偶姓名:${sessionScope.currentPerson.wife} </td></tr>
<tr><td>性别:${sessionScope.currentPerson.gender=='1'?'男':'女'} </td></tr>
<tr><td>出生日期:${sessionScope.currentPerson.birthday}</td></tr>
<tr><td><b>详细信息:</td></tr>
<tr><td>${sessionScope.currentPerson.details} </td></tr>
</table>
  <button class="btn btn-warning" type="button" onclick="closeme()">关闭</button>
</div>
</div>

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

function closeme(){
	
	window.parent.window.doneCheckInfo();
}
</script>

</body>
</html>