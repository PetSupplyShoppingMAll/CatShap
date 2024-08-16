<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="catshap.butler.dao.ProductDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="catshap.butler.bean.Product" %>
<%@page import="catshap.butler.interfaces.ProductInterface" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Properties"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	request.setCharacterEncoding("utf-8");
	ProductInterface pi = new ProductDao();
	
    String category = (String)request.getParameter("category");
    List<Product> productList = pi.selectAll(category);
    
%> 
   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>Product</title>
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/A01.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/Product.js"></script>
    <script>
        const category = "<%=category%>";
    </script>
    <style type="text/css">
        .product {
            flex: 1 1 calc(25% - 16px);
            box-sizing: border-box;
            text-align: center;
        }
        .product a{
        	text-decoration:none;
        }

        #product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
        }


        .product img {
            width: 300px;
            height: auto;
        }

        @media (max-width: 1200px) {
            .product {
                flex: 1 1 calc(33.333% - 16px);
            }
        }

        @media (max-width: 800px) {
            .product {
                flex: 1 1 calc(50% - 16px);
            }
        }

        @media (max-width: 480px) {
            .product {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="a-01" id="a01Container">
        <main class="customer-support1">
            <div id="search">
                <input type="text" id="search-input" placeholder=" search"/>
                <button id="search-button">Search</button>
            </div>
            <div class="sort-links">
                <a href="#" data-sortby="price" data-sortorder="ASC">낮은 가격순</a>
                <p>|</p>
                <a href="#" data-sortby="price" data-sortorder="DESC">높은 가격순</a>
                <p>|</p>
                <a href="#" data-sortby="count" data-sortorder="DESC">인기순</a>
                <p>|</p>
                <a href="#" data-sortby="reviews" data-sortorder="DESC">리뷰 순</a>
            </div>

            <h2 id="category">Category : &nbsp;<span id="currentCategory"> ALL </span></h2>
            <div id="product-list">
            </div>
            <div id="pagination-controls">
                <button id="prev-page" disabled >&larr;</button>
               	<div id="page-numbers"></div>
                <button id="next-page" disabled >&rarr;</button>
            </div>
        </main>
       <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>