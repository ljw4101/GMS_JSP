<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.gms.web.util.Clock"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common_service.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"name="viewport" content="width=device-width, initial-scale=1.0">
<title>board delete</title>
<link rel="stylesheet" href="<%=headRoot(request) %>/css/board.css" />
</head>
<body>
<div id="wrapper">
	<header>
		<h1 id="title">게시판 관리</h1>
		<div id="now_time">시간: <%= new Clock().getnow() %></div> <br /> 
		<a id="go_main" href="<%=headRoot(request)%>/index.jsp">메인으로 가기</a><br />
	</header>
	<hr />