<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
	<div id=loginImg>
		<img src="<%=root(request) %>/img/login.gif" alt="" />
	</div>
	<div id=login>
		<span>ID: </span><input type="text"  /><br /><mark>ID는 숫자포함 8자이내</mark><br />
		
		<label for="">Password: </label><input type="password" /><br />
		
		<button class="gms-background-blue" onclick="window.location.href='member_detail.jsp'">실행</button>
		<button class="gms-background-red" onclick="window.location.href='<%=root(request) %>/index.jsp'">취소</button>
	</div>
<%@ include file="../common/footer.jsp" %>