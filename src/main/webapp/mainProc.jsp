<%@page import="catshap.butler.dao.MainDao"%>
<%@page import="catshap.butler.interfaces.MainInterface"%>
<%@page import="catshap.butler.bean.Main"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%
	MainInterface ii = new MainDao();
	List<Main> listMain = ii.selectMain();
	RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
	
	System.out.println(listMain);
	request.setAttribute("listMain", listMain);
	rd.forward(request, response);
%>