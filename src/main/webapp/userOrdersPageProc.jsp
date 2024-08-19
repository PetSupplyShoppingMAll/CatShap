<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="catshap.butler.interfaces.OrderProductInterface"%>
<%@page import="catshap.butler.dao.OrderProductDao"%>
<%@page import="catshap.butler.bean.Users"%>
<%@page import="catshap.butler.bean.MyOrderProduct"%>
<%@page import="java.util.List"%>

<%
    request.setCharacterEncoding("utf-8");
    
	Users user = (Users)session.getAttribute("user");
	int userNo = (user != null) ? user.getUserNo() : 0;	
	String ordStatus = request.getParameter("ordStatus");
	boolean isVisited = true;
	
	if (ordStatus == null) {
		isVisited = false;
		ordStatus = "주문완료";
	}
    OrderProductInterface oi = new OrderProductDao();
    List<MyOrderProduct> myOrderProductList = oi.getMyOrderProductList(userNo, ordStatus);
    int myOrderSuccessCnt = oi.getMyOrderProductCnt(userNo, "주문완료");
    int myOrderCancelCnt = oi.getMyOrderProductCnt(userNo, "주문취소");
    
    // 메뉴를 클릭한 경우
    if (isVisited) {
    	Gson gson = new Gson();
        String jsonResponse = gson.toJson(myOrderProductList);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    } else {
    	// 처음 내 주문 내역 방문한 경우
	    request.setAttribute("myOrderProductList", myOrderProductList);
	    request.setAttribute("myOrderSuccessCnt", myOrderSuccessCnt);
	    request.setAttribute("myOrderCancelCnt", myOrderCancelCnt);
	    
	  	RequestDispatcher rd = request.getRequestDispatcher("user_orders_page.jsp");
	    rd.forward(request, response);
    }

%>
