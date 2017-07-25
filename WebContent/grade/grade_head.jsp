<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common_service.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"name="viewport" content="width=device-width, initial-scale=1.0">
<title>성적관리</title>
<style type="text/css">
	@IMPORT url("<%= headRoot(request)%>/css/grade.css");
</style>
</head>
<body>
<div id="wrapper">
	<header>
		<h1 id="title">성적관리</h1>
		<a id="go_main" href="<%= headRoot(request)%>/index.jsp">메인으로 가기</a><br />
	</header>
	<hr />