<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../constants/db.jsp" %>
<%@ page import="java.sql.*"%>
<% 	
	Class.forName(ORACLE_DRIVER); 
	//new를 사용하지 않고 동적으로 로딩하면 DriverManager를 사용가능하다.	894p
	Connection conn = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD);
	Statement stmt = conn.createStatement();
	String sql="SELECT * FROM member WHERE id='kang'";
	ResultSet rs = stmt.executeQuery(sql);
	
	String findName="";
	if(rs.next()){
		findName = rs.getString("name");
	}
%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<h1>Hello <%=findName %></h1>
</body>
</html> 