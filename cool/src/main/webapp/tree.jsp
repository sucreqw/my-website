<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,mazimun-scale=1.0,minimum-scale=1.0">
<title>family tree</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="js/styles.css">
<script src="jquery-3.3.1.min.js"></script>
<script src="Util.js"></script>


<style type="text/css">
.talkbubble {
	
	width: 120px;
	height: 60px;
	border: 2px solid #111;
	position: absolute;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}
.focusbubble {
	
	width: 121px;
	height: 61px;
	border: 3px solid #111;
	position: absolute;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}
.dline {
	background: #444444;
	position: absolute;
	font-size: 1px;
	line-height: 1%;
}
</style>

</head>


<body>
<script>
var last=0;
var isload=false;
var search=false;
var listcount=0;
var listindex=0;
var list;
</script>
	<div class="container">
		<div class="row">
			
		</div>
	</div>

   <div class="focusbubble" style="margin-left: 0px; margin-top: 0px; display: none;" id="focusbubble" ></div>
	</DIV>
	<script>
		// margin-top:-8px;
		// margin-left:-8px;
		//margin-right:-8px; 
		// <div class="talkbubble" style='margin-left:98px;'>name: <br> wife:</div>
		// <div class="dline" style="width: 202px; height: 2px; margin-left:18px; margin-top:58px;" ></div>
		// <div class="dline" style="width: 2px; height: 202px; margin-left:148px; margin-top:0px;" ></div>
		//<div class="talkbubble" style='margin-left:18px; margin-top:98px;'>name: <br> wife:</div>
		//<div class="talkbubble" style='margin-left:198px; margin-top: -58px;'>name: <br> wife:</div>
		$(function() {
			getdata('1');
		});

		function addtext(text) {

			$(".row").append(text);

		}
		function box(left, top, text,id,son,farther) {

			return '<div class="talkbubble" style="margin-left:'
					+ left
					+ 'px; margin-top:'
					+ top
					+ 'px;" href=\"javascript:void(0);\" onclick=\"js_click()\" id="'+ id +'" father="'+ farther +'" son="'+ son +'" >'
					+ text + '</div>';

		}
		function drowLine(width,height,left,top){
			return '<div class="dline" style="width: '+ width +'px; height: '+ height +'px; margin-left:'+ left +'px; margin-top:'+ top +'px;" ></div>';
			}
		//把儿子的id放到父亲的div里,以及list的id也放进去
        function pushId(id,father){
        	var s=document.getElementById(father);
        	$(s).attr("son",id);
        	//alert($(s).attr("son"));
        }
		function getdata(id) {

			$.ajax({
						url : "/cool/getgen.do",
						type : "POST",
						data : {
							"id" : id,
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",

						success : function(data, state) {
				//"GenerationEntity [id=1, nickname=陈国延, wife=马氏|何氏, gender=1, father=0, sons=2, details=陈氏始祖陈国延，和马氏合葬在浸潭铁炉坑，何氏葬在浸潭马级岗。, generation=1, fatherName=null, sonsName=陈兴, wifeName=null]"
							var str = data.data;
							if(str!=""){
								var id = midWord("id=", ",", str);
								var nickname = midWord("nickname=", ",", str);
								var wife = midWord("wife=", ",", str);
								var gender = midWord("gender=", ",", str);
								var father = midWord("father=", ",", str);
								var sons = midWord("sons=", ",", str);
								var details = midWord("details=", ",", str);
								var generation = midWord("generation=", ",", str);
								var fatherName = trimName(midWord("fatherName=", ",", str));
								var sonsName = trimName(midWord("sonsName=", ",", str));
								var wifeName = trimName(midWord("wifeName=", ",", str));
								var sonswife=trimName(midWord("sonsWife=", ",", str));
								var g;
								
	                           // alert(str);
								var mid =getStartPoint();
	                            if(id=='1' && isload==false){//第一代.
	                            	(gender=='1')?g='妻':g='丈夫';
								addtext(box(mid, getTop(generation), "&nbsp;第" + generation + "世<br>&nbsp;姓名:"
										+ nickname + "<br>&nbsp;配偶姓名:" + wife,id,sons,""));
	                            
	                            isload=true;
	                            }
								if(sonsName.indexOf("|")!=-1){
									
									var arr=new Array();
									arr=sonsName.split("|");
									var sonswifeArr=new Array();
									sonswifeArr=sonswife.split("|");
									var sonsId=new Array();
									sonsId=sons.split("|");
									
									var left=getPosition(id);
									var length=arr.length+1;
									var newleft=left-((length*135)/2);
									//alert(newleft);
									
									addtext(drowLine(2,12.5,getPosition(id)+60,getTop(parseInt(generation)+1)-25));
									addtext(drowLine(((length*135)-270),2,newleft+135+60,getTop(parseInt(generation)+1)-12.5));
									for(i=0; i< arr.length;i++){
										
										pushId(sonsId[i],id);
										(gender=='1')?g='妻':g='丈夫';
										
										addtext(box(newleft+((i+1)*135), getTop(parseInt(generation)+1), "&nbsp;第" + (parseInt(generation)+1) + "世<br>&nbsp;姓名:"
												+ arr[i] + "<br>&nbsp;配偶姓名:" + sonswifeArr[i],sonsId[i],"",id));
										addtext(drowLine(2,12.5,newleft+((i+1)*135)+60,getTop(parseInt(generation)+1)-12.5));
									}
									
								}else if(sonsName!=""){//只有一个儿子
									
									pushId(sons,id);
									
									addtext(box(getPosition(id), getTop(parseInt(generation)+1), "&nbsp;第" + (parseInt(generation)+1) + "世<br>&nbsp;姓名:"
											+ sonsName + "<br>配偶姓名:" + sonswife,sons,"",id));
									addtext(drowLine(2,25,getPosition(id)+60,getTop(parseInt(generation)+1)-25));
								}
								if(listcount!=0 && listindex <listcount ){listindex++; getdata(list[listindex]);}
								window.scrollTo(getPosition(id)-(document.body.clientWidth / 2),(document.body.scrollHeight)+80);
							}
						}
					})

		}
		//窗体滚到最底
		function rolls(id){
			
			window.scrollTo(getPosition(id)-(document.body.clientWidth / 2),(document.body.scrollHeight)+80);
		}
		//加载搜索结果
		function getdataAll(arr){
			list=arr;
			listcount=arr.length;
			listindex=1;
			getdata(list[listindex]);
		}
		
		
		//清空所有数据
		function clearAll(){
			$(".row").html('');
			isload=false;
			listcount=0;
			listindex=0;
			loseFocus();
		}
		//恢复sonid为0
		function clearSonId(father,data){
			var start=0;
			var end=0;
			var tem,temp;
			while(start!=-1){
				start=data.indexOf("father=\""+ father+"\"",start);
				if(start!=-1){
					start=data.indexOf("son=\"",start);
					if(start!=-1){
						end=data.indexOf("\">",start+5);
						tem=data.substring(0,start+5);
						temp=data.substring(end);
						data=tem+temp;
						
					}
					
					
				}
				
				
			}
			return data;
		}
		//清除自己
		function clearMe(id){
			var data=$(".row").html();
			var tem,temp;
			var start=data.lastIndexOf("js_click()\" id=\""+id+"\"");
			
			if(start!=-1){
				start=data.lastIndexOf("<div class=\"talkbubble",start);
				if(start!=-1){
					var end=data.indexOf("</div>",start);
					tem=data.substring(0,start);
					temp=data.substring(end+6);
					data=tem+temp;
					$(".row").html(data);
				}
				
			}
		}
		//清除连线
		function clearLine(data){
			var tem,temp;
			var start=data.lastIndexOf("<div class=\"dline");
			var test=data.lastIndexOf("<div class=\"talkbubble");
			
			if (test>start){return data;}
			if((start-test)<216){return data;}
			if(start!=-1){
				data=data.substring(0,start);
				
			     start=data.lastIndexOf("<div class=\"dline\" style=\"width: 2px;");	
			    if(start!=-1){
			    	var end=data.indexOf("</div>",start);
			    	tem=data.substring(0,start);
			    	temp=data.substring(end);
			    	data=tem+temp;
			    }	 
			}
			return data;
		}
		//清除子级元素
		function clearSon(father){
			var data=$(".row").html();
		    var start=data.lastIndexOf("father=\""+ father +"\"")
		  // alert(data.length);
		   if(start!=-1){
			  var start=data.indexOf("<div class=\"talkbubble",start); 
			   if(start!=-1){
				   data=data.substring(0,start);
				  // alert(data.length);
				 
				  data=clearSonId(father,data);
				  //alert(data);
				  data=clearLine(data);
				  //alert(data);
				  $(".row").html(data);
				}
		   }
		   
		}
 //元素被點擊了.
		$(document).on('click', '.talkbubble', function() {
			var id = $(this).attr("id").trim();
			var fatherId=$(this).attr("father").trim();
			var sonId=$(this).attr("son").trim();
			
			
			//加粗框
			getFocus($(this).offset().left,$(this).offset().top);
			if(id!='1'){
			if(fatherId =="" || sonId ==""){
				clearSon(fatherId);
				//alert(fartherId+'<=>'+sonId);
				//取此人更多信息
				getdata(id);
			
			}
			
			}
			
			
			window.parent.window.setName(this);
			//window.frames["iframe_ID"].window.childMethod();
		});
		//加粗框
        function getFocus(left,top){
        	var s=document.getElementById("focusbubble");
			var ss=s.style.display;
			s.style.display="block";
			s.style.left=left-1;
			s.style.top=top-2;
        }
		function loseFocus(){
			var s=document.getElementById("focusbubble");
			var ss=s.style.display;
			s.style.display="nonce";
		}
		function js_click() {
		}
		
		function trimName(str){
			if(str=="null"){
				str="";
				}
			return str;
		}
		
		function getPosition(fatherid){
			var s=document.getElementById(fatherid);
			return $(s).offset().left;
			}
		function getTop(top){
			var ret=(parseInt(top)*18)+(parseInt(top)*70);
		    return ret;
			}
		
	
		function getStartPoint(){
			//18412;// (document.body.clientWidth / 2)-60;

		     if (navigator.userAgent.match(/iPad|iPhone/i)){
		    	 
		    	return (document.body.clientWidth )*2;// (document.body.clientWidth / 2)-60;  
		     }else{
		    	 
		    	 return 18412;
		     }
			
		}
		
	</script>
</body>
</html>