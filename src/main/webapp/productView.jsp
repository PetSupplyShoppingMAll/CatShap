<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.Users"%>
<%@page import="catshap.butler.interfaces.ProductViewInterface"%>
<%@page import="catshap.butler.interfaces.ReviewViewInterface"%>
<%@page import="catshap.butler.bean.ProductView"%>
<%@page import="catshap.butler.bean.ReviewView"%>
<%@page import="catshap.butler.dao.ProductViewDao"%>
<%@page import="catshap.butler.dao.ReviewViewDao"%>
<%@page import="java.util.List"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<%
   int prodNo = Integer.parseInt(request.getParameter("prodNo"));
   ProductViewInterface pi = new ProductViewDao();
   ProductView productView = pi.getProduct(prodNo);
   
   ReviewViewInterface ri = new ReviewViewDao();
   List<ReviewView> listReview = ri.selectReviewList(prodNo);
   
   pageContext.setAttribute("productView", productView);
   pageContext.setAttribute("listReview", listReview);
   
   HttpSession session2 = request.getSession();
   Users user = (Users) session2.getAttribute("user");
   int userNo = (user != null) ? user.getUserNo() : 0;
   pi.addCount(prodNo);
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/productView.css" />
    <link rel="stylesheet" href="./css/review.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/productView.js"></script>
    <script src="./js/review.js"></script>
    <script>        
        function checkLogin() {
            if (userNo === 0) {
                alert("로그인 후 장바구니에 추가할 수 있습니다.");
                return false;
            }
            return true;
        }
        
        function handleSubmit(event) {
            if (!checkLogin()) {
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
 
<div class="div63">
        <main class="container11">
            <div class="hygiene-info">
                <div class="hygiene-icon">
                    <img class="link-icon9" alt="" src="./image/home_link.svg" />
                </div>
                <div class="hygiene-icon1">
                    <img class="link-icon9" alt="" src="./image/home_icon1.svg" />
                </div>
                <a class="a11">  위생용품</a>
            </div>
            <div class="list-item"></div>
            <div class="product-details"></div>
            <div class="actions2">
                <div class="buy-button">
                    <div class="buy-link">
                        <div class="frame-parent14">
                            <div class="item-container">
                                <div class="item6">
                                    <div class="link17">
                                        <a class="strong-b">B U Y</a>
                                    </div>
                                </div>
                            </div>
                           <div class="item13">
							    <form action="add.jsp" method="post" onsubmit="return handleSubmit(event);">
							        <input type="hidden" name="prodNo" value="<%= productView.getProdNo() %>">
							        <input type="hidden" name="userNo" value="<%= userNo %>">
							        <input type="hidden" name="baskAmt" value="1">
							        <button type="submit">장바구니 추가</button>
							    </form>
							</div>
                            <div class="item8"></div>
                        </div>
                    </div>
                    <div class="payment-info">
                        <div class="member-benefits">
                            <div class="item9">
                                <div class="container12">
                                    <div class="link19">
                                        <a class="a13">회원혜택  </a>
                                        <div class="total-payment">
                                            <img class="icon49" alt="" src="./image/prod_icon2.png" />
                                        </div>
                                    </div>
                                    <a class="a14">최종 결제금액 </a>
                                    <img class="icon50" alt="" src="./image/icon2.png" />

                                    <div class="discount-image">
                                        <img class="icon48" alt="" src="./image/prod_icon3.svg" />
                                    </div>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="container13">
                                    <div class="horizontal-divider4"></div>
                                    <div class="selected-option">
                                        <div class="selected-title">
                                            <img class="icon52" alt="" src="./image/prod_icon4.png" />
                                            <div class="option-placeholder">
                                                <div class="horizontalborder6">
                                                    <a class="a15">선택된
                                                        옵션</a>
                                                </div>
                                                <div class="quantity">
                                                    <div class="div72">
                                                        옵션을 선택하시면 아래에 노출됩니다.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="notice-icon">
                                        <div class="minimum-quantity">
                                            <div class="quantity-box">
                                                <div class="box-background">
                                                    <div class="background24">
                                                        <img class="circlesvg-fill-icon" alt=""
                                                            src="./image/circlesvg-fill.svg" />

                                                        <div class="placeholder">
                                                            |</div>
                                                    </div>
                                                    <div class="div73">
                                                        위 옵션선택 박스를 선택하시면 아래에
                                                        상품이
                                                        추가됩니다.
                                                    </div>
                                                </div>
                                                <div class="instructions-icon">
                                                    <div class="background24">
                                                        <img class="circlesvg-fill-icon" alt=""
                                                            src="./image/circlesvg-fill.svg" />
                                                        <div class="placeholder">
                                                            |</div>
                                                    </div>
                                                    <div class="quantity-info">
                                                        <a class="a16">주문
                                                            수량안내 </a>
                                                        <div class="order-quantity-icon">
                                                            <img class="icon53" alt="" src="./image/icon2.png" />
                                                        </div>
                                                        <div class="div75">
                                                            <span> 최소 주문수량
                                                            </span>
                                                            <b class="b2">1개</b>
                                                            <span> 이상</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="separator4"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="total-parent">
                            <a class="total">Total  </a>
                            <div class="quantity-value">
                                <a class="qty">( QTY )</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="total-price">
                    <div class="price-container">
                        <div class="price-value-container">
                            <img class="icon54" alt="" src="./image/prod_icon5.png" />
                        </div>
                        <a class="strong-emphasis">0</a>
                        <div class="item-count">
                            <a class="a17">(0개)</a>
                        </div>
                    </div>
                </div>
            </div>
            <img class="icon55" alt="" src="./image/prod_icon4.png" />
            <div class="horizontalborder-group">
            </div>
    </div>
    <div class="separator5"></div>
    <div class="backgroundshadow">
        <div class="link20">
            <div class="div79"><button class="buttonshap" onclick="goToScroll('a')" />상품정보
            </div>
        </div>
        <div class="link21">
            <div class="div80"><button class="buttonshap"  onclick="goToScroll('b')" />상품후기
            </div>
            <div class="tab-value-containers">
                <div class="strong">
                    <c:set var="reviewCount" value="${fn:length(listReview)}" />
                    <b class="colon">
                        <c:out value="${reviewCount}" />
                    </b>
                </div>
            </div>
            <div class="vertical-divider4"></div>
        </div>
        <div class="link21">
            <div class="div80"><button class="buttonshap" onclick="goToScroll('c')" />상품문의
            </div>
            <div class="tab-value-containers">
                <div class="strong">
                    <b class="colon">0</b>
                </div>
            </div>
            <div class="vertical-divider4"></div>
        </div>
        <div class="link23">
            <div class="div79"><button class="buttonshap" onclick="goToScroll('d')" />구매안내
            </div>
            <div class="vertical-divider4"></div>
        </div>
    </div>

    <div class="image-container" id="imageContainer">
        <img id="fullImage" class="full-image" loading="lazy" alt="" src="./image/${productView.prodDetailImgPath}" />
        <button id="viewAllBtn">전체보기</button>       
    <div id="a"></div>
    </div>
<c:set var="pageSize" value="3" />
<c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
<c:set var="totalReviews" value="${fn:length(listReview)}" />
<c:set var="totalPages" value="${totalReviews / pageSize + (totalReviews % pageSize == 0 ? 0 : 1)}" />
<c:set var="startIndex" value="${(currentPage - 1) * pageSize}" />
<c:set var="endIndex" value="${startIndex + pageSize - 1}" />
<c:set var="endIndexCorrected" value="${endIndex >= totalReviews ? totalReviews - 1 : endIndex}" />

<div class="div88" id="b">

<c:choose>
    <c:when test="${totalReviews > 0}">
        <c:forEach var="review" items="${listReview}" begin="${startIndex}" end="${endIndexCorrected}">
            <div class="review-item">
                <div class="review-title"><strong>제목:</strong> ${review.revTitle}</div>
                <div class="review-nickname"><strong>닉네임:</strong> ${review.unick}</div>
                <div class="review-date"><strong>등록 날짜:</strong> ${review.revRegDate}</div>
                <div class="review-score">
                    <strong>별점:</strong>
                    <c:forEach var="star" begin="1" end="5">
                        <c:choose>
                            <c:when test="${star <= review.revScore}">
                                ★
                            </c:when>
                            <c:otherwise>
                                ☆
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    (${review.revScore}/5)
                </div>
                <div class="review-text"><strong>내용:</strong> ${review.revText}</div>
            </div>
            <hr />
        </c:forEach>

        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}&prodNo=${param.prodNo}">이전</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="?page=${i}&prodNo=${param.prodNo}" class="<c:if test='${i == currentPage}'>active</c:if>">${i}</a>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}&prodNo=${param.prodNo}">다음</a>
            </c:if>
        </div>
    </c:when>
    <c:otherwise>
        <section class="backgroundborder3">
            <div class="review-list-content">
                <div class="review-list-content-wrapper">
                    <div class="div89">게시물이 없습니다</div>
                </div>
            </div>
            <div class="div90">지금 첫번째 게시글을 작성해보세요.</div>
        </section>
    </c:otherwise>
</c:choose>

<button id="reviewBtn">
    <div class="action-icons">
        <img class="icon165" src="./image/icon_v.svg" />
    </div>
    <div class="div344">상품 후기 작성</div>
</button>

<!-- 모달 -->
<div id="reviewModal" class="modal">
    <!-- 모달 내용 -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>상품후기 작성</h2>
        <!-- 모달 내용 -->
        <input type="hidden" id="prodNo" value="<%= prodNo %>"/>
        <input type="hidden" id="userNo" value="<%= user != null ? user.getUserNo() : 0 %>"/>
        <div id="displayProdNo"></div>
        <label for="revTitle">후기 제목:</label><br>
        <input type="text" id="revTitle" name="revTitle"><br>
        
        <label for="revText">후기 내용:</label><br>
        <textarea id="revText" name="revText"></textarea><br>
        
        <label for="revScore">평점:</label><br>
		<input type="number" id="revScore" name="revScore" min="1" max="5" onkeydown="return false;"><br>
        
        <button id="submitReview">등록</button>
        <p id="message"></p> <!-- 메시지 출력 -->
        <div id="displayProdNo"></div>
    </div>
</div>
</div>
    <div class="separator6"></div>
    <div class="item10"></div>
    <section class="price-summary-container-parent">
        <div class="price-summary-container">
            <div class="price-summary-inner-container">
                <div class="separator7"></div>
            </div>
        </div>
        <div class="product-details-container">
            <div class="product-details-inner-containe">
                <div class="product-title-container">
                    <div class="product-title-inner-container">
                    </div>
                    <div class="product-name-container">
                        <h1 class="heading-1">
                            ${productView.prodDescript}
                        </h1>
                    </div>
                    <div class="separator7777"></div>
                </div>
            </div>
            <div class="frame-parent16">
                <div class="discount-price-container-parent">

                    <div class="original-price-container">
                        <b class="b11">${productView.prodPrice}</b>
                    </div>

                    <div class="price-tag">
                        <div class="rectangle"></div>
                    </div>
                    <div class="review-count-divider">
                        <div class="paragraphhorizontalborder2">
                            <div class="div100">문의</div>
                            <b class="inquiry-review-colon1">0</b>
                        </div>
                    </div>
                    <div class="paragraphhorizontalborder-wrapper">
                        <div class="paragraphhorizontalborder2">
                            <div class="div100">리뷰</div>
                            <c:set var="reviewCount" value="${fn:length(listReview)}" />
                            <b class="inquiry-review-colon1">
                                <c:out value="${reviewCount}" />
                            </b>
                        </div>
                    </div>
                </div>
                <div class="separator-group">
                    <div class="separator7"></div>
                    <div class="product-delivery">
                        <div class="product-information-inner-cont">
                            <div class="horizontalborder-container">
                                <div class="horizontalborder10">
                                    <div class="div102">상세옵션</div>
                                </div>
                                <div class="option-info">
                                    <div class="div103">상품 기본정보 입니다.</div>
                                </div>
                            </div>
                            <div class="row7">
                                <div class="product-information-row-elemen">
                                    <b class="b13">·</b>
                                    <div class="product-information-label-cont">
                                        <div class="div104">배송비</div>
                                    </div>
                                </div>
                                <div class="strong-3000-container2">
                                    <b>3,000원</b>
                                    <span> (50,000원 이상 구매 시 무료)</span>
                                </div>
                            </div>
                        </div>
                        <div class="row8">
                            <div class="product-code-container">
                                <div class="product-code-inner-container">
                                    <div class="product-information-row-elemen">
                                        <b class="b13">·</b>
                                        <div class="product-information-label-cont">
                                            <div class="div106">상품코드</div>
                                        </div>
                                    </div>
                                    <b class="data-wb982ea">WB982EA</b>
                                </div>
                            </div>
                            <div class="separator9"></div>
                        </div>
                    </div>
                </div>
                <div class="order-quantity-inner-container-wrapper">
                    <div class="order-quantity-inner-container">
                        <div class="minimum-quantity-info-containe">
                            <div class="minimum-quantity-message-conta">
                                <div class="background28">
                                    <div class="div107">|</div>
                                </div>
                            </div>
                            <div class="minimum-quantity-value-contain">
                                <div class="div108">주문 수량안내</div>
                                <div class="minimum-quantity-value-icon-co">
                                </div>
                            </div>
                            <div class="div109">
                                <span> 최소 주문수량 </span>
                                <b class="b2">1개</b>
                                <span> 이상</span>
                            </div>
                        </div>
                        <div class="select-quantity-message-contai">
                            <div class="dropdown-container">
                                <div class="background28">
                                    <div class="div107">|</div>
                                </div>
                            </div>
                            <div class="div111">수량을 선택해주세요.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="options-container-parent">
                <div class="options-container1">
                    <div class="selected-options-message-conta">
                        <div class="horizontalborder11">
                            <div class="div112">선택된 옵션</div>
                        </div>
                        <div class="option-info">
                            <div class="div113">
                                옵션을 선택하시면 아래에 노출됩니다.
                            </div>
                        </div>
                    </div>
                    <div class="table">
                        <div class="table-header-container">
                            <div class="table-header-inner-container">
                                <div class="horizontal-divider8"></div>
                                <div class="table-content-container">
                                    <div class="product-option-row-container">
                                        <div class="product-option-data-container">
                                            <div class="data">
                                                ${productView.prodDescript}
                                            </div>
                                        </div>
                                        <div class="quantity-selection-container">
                                            <div class="quantity-input-container">
                                                <div class="input1">
                                                    <button id="decrease-btn">-</button>
                                                    <div class="input-field" id="number-display">
                                                        1</div>
                                                    <button id="increase-btn">+</button>
                                                </div>
                                                <div class="quantity-input">
                                                </div>
                                            </div>
                                            <div class="product-points">
                                                <div class="point-icon">
                                                    <div class="div114">
                                                        <span id="product-price">${productView.prodPrice}원</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="total-price1">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row9">
                            <div class="data1"></div>
                        </div>
                    </div>
                </div>
                <div class="product-summary">
                    <div class="summary-details">
                        <div class="item-group">
                            <div class="item11">
                                <div class="container16">
                                    <div class="div116">최종 결제금액</div>
                                    <div class="link29">
                                        <div class="div117">회원혜택 </div>
                                    </div>
                                </div>
                            </div>
                            <div class="total1">Total </div>
                            <div class="qty-parent">
                                <div class="qty1">( QTY )</div>
                                <input class="icon70" type="checkbox" />
                            </div>
                            <div class="strong-emphasis-26900-parent">
                                <b class="strong-emphasis1" id="total-price">${productView.prodPrice}원</b>
                                <div class="total-amount-count">
                                    <div class="div118" id="quantity-display">(1개)</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="purchase-buttons">
                        <div class="item12" id="itemContainer">       
                               <div class="link30">
                               <button id="buyBtn" class="strong-b1" data-prodno="${productView.prodNo}">
								    B U Y
								</button>
							</div>
                        </div>
                        <div class="item13">
                                <form action="add.jsp" method="post" onsubmit="return handleSubmit(event);">
							        <input type="hidden" name="prodNo" value="<%= productView.getProdNo() %>">
							        <input type="hidden" name="userNo" value="<%= userNo %>">
							        <input type="hidden" name="baskAmt" value="1">
							        <button type="submit">장바구니 추가</button>
							    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </main>
    <div id="c"></div>
    </div>
    <img class="prodImgPath" alt="" src="./image/${productView.prodImgPath}" />
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
