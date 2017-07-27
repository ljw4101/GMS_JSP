<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
<%
	Map<String, String> map = getDetail(request);
%>

	<div id="container">
		<form id="detail_form" action="<%=root(request)%>/member/service_update.jsp" method="get">
		<table id="member_detail_tab">
			<tr>
				<td colspan="2" rowspan="3"><img src="<%=root(request) %>/img/<%=map.get("profile") %>" alt="" /></td>
				<th class="detail_th">이름</th>
				<td><input type="text" name="name" value="<%=map.get("name")%>"/></td>
			</tr>
			<tr>
				<th class="detail_th">ID</th>
				<td><%=map.get("id")%></td>
			</tr>
			<tr>
				<th class="detail_th">SSN</th>
				<td><%=map.get("ssn")%></td>
			</tr>
			<tr>
				<th class="detail_th">전화</th>
				<td colspan="3"><input type="text" name="phone" value="<%=map.get("phone")%>"/></td>
			</tr>
			<tr>
				<th class="detail_th">이메일</th>
				<td colspan="3"><input type="text" name="email" value="<%=map.get("email")%>"/></td>
			</tr>
			<tr>
				<th class="detail_th">전공</th>
				<td colspan="3"><input type="text" name="major_id" value="<%=map.get("major_id")%>"/></td>
			</tr>
		</table>
		<br />
		<div id="btn_div">
			<input type="hidden" name="id" value="<%=map.get("id")%>" />
			<input type="submit" id="confirm_btn" value="수정"/>
			<input type="button" id="cancel_btn" onclick="javascript:cancel()" value="취소"/>
		</div>
		</form>
	</div>

<script>
	function goConfirm(){
		location.href="<%=root(request)%>/member/service_update.jsp?id=<%=request.getParameter("id")%>&name=<%=request.getParameter("name")%>";
	}
	
	function cancel(){
		location.href="<%=root(request)%>/member/member_list.jsp?action=list";
	}
</script>
<%@ include file="../common/footer.jsp" %>