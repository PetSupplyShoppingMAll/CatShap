<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.OrderProduct"%>
<%@page import="catshap.butler.interfaces.ProductInterface"%>
<%@page import="catshap.butler.interfaces.BasketInterface"%>
<%@page import="catshap.butler.bean.Basket"%>
<%@page import="catshap.butler.bean.Product"%>
<%@page import="catshap.butler.bean.Users"%>
<%@page import="catshap.butler.dao.BasketDao"%>
<%@page import="catshap.butler.dao.ProductDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	request.setCharacterEncoding("utf-8");
	
	ProductInterface pi = new ProductDao();	
	String purchaseType = request.getParameter("purchaseType");
	int prodNo, prodCnt;
	
	if (purchaseType.equalsIgnoreCase("direct")) {	// 단일 상품 구매할 경우
		prodNo = Integer.parseInt(request.getParameter("prodNo"));
		prodCnt = Integer.parseInt(request.getParameter("prodCnt"));
		
		Product product = pi.selectProduct(prodNo);
		request.setAttribute("product", product);
		request.setAttribute("prodCnt", prodCnt);
		request.setAttribute("prodTotalPrice", prodCnt * (product.getProdPrice()));
		request.setAttribute("basketProductList", null);
	} else {	// 장바구니에서 상품 구매할 경우
		String[] prodNos = request.getParameterValues("prodno[]");
	    String[] quantities = request.getParameterValues("quantity[]");
	    String[] prices = request.getParameterValues("price[]");
	    String[] prodimgpath = request.getParameterValues("prodimgpath[]");
	    String[] proddescript = request.getParameterValues("proddescript[]");
	    
	    Map<Integer, String> prodimgpathMap = new HashMap<>();
	    Map<Integer, String> proddescriptMap = new HashMap<>();
	    int totalProductCount = 0;
		int prodTotalPrice = 0;
		
	    ArrayList<OrderProduct> orderProducts = new ArrayList<>();
	    if (prodNos != null && quantities != null && prices != null) {
	        int prodNosLeng = prodNos.length;
	        for (int i = 0; i < prodNosLeng; i++) {
	            OrderProduct orderProduct = new OrderProduct();
	            orderProduct.setProdNo(Integer.parseInt(prodNos[i]));
	            orderProduct.setOrdProdAmt(Integer.parseInt(quantities[i]));
	            orderProduct.setOrdProdPrice(Integer.parseInt(prices[i]));
	            orderProducts.add(orderProduct);
	            prodimgpathMap.put(Integer.parseInt(prodNos[i]), prodimgpath[i]);
	            proddescriptMap.put(Integer.parseInt(prodNos[i]), proddescript[i]);
	            totalProductCount += orderProduct.getOrdProdAmt();
	            prodTotalPrice += orderProduct.getOrdProdPrice();
	        }
	    }
		
		request.setAttribute("basketProductList", orderProducts);
		request.setAttribute("prodimgpathMap", prodimgpathMap);
		request.setAttribute("proddescriptMap", proddescriptMap);
		request.setAttribute("prodCnt", totalProductCount);
		request.setAttribute("prodTotalPrice", prodTotalPrice);
	}
	
	RequestDispatcher rd = request.getRequestDispatcher("productOrders.jsp");
	rd.forward(request, response);
%>
