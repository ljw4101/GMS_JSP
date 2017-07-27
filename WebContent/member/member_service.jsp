<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../constants/db.jsp" %>
<%! 
	//root
	public String root(HttpServletRequest request){
		return request.getContextPath();
	}
	
	//member_detail, member_update
	public Map<String, String> getDetail(HttpServletRequest request){
		Map<String, String> map = new HashMap<>();
		
		try{
			Class.forName(ORACLE_DRIVER);
			String id = request.getParameter("id");
			PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				map.put("id", rs.getString("id"));
				map.put("name", rs.getString("name"));
				map.put("pw", rs.getString("pw"));
				map.put("ssn", rs.getString("ssn"));
				map.put("regdate", rs.getString("regdate"));
				map.put("phone", rs.getString("phone"));
				map.put("email", rs.getString("email"));
				map.put("major_id", rs.getString("major_id"));
				map.put("profile", rs.getString("profile"));
			}
		}catch(Exception e){
			
		}
		return map;
	}
	
	//member_list
	public List<Map<String, String>> getList(HttpServletRequest request){
		List<Map<String, String>> list = new ArrayList<>();
		Map<String, String> map = null;
		
		String action = request.getParameter("action");
		try{
			Class.forName(ORACLE_DRIVER);
			String name = request.getParameter("name");
			
			PreparedStatement pstmt = null;
			if(action.equals("list")){
				pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member order by regdate desc");
			}else{
				pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("select * from member where name=? order by regdate desc");
				pstmt.setString(1, name);
			}

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				map = new HashMap<>();
				map.put("id", rs.getString("id"));
				map.put("name", rs.getString("name"));
				map.put("ssn", rs.getString("ssn"));
				map.put("regdate", rs.getString("regdate"));
				map.put("phone", rs.getString("phone"));
				map.put("email", rs.getString("email"));
				map.put("major_id", rs.getString("major_id"));
				list.add(map);
			}
		}catch(Exception e){
			
		}
		return list;
	}
%>