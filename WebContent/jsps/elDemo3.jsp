<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>EL表达式技术演示3: 使用它内部的11个隐藏对象:</title>
	</head>
	<body>
		<h1>EL表达式技术演示3: 使用它内部的11个隐藏对象:</h1>
		11个隐藏对象：<br>
		&emsp;&emsp;1个便于操作其它'jsp的隐藏对象'的对象：pageContext   <br>
		&emsp;&emsp;4个相关容器：pageScope、requestScope、sessionScope、applicationScope   <br>
		&emsp;&emsp;6个其它：param 、paramValues 、header 、headerValues 、cookie 、 initParam   <br>
		<hr>
		pageContext:<br>
		&emsp;&emsp;项目路径：${pageContext.request.contextPath } <br>
		&emsp;&emsp;session的id: ${pageContext.session.id } <br>
		<br>
		4个相关容器：<br>
		<%
			pageContext.setAttribute("name", "Jack_P");
			//request.setAttribute("name", "Jack_R");
			session.setAttribute("name", "Jack_S");
			application.setAttribute("name", "Jack_A");
		%>
		${pageScope.name } ## ${requestScope.name } ## ${sessionScope.name } ## ${applicationScope.name }
		<br>
		<br>
		2个请求参数：param 和 paramValues <br>
		区别：param是单值 ，paramValues是多值 <br>
		<!-- http://127.0.0.1:8080/EL_Demo/jsps/elDemo3.jsp?name=jack&hobby=movie&hobby=game -->
		${param} ## ${param.hobby} <br>
		${paramValues} ## ${paramValues.hobby[1]}
		<br>
		<br>
		2个请求头：header 和 headerValues <br>
		${header} <br>
		${headerValues} <br>
		${header.cookie} <br>
		<br>
		1个 cookie <br>
		${cookie.JSESSIONID.value }<br>
		
		header.cookie与cookie区别：<br>
		&emsp;&emsp;header.cookie返回的是字符串，而cookie是一个容器。所以cookie可以精确都某个cookie的值，而header.cookie返回的是所有cookie的字符串
		<br>
		1个 initParam <br>
		注意：要获取到initParam需要在web.xml中配置！！！而且获取的是application容器的初始化参数<br>
		${initParam }
		<div style=" height: 400px">
		</div>
	</body>
</html>