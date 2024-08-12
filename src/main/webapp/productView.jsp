<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.ReviewView"%>
<%@page import="catshap.butler.dao.ReviewViewDao"%>
<%@page import="catshap.butler.interfaces.ReviewViewInterface"%>
<%@page import="catshap.butler.bean.ProductView"%>
<%@page import="catshap.butler.dao.ProductViewDao"%>
<%@page import="catshap.butler.interfaces.ProductViewInterface"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<%
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		ProductViewInterface pi = new ProductViewDao();
		ProductView productView = pi.getProduct(prodNo);
		
		ReviewViewInterface ri = new ReviewViewDao();
		List<ReviewView> listReview = ri.selectReviewList(prodNo);
		
		pageContext.setAttribute("productView", productView);
		pageContext.setAttribute("listReview", listReview);
		
		pi.addCount(prodNo);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/B-02.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/ProductView.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="div63">
        <main class="container11">
            <div class="hygiene-info">
                <div class="hygiene-icon">
                    <img class="link-icon9" alt="" src="./image/link-12.svg" />
                </div>
                <div class="hygiene-icon1">
                    <img class="link-icon9" alt="" src="./image/icon-13.svg" />
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
                            <div class="item7">
                                <div class="link18">
                                    <div class="c-a-r">  C A R T</div>
                                    <div class="cart-icon">
                                        <img class="icon48" alt="" src="./image/icon-72.svg" />
                                    </div>
                                </div>
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
                                            <img class="icon49" alt="" src="./image/icon-82@2x.png" />
                                        </div>
                                    </div>
                                    <a class="a14">최종 결제금액 </a>
                                    <img class="icon50" alt="" src="./image/icon-91@2x.png" />

                                    <div class="discount-image">
                                        <img class="icon48" alt="" src="./image/icon-102.svg" />
                                    </div>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="container13">
                                    <div class="horizontal-divider4"></div>
                                    <div class="selected-option">
                                        <div class="selected-title">
                                            <img class="icon52" alt="" src="./image/icon-112@2x.png" />
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
                                                            <img class="icon53" alt="" src="./image/icon-122@2x.png" />
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
                            <img class="icon54" alt="" src="./image/icon-132@2x.png" />
                        </div>
                        <a class="strong-emphasis">0</a>
                        <div class="item-count">
                            <a class="a17">(0개)</a>
                        </div>
                    </div>
                </div>
            </div>
            <img class="icon55" alt="" src="./image/icon-141@2x.png" />
            <div class="horizontalborder-group">
            </div>
    </div>
    <div class="separator5"></div>
    <div class="backgroundshadow">
        <div class="link20">
            <div class="div79"><button onclick="goToScroll('a')" />상품정보
            </div>
        </div>
        <div class="link21">
            <div class="div80"><button onclick="goToScroll('b')" />상품후기
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
            <div class="div80"><button onclick="goToScroll('c')" />상품문의
            </div>
            <div class="tab-value-containers">
                <div class="strong">
                    <b class="colon">0</b>
                </div>
            </div>
            <div class="vertical-divider4"></div>
        </div>
        <div class="link23">
            <div class="div79"><button onclick="goToScroll('d')" />구매안내
            </div>
            <div class="vertical-divider4"></div>
        </div>
    </div>

    </div>
    <img class="separator-icon7" loading="lazy" alt="" src="./image/separator2.svg" />
    <img class="separator-icon8" loading="lazy" alt="" src="./image/separator-11.svg" />
    <img id="a" class="km1907-77jpg-icon" loading="lazy" alt="" src="./image/${productView.prodDetailImgPath}" />
    <img class="separator-icon9" loading="lazy" alt="" src="./image/separator-21.svg" />
    <h2 class="strong-review" id="b">REVIEW</h2>
    <div class="div88">
        <c:forEach var="review" items="${listReview}">
            <div>
                <div><strong>제목:</strong> ${review.revTitle}</div>
                <div><strong>닉네임:</strong> ${review.uname}</div>
                <div><strong>등록 날짜:</strong> ${review.revRegDate}</div>
                <div><strong>별점:</strong> ${review.revScore}</div>
                <div><strong>내용:</strong> ${review.revText}</div>
            </div>
            <hr />
        </c:forEach>
    </div>
    <section class="backgroundborder3">
        <div class="review-list-content">
            <div class="review-list-content-wrapper">
                <div class="empty-review-message">
                    <img class="icon57" loading="lazy" alt="" src="./image/icon-16.svg" />
                </div>
                <div class="div89">게시물이 없습니다</div>
            </div>
        </div>
        <div class="div90">지금 첫번째 게시글을 작성해보세요.</div>
    </section>
    <div class="support-and-guide" id="d">
        <div class="support">
            <div class="support-link">
                <div class="link25">
                    <div class="hygiene-icon1">
                        <img class="icon58" loading="lazy" alt="" src="./image/icon-17.svg" />
                    </div>
                    <div class="parent3">
                        <div class="div91">  고객 지원센터 바로가기  </div>
                        <div class="icon-wrapper11">
                            <img class="link-icon9" loading="lazy" alt="" src="./image/icon-18.svg" />
                        </div>
                    </div>
                </div>
                <div class="guide-link-container">
                    <div class="vertical-divider9"></div>
                </div>
                <div class="guide">
                    <div class="link26">
                        <div class="div92">스토어 가이드  </div>
                        <img class="icon60" alt="" src="./image/icon-19@2x.png" />
                    </div>
                </div>
            </div>
        </div>
        <div class="review-prompt-and-list-links">
            <div class="leave-review">
                <div class="write-review-prompt-content">
                    <div class="vertical-divider10"></div>
                    <img class="icon61" loading="lazy" alt="" src="./image/icon-20.svg" />
                </div>
            </div>
            <div class="review-prompt-and-list-links-inner">
                <div class="frame-parent15">
                    <div class="wrapper12">
                        <div class="div93">
                              상품을 구매하셨다면, 후기를 남겨주세요.
                        </div>
                    </div>
                    <div class="vertical-divider11"></div>
                </div>
            </div>
            <div class="view-all-reviews-link-containe">
                <div class="view-all-reviews-link-content">
                    <div class="link27">
                        <div class="div94">후기글 전체보기  </div>
                        <div class="reviews-link-inner-container">
                            <img class="link-icon9" loading="lazy" alt="" src="./image/icon-21.svg" />
                        </div>
                    </div>
                </div>
                <div class="vertical-divider12"></div>
            </div>
            <div class="link28" id="linkContainer">
                <div class="write-review-link">
                    <img class="icon63" loading="lazy" alt="" src="./image/icon-22.svg" />
                </div>
                <div class="div95">  상품후기 작성</div>
            </div>
        </div>
    </div>
    <div class="separator6"></div>
    <img class="separator-icon10" loading="lazy" alt="" src="./image/separator-31.svg" />
    <div class="item10"></div>
    <section class="price-summary-container-parent">
        <div class="price-summary-container">
            <div class="price-summary-inner-container">
                <img class="container-icon2" loading="lazy" alt="" src="./image/container1@2x.png" />
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
                                    <img class="circlesvg-fill-icon2" alt="" src="./image/circlesvg-fill.svg" />

                                    <div class="div107">|</div>
                                </div>
                            </div>
                            <div class="minimum-quantity-value-contain">
                                <div class="div108">주문 수량안내</div>
                                <div class="minimum-quantity-value-icon-co">
                                    <img class="icon53" alt="" src="./image/icon-25@2x.png" />
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
                                    <img class="circlesvg-fill-icon2" alt="" src="./image/circlesvg-fill.svg" />

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
                                                    <img class="link-icon10" alt="" src="./image/link-21@2x.png" />
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
                                    <img class="icon67" loading="lazy" alt="" src="./image/icon-26.svg" />

                                    <div class="div116">최종 결제금액</div>
                                    <img class="icon68" loading="lazy" alt="" src="./image/icon-27@2x.png" />

                                    <div class="link29">
                                        <div class="div117">회원혜택 </div>
                                        <img class="icon69" alt="" src="./image/icon-28@2x.png" />
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
                            <a href="buy.jsp?prodNo=${productView.prodNo}">
                                <div class="link30">
                                    <b class="strong-b1">B U Y</b>
                                </div>
                            </a>
                        </div>
                        <div class="item13">
                            <div class="link31">
                                <img class="icon71" loading="lazy" alt="" src="./image/icon-72.svg" />
                                <div class="c-a-r1">  C A R T</div>
                            </div>
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
