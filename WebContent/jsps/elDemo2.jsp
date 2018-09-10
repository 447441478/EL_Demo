<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL表达式技术演示2: 执行运算</title>
</head>
<body>
	<h1>EL表达式技术演示2: 执行运算</h1>
	1.算术运算：+ 、- 、* 、/ 、 % 等<br>
	<% 
		pageContext.setAttribute("num", 10);
	%>
	num/2+20=${num/2+20}<br>
	2.条件运算： == 、 != 、 > 、 < 、>= 、<= 和逻辑运算 && 、 ||    <br>
	<% 
		pageContext.setAttribute("num", 10);
		pageContext.setAttribute("name", "Tom");
	%>
	
	num == 10 :${num == 10} ## name != "Tom": ${name != "Tom"} ## age < 20 && name=="Tom": ${ num < 20 && name == "Tom"}
	<br>
	3.问号表达式。<br>
	<% 
		pageContext.setAttribute("age", 18);
	%>
	age < 20 ? "young" : "old" --> ${ age < 20 ? "young" : "old" }
	<br>
	4.empty 运算符，判断一个属性是否为空.<br>
	${empty addr } ## ${empty age } ## ${!empty pwd}
	
</body>
</html>