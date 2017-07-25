<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../constants/db.jsp" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<% 
	Class.forName(ORACLE_DRIVER);
	String name = request.getParameter("name");
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member where name=?");
	pstmt.setString(1, name);
	
	ResultSet rs = pstmt.executeQuery();
%>

	<div id="container">
		<table id="memlist-tab">
			<tr>
				<th>No</th>
				<th>ID</th>
				<th>SSN</th>
				<th>Name</th>
				<th>Phone</th>
				<th>E-Mail</th>
				<th>Major</th>
				<th>Subject</th>
				<th>RegDate</th>
			</tr>
		<%
		while(rs.next()){
			
		%>
			<tr>
				<td>1</td>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("ssn")%></td>
				<td><%=rs.getString("name")%></td>
				<td>010-1234-5678</td>
				<td>hong@gmail.com</td>
				<td>컴퓨터공학</td>
				<td>자바</td>
				<td>2017-07-20</td>
			</tr>
		<% } %>
		</table>
	</div>
<%@ include file="../common/footer.jsp" %>