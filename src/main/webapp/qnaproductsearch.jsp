<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="catshap.butler.bean.QnaProduct"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Product Search</title>
    <script>
        function selectProduct(prodNo, prodName) {
			// 부모 창의 값 넘겨주기
            window.opener.document.getElementById('prodNoInput').value = prodNo;
            window.opener.document.getElementById('prodNameInput').value = prodName;
            window.close(); // 창 닫기
        }
    </script>
</head>
<body>
    <h1>Product Search</h1>
    <form method="get" action="${pageContext.request.contextPath}/searchProduct">
        <input type="text" name="keyword" placeholder="Search">
        <button type="submit">Search</button>
    </form>

    <!-- 검색 결과 출력 -->
    <c:if test="${not empty products}">
        <h2>Search Results:</h2>
        <ul>
			<c:forEach var="product" items="${products}">
			    <li>${product.prodName}
			        <img src="./image/${product.prodImgPath}" alt="${product.prodName}" width="100" height="100">
			        <button type="button" onclick="selectProduct(${product.prodNo}, '${product.prodName}', '${product.prodImgPath}')">선택</button>
			    </li>
			</c:forEach>
        </ul>
    </c:if>
</body>
</html>