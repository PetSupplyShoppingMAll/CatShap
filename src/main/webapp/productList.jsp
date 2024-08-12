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

        #product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
        }

        .div417 a {
            display: block;
            width: 100px;
            height: 30px;
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
    <div class="a-01" id="a01Container">
        <main class="customer-support1">
            <header class="header2">
                <div class="backgroundhorizontalbordersh34">
                    <div class="backgroundhorizontalbordersh35">
                        <div class="button-wrapper8">
                            <div class="button30">
                                <div class="background101"></div>
                                <div class="background102"></div>
                            </div>
                        </div>
                        <div class="category-name-parent">
                            <div class="category-name">
                                <div class="div417"><a href="productProc.jsp?category=간식">간식</a></div>
                            </div>
                            <div class="category-name">
                                <div class="div417"><a href="productProc.jsp?category=사료">사료</a></div>
                            </div>
                            <div class="category-name">
                                <div class="div417"><a href="productProc.jsp?category=장난감">장난감</a></div>
                            </div>
                            <div class="category-name">
                                <div class="div417"><a href="productProc.jsp?category=옷">옷</a></div>
                            </div>
                            <div class="category-name">
                                <div class="div417"><a href="productProc.jsp?category=기타">기타</a></div>
                            </div>
                            <div class="item-wrapper6">
                                <img class="item-icon58" loading="lazy" alt="" src="./image/item1@2x.png" />
                            </div>
                            <div class="strong-q-a-wrapper3">
                                <b class="strong-q18" id="strongQ">Q & A</b>
                            </div>
                            <div class="review-container-container">
                                <div class="review-container3">
                                    <div class="reviews-wrapper9">
                                        <div class="reviews17">REVIEWS</div>
                                    </div>
                                    <div class="emphasis16"></div>
                                </div>
                            </div>
                        </div>
                        <img class="item-icon59" alt="" src="./image/item-12.svg" />
                    </div>
                </div>
                <div class="horizontalborder26">
                    <img class="item-icon60" loading="lazy" alt="" src="./image/item-21@2x.png" />
                    <div class="item43">
                        <img class="link-538f292f61014d47de06ecd8" alt=""
                            src="./image/link--538f292f61014d47de06ecd9d380fb41png1@2x.png" />
                    </div>
                    <div class="external-link-wrapper">
                        <div class="external-link">
                            <img class="link-icon36" loading="lazy" alt="" src="./image/link1.svg"
                                id="linkIcon" />
                            <div class="link92" id="linkContainer">
                                <img class="icon211" loading="lazy" alt="" src="./image/icon-10.svg" />
                                <div class="background103">
                                    <b class="strong-018">0</b>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <img class="icon212" alt="" src="./image/icon-7@2x.png" />
                    <img class="icon213" alt="" src="./image/icon-29.svg" />
                    <div class="div422">  고객 지원센터</div>
                    <a class="strong-0109230444918">01012345678</a>
                    <img class="icon214" alt="" src="./image/icon-32@2x.png" />
                    <div class="link93" id="link">로그인</div>
                    <img class="icon215" alt="" src="./image/icon-41@2x.png" />
                    <div class="link94" id="linkContainer">
                        <a class="a66">회원가입</a>
                    </div>
                    <img class="icon216" alt="" src="./image/icon-52.svg" />
                    <a class="a67" id="text3">주문정보</a>
                </div>
                <div class="div423">
                    <div class="child11"></div>
                    <img class="black-15006260-2-icon13" loading="lazy" alt=""
                        src="./image/black-15006260-2-11@2x.png" />
                    <div class="inner12">
                        <div class="parent23">
                            <div class="div424">#</div>
                            <div class="wrapper34">
                                <a class="a68">냥</a>
                            </div>
                        </div>
                    </div>
            </header>
            </p>
            <div>
                <input type="text" id="search-input" />
                <button id="search-button">Search</button>
            </div>
            <div class="sort-links">
                <a href="#" data-sortby="price" data-sortorder="ASC">낮은 가격순</a>
                <a href="#" data-sortby="price" data-sortorder="DESC">높은 가격순</a>
                <a href="#" data-sortby="count" data-sortorder="DESC">인기순</a>
                <a href="#" data-sortby="reviews" data-sortorder="DESC">리뷰 순</a>
            </div>
            <section class="wrapper36">
                <div class="category-name-parent">
                    <div class="category-name">
                        <div class="div417"><a href="productProc.jsp?category=ALL">ALL</a></div>
                    </div>
                    <div class="category-name">
                        <div class="div417"><a href="productProc.jsp?category=간식">간식</a></div>
                    </div>
                    <div class="category-name">
                        <div class="div417"><a href="productProc.jsp?category=사료">사료</a></div>
                    </div>
                    <div class="category-name">
                        <div class="div417"><a href="productProc.jsp?category=장난감">장난감</a></div>
                    </div>
                    <div class="category-name">
                        <div class="div417"><a href="productProc.jsp?category=옷">옷</a></div>
                    </div>
                    <div class="category-name">
                        <div class="div417"><a href="productProc.jsp?category=기타">기타</a></div>
                    </div>
                </div>
            </section>
            <h2>Category: <span id="currentCategory">ALL</span></h2>
            <div id="product-list"></div>
            <div id="pagination-controls">
                <button id="prev-page" disabled>
                    << /button>
                        <div id="page-numbers"></div>
                        <button id="next-page" disabled>></button>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>