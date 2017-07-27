<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../constants/db.jsp" %>
<%
	PreparedStatement pstmt = null;
	Class.forName(ORACLE_DRIVER);
	pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select id from member");
	ResultSet rs = pstmt.executeQuery();
	
	List<String> list = new ArrayList<>();
	while(rs.next()){
		list.add(rs.getString("id"));
	}
	
	int u_rs=0;
	for(int i=0; i<list.size(); i++){
		pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("update member set email=? where id=?");
		pstmt.setString(1, list.get(i)+"@test.com");
		pstmt.setString(2, list.get(i));
		u_rs = pstmt.executeUpdate();
		if(u_rs!=1){
%>
		<script>
		alert('이메일 수정실패');
		location.href="<%=request.getContextPath()%>/index.jsp";
		</script>
<%
			break;
		}
	}
%>
<script>
alert('이메일 수정완료');
location.href="<%=request.getContextPath()%>/index.jsp";
</script>