<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="member/member_head.jsp" %>
	<div id=loginImg>
		<img src="<%=headRoot(request) %>/img/login.gif" alt="" />
	</div>
	<form id="login" action="<%=headRoot(request) %>/common/main.jsp" method="get">
		<span>ID: </span><input type="text"  name="id"/><br /><mark>ID는 숫자포함 8자이내</mark><br />
		<label for="">Password: </label><input type="password" name="pw"/><br />
		
		<input type="submit" value="LOGIN" />
		<input type="reset" value="CANCEL"/>
	</form>
<%@ include file="../common/footer.jsp" %>