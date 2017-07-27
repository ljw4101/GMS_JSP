<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<% 
	List<Map<String, String>> list = getList(request);
	Map<String, String> map=null;
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
				<th>학점</th>
				<th>Major</th>
				<th>RegDate</th>
				<th>수정/삭제</th>
			</tr>
		<%
		int cnt = list.size();
		for(int i=0; i<list.size(); i++){
			map = new HashMap<>();
			map = list.get(i);
			
		%>
			<tr>
				<td><%=cnt--%></td>
				<td><%=map.get("id") %></td>
				<td><%=map.get("ssn")%></td>
				<td><a href="<%=request.getContextPath()%>/member/member_detail.jsp?id=<%=map.get("id") %>"><%=map.get("name")%></a></td>
				<td><%=map.get("phone")%></td>
				<td><%=map.get("email")%></td>
				<td>A</td>
				<td><%=map.get("major_id")%></td>
				<td><%=map.get("regdate")%></td>
				<td><a href="<%=request.getContextPath()%>/member/member_update.jsp?id=<%=map.get("id") %>">수정</a>
					<a href="<%=request.getContextPath()%>/member/service_delete.jsp?id=<%=map.get("id") %>">삭제</a></td>
			</tr>
		<% 
		} 
		%>
		</table>
	</div>
<%@ include file="../common/footer.jsp" %>