<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="member_service.jsp" %>
<%
	Class.forName(ORACLE_DRIVER);
	String id = request.getParameter("id");
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("delete from member where id=?");
	pstmt.setString(1, id);
	int rs = pstmt.executeUpdate();
	
	if(rs==1){
%>
	<script>
		alert('삭제 완료');
		location.href="<%=root(request)%>/member/member_list.jsp?action=list";
	</script>
<%		
	}else{
%>
	<script>
		alert('삭제 실패');
		location.href="<%=root(request)%>/member/member_list.jspaction=list";
	</script>
<%
	}
%>