<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For SuperUser Only</title>
</head>
<body>
<br>
<br>
<br>
 <div>
 <p> ${message}  </p>
 </div>
   <div>
    <form action="/cool/login.do" method="post">
  
     <p>
     <label>账号名称:<input name="account" type="text"></label>
     </p> 
      
     <p>
     <label>账号密码:<input name="password" type="password"><input name="page" value="1" type="hidden"/></label>
     </p> 
    
     <p>
      <button  type="submit" id="gologin" name="gologin">提交</button>
     </p> 
    
    </form>
   
    </div>
   
</body>
</html>