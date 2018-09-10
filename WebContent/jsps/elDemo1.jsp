<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="cn.hncu.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>EL表达式技术演示1: 读取属性值</title>
	</head>
	<body>
		<h1>EL表达式技术演示1: 读取属性值</h1>
		基本语法: ${varName} <br>
    	作用:依次从page、request、session、application四个容器中
                   读取varName属性，若小容器存在则输出，忽略后面的大容器。
                   若4个容器中都不存在该varName指定的属性，则输出空字符串:""<br>
                   其它语法1:${sessionScope.varName},从指定的容器中读取。<br>
		其它语法2:${2*200+80},可以执行算术、逻辑运算<br>
        <hr>
        <!-- 1读取容器中的属性变量。PS:以后开发时都是在后台servlet把属性存入容器，这里为方便演示直接用java脚本代替 -->   
		<%
			pageContext.setAttribute("nameP", "Jack_P");
			request.setAttribute("nameR", "Jack_R");
			session.setAttribute("nameS", "Jack_S");
			application.setAttribute("nameA", "Jack_A");
		%>
		获取响应容器中的值：${nameP} ## ${nameR} ## ${nameS} ## ${nameA} <br>
		${abc},不存在时输出空字符串""<br>
		<hr>
		<!-- 2读取javaBean中的信息-->
		<%
			User user = new User();
			user.setName("Tom");
			user.setPwd("1234");
			user.setAge(23);
			//注意，必须把对象放到容器中EL表达式才能获取到
			pageContext.setAttribute("u", user);
		%>
		注意：EL读取数据时，是根据属性名去取的，而非变量名。<br>
		${user}-->WA ## ${u}-->AC &emsp;##&emsp; ${u.name} , ${u.age}<br>
		<hr>
		<!-- 3读取Map中的信息-->
		<%
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("name", "Alice");
			map.put("age", 18);
			map.put("user", user);
			//再次强调，必须把对象 map 放到容器中,EL表达式才能获取到
			//这次放的reqsuest容器中
			request.setAttribute("map", map);
		%>
		${map.name} ## ${map.age} ## ${map.user.pwd}<br>
		也可以这样,但是少用,注意：[]中必须要用 " 或者 ' 把属性名引起来：${map['name']} ## ${map["age"]} ## ${map["user"]["pwd"]}
		<hr>
		<!-- 4读取List中的信息-->
		<%
			List<Object> list = new ArrayList<Object>();
			list.add("周末");
			list.add(20);
			list.add(user);
			list.add(map);
			session.setAttribute("list", list);
		%>
		${list}<br>
		注意:[]中是表示序号，不是属性名，所以不需要用 引号 引起来***  ${list[0]} ## ${list[1]} ## ${list[2].name} ## ${list[3].user.pwd}
	</body>
</html>