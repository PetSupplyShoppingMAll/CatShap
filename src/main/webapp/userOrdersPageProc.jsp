<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="catshap.butler.interfaces.OrderProductInterface"%>
<%@page import="catshap.butler.dao.OrderProductDao"%>
<%@page import="catshap.butler.bean.Users"%>
<%@page import="catshap.butler.bean.MyOrderProduct"%>
<%@page import="java.util.List"%>

<%
    request.setCharacterEncoding("utf-8");
    
	Users user = (Users)session.getAttribute("user");
	int userNo = user.getUserNo();
	String ordStatus = request.getParameter("ordStatus");

    OrderProductInterface oi = new OrderProductDao();
    List<MyOrderProduct> myOrderProductList = oi.getMyOrderProductList(userNo, ordStatus);
    int myOrderProductCnt = oi.getMyOrderProductCnt(userNo, ordStatus);
   
    request.setAttribute("myOrderProductList", myOrderProductList);
    request.setAttribute("myOrderProductCnt", myOrderProductCnt);
    
    RequestDispatcher rd = request.getRequestDispatcher("user_orders_page.jsp");
    rd.forward(request, response);

%>
