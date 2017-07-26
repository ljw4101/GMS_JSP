<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../constants/db.jsp" %>
<%@ include file="member_service.jsp" %>
<% 
	Class.forName(ORACLE_DRIVER);
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("update member set name=? where id=?");
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	
	int rs = pstmt.executeUpdate();
	if(rs==1){
%>	
	<script>
		alert('수정 완료');
		location.href="<%=root(request)%>/member/member_detail.jsp?id=<%=id%>";
	</script>
<%
	}else{
%>
	<script>
		alert('수정 실패');
		location.href="<%=root(request)%>/common/main.jsp";
	</script>
<%	
	}	
%>