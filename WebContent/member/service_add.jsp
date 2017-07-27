<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="member_service.jsp" %>
<%
	Class.forName(ORACLE_DRIVER);
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	int age = 2017-Integer.parseInt(birth.substring(0, 4));
	String gender = (request.getParameter("gender").equals("male"))?"남":"여";
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String major = request.getParameter("major");
	String[] subject=request.getParameterValues("subject");
	
	PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("insert into member(id, name, pw, ssn, email, phone, major_id, regdate) values (?, ?, ?, ?, ?, ?, ?, sysdate)");
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pw);
	pstmt.setString(4, birth);
	pstmt.setString(5, email);
	pstmt.setString(6, phone);
	pstmt.setString(7, major);
	String rs = String.valueOf(pstmt.executeUpdate());
	
	if(rs.equals("1")){
%>
	<script>
	alert('회원가입 완료');
	location.href="<%=root(request)%>/index.jsp";
	</script>
<%		
	}else{
%>
	<script>
	alert('회원가입 실패 관리자에게 문의하세요');
	location.href="<%=root(request)%>/common/main.jsp";
	</script>
<%
	}
%>
