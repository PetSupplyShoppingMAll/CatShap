<%@page import="catshap.butler.dao.BasketDao"%>
<%@page import="catshap.butler.interfaces.BasketInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int basketNo = Integer.parseInt(request.getParameter("basketNo"));
	BasketInterface bi = new BasketDao();

	bi.deleteBasket(basketNo);
	
	response.sendRedirect("basket.jsp");
%>