<%@page import="catshap.butler.dao.UserDao"%>
<%@page import="catshap.butler.interfaces.UserInterface"%>
<%@page import="catshap.butler.bean.Users"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Users user = (Users)session.getAttribute("user");
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chatshap header</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <script src="./js/header.js"></script>

</head>


<body>
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
                    <div class="category-name4">
                        <div class="div421 div417 category-name"><a href="productProc.jsp?category=기타">기타</a></div>
                    </div>
                    <div class="item-wrapper6">
                        <img class="item-icon58" loading="lazy" alt="" src="./image/icon4.png" />
                    </div>
                    <div class="strong-q-a-wrapper3">
                        <b class="strong-q18" id="strongQ"><a href="qnaboardmainProc.jsp">Q & A</a></b>
                    </div>
                </div>
            </div>
        </div>
        <div class="horizontalborder26">
            <img class="item-icon60" loading="lazy" alt="" src="./image/imgCat.png" />
            <div class="item43">
            </div>
            <div class="external-link-wrapper">
                <div class="external-link">
                    <img class="link-icon36" loading="lazy" alt="" src="./image/catSvg1.svg" id="linkIcon" />
                    <div class="link92" id="linkContainer">
                        <img class="icon211" loading="lazy" alt="" src="./image/catSvg2.svg" />
                        <b class="strong-018">0</b>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="user">
            <div class="username">${user.uname}</div>
            <c:if test="${!empty user}">
            <div class="itis"> 님! 환영합니다</div>
        	</c:if>
        	<c:if test="${empty user}">
            <div class="itis"></div>        	
        	</c:if>
        </div>
        <div>
            <img class="icon212" alt="" src="./image/icon1.png" />
            <img class="icon213" alt="" src="./image/catSvg3.svg" />
            <div class="div422">  고객 지원센터</div>
            <a class="strong-0109230444918">01012345678</a>
            <img class="icon214" alt="" src="./image/icon2.png" />
			
			<c:if test="${empty user}">
            	<div class="link93" id="link">로그인</div>
            </c:if>
			<c:if test="${!empty user}">
            	<div class="link95" id="link" >로그아웃</div>
            </c:if>

            <img class="icon215" alt="" src="./image/icon3.png" />
            <div class="link94" id="linkContainer">
                <a class="a66" href="user_join.jsp">회원가입</a>
            </div>
            <img class="icon216" alt="" src="./image/catSvg4.svg" />
            <a class="a67" id="text3" href="user_orders_page.jsp">주문정보</a>
        </div>
        <div class="div423">
            <div class="child11"></div>
            <img class="black-15006260-2-icon13" loading="lazy" alt="" src="./image/cat.png" />
            <div class="inner12">
                <div class="parent23">
                    <div class="div424">#</div>
                    <div class="wrapper34">
                        <a class="a68">냥</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>
</html>