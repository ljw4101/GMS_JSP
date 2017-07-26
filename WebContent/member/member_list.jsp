<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../constants/db.jsp" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<% 
	Class.forName(ORACLE_DRIVER);
	//String name = request.getParameter("name");
	//PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member where name=?");
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member order by regdate desc");
	//pstmt.setString(1, name);
	ResultSet rs = pstmt.executeQuery();
	
	Map<String, String> map = null;
	List<Map<String, String>> list = new ArrayList<>();
	while(rs.next()){
		map = new HashMap<>();
		map.put("id", rs.getString("id"));
		map.put("name", rs.getString("name"));
		map.put("ssn", rs.getString("ssn"));
		map.put("regdate", rs.getString("regdate"));
		list.add(map);
	}
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
		int cnt = list.size();
		for(int i=0; i<list.size(); i++){
			Map<String, String> mapList = list.get(i);
			
		//for(int i=0; i<list.size(); i++)
		%>
			<tr>
				<td><%=cnt--%></td>
				<td><%=mapList.get("id") %></td>
				<td><%=mapList.get("ssn")%></td>
				<td><%=mapList.get("name")%></td>
				<td>010-1234-5678</td>
				<td>hong@gmail.com</td>
				<td>컴퓨터공학</td>
				<td>자바</td>
				<td><%=mapList.get("regdate")%></td>
			</tr>
		<% 
		} 
		%>
		</table>
	</div>
<%@ include file="../common/footer.jsp" %>