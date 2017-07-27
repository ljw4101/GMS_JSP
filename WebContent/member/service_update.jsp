<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="member_service.jsp" %>
<% 
	Class.forName(ORACLE_DRIVER);
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String major_id = request.getParameter("major_id");
	
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("update member set name=?, phone=?, email=?, major_id=? where id=?");
	pstmt.setString(1, name);
	pstmt.setString(2, phone);
	pstmt.setString(3, email);
	pstmt.setString(4, major_id);
	pstmt.setString(5, id);
	
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