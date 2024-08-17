<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="catshap.butler.interfaces.OrderProductInterface"%>
<%@page import="catshap.butler.dao.OrderProductDao"%>
<%@page import="catshap.butler.bean.Users"%>
<%@page import="catshap.butler.bean.MyOrderProduct"%>
<%@page import="java.util.List"%>

<%
    request.setCharacterEncoding("utf-8");
    
	Users user = (Users)session.getAttribute("user");

    OrderProductInterface oi = new OrderProductDao();
    List<MyOrderProduct> myOrderProductList = oi.getMyOrderProductList(user.getUserNo());
        
    System.out.println(myOrderProductList);
    request.setAttribute("myOrderProductList", myOrderProductList);
    
    RequestDispatcher rd = request.getRequestDispatcher("user_orders_page.jsp");
    rd.forward(request, response);
%>
