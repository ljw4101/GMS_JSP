<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
	public String getSpec(HttpServletRequest request){
		
		String name = request.getParameter("name");
		String gender = (request.getParameter("gender").equals("male"))?"남":"여";
		int age = 2017-Integer.parseInt(request.getParameter("birth").substring(0, 4));
		
		String spec = String.format("%s %s %d", name, gender, age);
		return spec;
	}

	public String root(HttpServletRequest request){
		return request.getContextPath();
	}
%>