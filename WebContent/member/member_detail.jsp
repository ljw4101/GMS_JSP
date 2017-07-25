<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../constants/db.jsp" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<% 	
	
	Class.forName(ORACLE_DRIVER);
	String id = request.getParameter("id");
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member where id=?");
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
%>	
	<div id="container">
		<h2>Hello </h2>
		<table id="memdetail-tab">
			<tr>
				<th>ID</th>
				<td><%=rs.getString("id") %></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><%=rs.getString("pw") %></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><%=rs.getString("name") %></td>
			</tr>
			<tr>
				<th>BirthDay</th>
				<td><%=rs.getString("ssn") %></td>
			</tr>
			<tr>
				<th>Gender</th>
				<td></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td></td>
			</tr>
			<tr>
				<th>Major</th>
				<td></td>
			</tr>
			<tr>
				<th>Subject</th>
				<td></td>
			</tr>
		</table>
	</div>
<% 	
	}
	
	//String pw = request.getParameter("pw");
	//String name = request.getParameter("name");
	//String birth = request.getParameter("birth").substring(0, 4);
	//int age = 2017-Integer.parseInt(birth);
	//String gender = (request.getParameter("gender").equals("male"))?"남":"여";
	//String email = request.getParameter("email");
	//String major = request.getParameter("major");
%>


	
	
<%@ include file="../common/footer.jsp" %>