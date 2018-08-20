//取字符串
function midWord(s, e, strs) {

	var start = strs.indexOf(s);
	var end = strs.indexOf(e, start + s.length);
	return strs.substring(start + s.length, end);

}
//处理文字中的表情

function makeface(strs){
	var ret;
	var str=strs;
	
if(str.indexOf('[')==-1 || !str.indexOf(']')==-1){return strs;}
try{
	while((ret=str.match(/\[([\u4e00-\u9fa5]*\w*)\]/)[1])!=null){
	str=str.replace('['+ ret + ']','<img src=\"' + 'face/' + ret+'.png' + '\" style=\"width:20px;height:20px\">');
		}
}catch(err){
	
	
}finally{
	
	return str;	
}

return str;
}
//休眠
function sleep(numberMillis) { 
	var now = new Date(); 
	var exitTime = now.getTime() + numberMillis; 
	while (true) { 
	now = new Date(); 
	if (now.getTime() > exitTime) 
	return; 
	} 
}