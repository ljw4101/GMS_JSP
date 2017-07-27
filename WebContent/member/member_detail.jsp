<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<% 	
	Map<String, String> map = getDetail(request);
%>	
	<div id="container">
		<table id="member_detail_tab">
			<tr>
				<td colspan="2" rowspan="3"><img src="<%=request.getContextPath() %>/img/<%=map.get("profile") %>" alt="" /></td>
				<th class="detail_th">이름</th>
				<td><%=map.get("name")%></td>
			</tr>
			<tr>
				<th class="detail_th">ID</th>
				<td><%=map.get("id") %></td>
			</tr>
			<tr>
				<th class="detail_th">SSN</th>
				<td><%=map.get("ssn") %></td>
			</tr>
			<tr>
				<th class="detail_th">전화</th>
				<td colspan="3"><%=map.get("phone") %></td>
			</tr>
			<tr>
				<th class="detail_th">이메일</th>
				<td colspan="3"><%=map.get("email") %></td>
			</tr>
			<tr>
				<th class="detail_th">전공</th>
				<td colspan="3"><%=map.get("msjor_id") %></td>
			</tr>
		</table><br />
		<div id="btn_div">
			<button id="list_btn" onclick="javascript:goList()" >목 록</button>
			<button id="update_btn" onclick="javascript:goUpdate()">수 정</button>
		</div>
	</div>
<% 		
	//String pw = request.getParameter("pw");
	//String name = request.getParameter("name");
	//String birth = request.getParameter("birth").substring(0, 4);
	//int age = 2017-Integer.parseInt(birth);
	//String gender = (request.getParameter("gender").equals("male"))?"남":"여";
	//String email = request.getParameter("email");
	//String major = request.getParameter("major");
%>
<script>
	function goList(){
		location.href="<%=root(request)%>/member/member_list.jsp?action=list";
	}
	
	function goUpdate(){
		location.href="<%=root(request)%>/member/member_update.jsp?id=<%=map.get("id")%>";
	}
</script>
<%@ include file="../common/footer.jsp" %>