<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<% 	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth").substring(0, 4);
	int age = 2017-Integer.parseInt(birth);
	String gender = (request.getParameter("gender").equals("male"))?"남":"여";
	String email = request.getParameter("email");
	String major = request.getParameter("major");
%>


	<div id="container">
		<h2>Hello <%= getSpec(request) %></h2>
		<table id="memdetail-tab">
			<tr>
				<th>ID</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><%=pw %></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>BirthDay</th>
				<td><%=birth %> (<%= age %>세)</td>
			</tr>
			<tr>
				<th>Gender</th>
				<td><%=gender %></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><%=email %></td>
			</tr>
			<tr>
				<th>Major</th>
				<td><%=major %></td>
			</tr>
			<tr>
				<th>Subject</th>
				<td></td>
			</tr>
		</table>
	</div>
	
<%@ include file="../common/footer.jsp" %>