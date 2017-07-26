<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../constants/db.jsp" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>

	<div id="container">
		<form id="detail_form" action="<%=root(request)%>/member/service_update.jsp" method="get">
		<table id="member_detail_tab">
			<tr>
				<td colspan="2" rowspan="3"><img src="<%=root(request) %>/img/profile.jpg" alt="" /></td>
				<th class="detail_th">이름</th>
				<td><input type="text" name="name" placeholder="<%=request.getParameter("name") %>"/></td>
			</tr>
			<tr>
				<th class="detail_th">ID</th>
				<td><%=request.getParameter("id") %></td>
			</tr>
			<tr>
				<th class="detail_th">SSN</th>
				<td><%=request.getParameter("ssn") %></td>
			</tr>
			<tr>
				<th class="detail_th">전화</th>
				<td colspan="3"></td>
			</tr>
			<tr>
				<th class="detail_th">이메일</th>
				<td colspan="3"></td>
			</tr>
			<tr>
				<th class="detail_th">주소</th>
				<td colspan="3"></td>
			</tr>
			<tr>
				<th class="detail_th">전공</th>
				<td colspan="3"></td>
			</tr>
			<tr>
				<th class="detail_th">과목</th>
				<td colspan="3"></td>
			</tr>
		</table>
		<br />
		<div id="btn_div">
			<input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
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
		location.href="<%=root(request)%>/member/member_list.jsp?name=<%=request.getParameter("name") %>";
	}
</script>
<%@ include file="../common/footer.jsp" %>