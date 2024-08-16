<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="catshap.butler.dao.BasketDao" %>
<%@ page import="catshap.butler.interfaces.BasketInterface" %>
<%@ page import="catshap.butler.bean.Basket" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // Form data collection
    int prodNo = Integer.parseInt(request.getParameter("prodNo"));
    int userNo = Integer.parseInt(request.getParameter("userNo"));
    int baskAmt = Integer.parseInt(request.getParameter("baskAmt"));
    
    // Basket object creation and property setting
    Basket basket = new Basket();
    basket.setProdNo(prodNo);
    basket.setUserNo(userNo);
    basket.setBaskAmt(baskAmt);
    
    // DAO instance
    BasketInterface bi = new BasketDao();
    boolean success = false;
    
    try {
        boolean isProductInBasket = bi.isProductInBasket(userNo, prodNo);
        
        if (isProductInBasket) {
            bi.removeProductFromBasket(userNo, prodNo);
        }
        
        success = bi.addToBasket(basket);
    } catch (Exception e) {
        e.printStackTrace();
        success = false;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가 결과</title>
<script>
    <% if (success) { %>
        alert("장바구니에 추가되었습니다!");
    <% } else { %>
        alert("장바구니 추가에 실패했습니다.");
    <% } %>
    history.go(-1);
</script>
</head>
<body>
</body>
</html>
