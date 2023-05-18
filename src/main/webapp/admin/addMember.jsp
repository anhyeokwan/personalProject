<%@page import="kr.or.admin.model.service.AdminServiceImpl"%>
<%@page import="kr.or.admin.model.service.AdminService"%>
<%@page import="kr.or.admin.model.vo.Service"%>
<%@page import="kr.or.admin.model.vo.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    
    	String lCategory = request.getParameter("lCategory");
    	String sCategory = request.getParameter("sCategory");
    	String svcId = request.getParameter("svcId");
    	String svcPw = request.getParameter("svcPw");
    	String userChk = request.getParameter("userChk");
    	
		Service service = new Service();
		service.setPrtCode(lCategory);
		service.setSvcCode(sCategory);
		service.setSvcId(svcId);
		service.setSvcPw(svcPw);
		service.setStatus(userChk);
		
		AdminService adminService = new AdminServiceImpl();
		
		int result = adminService.insertCompany(service);
		
		if(result == 1){
			
		}
    	
    %>
    