<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/member_service.jsp" %>
<%@ include file="../constants/db.jsp" %>
<%@ page import="java.sql.*"%>
<%@ include file="../member/member_head.jsp" %>
<% 	
	Class.forName(ORACLE_DRIVER);
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("Select pw from member where id=?");
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(rs.getString("pw").equals(pw)){
%>
 

	<div id="container">
	<table id="index-tab">
		<tr id="index-tab-tr">
			<th><i class="fa fa-cloud"></i> 학생관리</th>
			<th><i class="fa fa-file"></i> 성적관리</th>
			<th><i class="fa fa-bars"></i> 게시판</th>
		</tr>
		<tr>
			<td>
				<ul class="index-ul">
					<li><a href="<%=root(request) %>/member/member_add.jsp">학생정보 추가</a></li>
					<li><a href="<%=root(request) %>/member/member_list.jsp">학생정보 목록</a></li>
					<li><a href="<%=root(request) %>/member/member_search.jsp">학생 상세정보</a></li>
					<li><a href="<%=root(request) %>/member/member_update.jsp">학생정보 수정</a></li>
					<li><a href="<%=root(request) %>/member/member_delete.jsp">학생정보 삭제</a></li>
				</ul>
			</td>
			<td>
				<ul class="index-ul">
					<li><a href="../grade/grade_add.jsp">성적 입력</a></li>
					<li><a href="../grade/grade_list.jsp">성적 목록</a></li>
					<li><a href="../grade/grade_detail.jsp">성적 목록 상세</a></li>
					<li><a href="../grade/grade_update.jsp">성적 수정</a></li>
					<li><a href="../grade/grade_delete.jsp">성적 삭제</a></li>
				</ul>
			</td>
			<td>
				<ul class="index-ul">
					<li><a href="<%=root(request)%>/board/board_write.jsp">게시글 쓰기</a></li>
					<li><a href="<%=root(request)%>/board/board_list.jsp">게시글 목록</a></li>
					<li><a href="<%=root(request)%>/board/board_detail.jsp">게시글 상제</a></li>
					<li><a href="<%=root(request)%>/board/board_update.jsp">게시글 수정</a></li>
					<li><a href="<%=root(request)%>/board/board_delete.jsp">게시글 삭제</a></li>
				</ul>
			</td>
		</tr>
	</table>
	</div>

<% 			
		}else{ 
%>
		<script>
			alert('잘못된 비밀번호입니다.');
			location.href="<%=headRoot(request)%>/index.jsp"
		</script>
<% 	
		}
	}else{
%>
	<script>
		alert('없는ID. 회원가입 바람니다.');
		location.href="<%=headRoot(request)%>/member/member_add.jsp"
	</script>
<%
		
	}
%>	
<%@ include file="footer.jsp" %>