<%@page import="catshap.butler.interfaces.MainInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="catshap.butler.bean.QnaProduct"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Product Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        h2 {
            color: #555;
            margin-top: 40px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: white;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        li img {
            margin-right: 20px;
            border-radius: 8px;
        }

        li button {
            margin-left: auto;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        li button:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function selectProduct(prodNo, prodName, prodImgPath) {
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
    <h2>Search Results:</h2>
    <ul>
        <c:forEach var="product" items="${products}">
            <li>
                <img src="./image/${product.prodImgPath}" alt="${product.prodName}" width="100" height="100">
                ${product.prodName}
                <button type="button" onclick="selectProduct(${product.prodNo}, '${product.prodName}', '${product.prodImgPath}')">선택</button>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
