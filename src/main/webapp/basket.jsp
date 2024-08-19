<%@page import="catshap.butler.bean.Basket"%>
<%@page import="java.util.List"%>
<%@page import="catshap.butler.dao.BasketDao"%>
<%@page import="catshap.butler.interfaces.BasketInterface"%>
<%@page import="catshap.butler.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%
	response.setCharacterEncoding("UTF-8");

	Users user = (Users) session.getAttribute("user");
	int userNo = (user != null) ? user.getUserNo() : 0;
	BasketInterface bi = new BasketDao();
	List<Basket> basketList = bi.listBasket(userNo);
	
	pageContext.setAttribute("basketList", basketList);
	
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/index.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="./js/check_login.js"></script>
	<script src="./js/basket.js"></script>
	<style>
    ul {
        list-style-type: none;
        padding: 30px;
        width: 100%;
        margin-right: 300px;
    }

    ul li {
        display: flex;
        align-items: center;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    ul li.header {
        background-color: var(--color-mediumaquamarine);
        color: white;
        font-weight: bold;
        gap: 100px;
    }

    ul li.header div {
        flex: 1;
        text-align: center;
    }

    ul li div {
        flex: 1;
        text-align: center;
    }

    ul li:nth-child(even) {
        background-color: #f9f9f9;
    }

    ul li:hover {
        background-color: #f1f1f1;
    }

    .input1 {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .decrease-btn, .increase-btn {
        padding: 5px 10px;
        border: none;
        background-color: var(--color-mediumaquamarine);
        color: white;
        cursor: pointer;
        border-radius: 3px;
    }

    .decrease-btn:hover, .increase-btn:hover {
        background-color: #45a049;
    }

    .number-display {
        width: 50px;
        text-align: center;
        border: 1px solid #ddd;
        margin: 0 5px;
    }

    .quantity-display {
        font-weight: bold;
    }

    #submitSelectedOrder, #submitAllOrder {
        padding: 10px 20px;
        background-color: var(--color-mediumaquamarine);
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin: 5px;
    }

    #submitSelectedOrder:hover, #submitAllOrder:hover {
        background-color: #45a049;
    }

    a {
        color: #FF5722;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .product-price, .total-price {
        font-weight: bold;
    }

    #allcheckbox {
        cursor: pointer;
    }

    .product-checkbox {
        cursor: pointer;
    }
    .c-01-inner{
    	margin:30px auto 0px;
    }
    .cart-info-background-parent{
    	margin:0 auto;
    }
</style>
  </head>
  <body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="c-01">
      <div class="item"></div>
      <div class="item1"></div>
      <section class="c-01-inner">
        <div class="frame-parent">
          <div class="frame-wrapper">
            <div class="frame-group">
              <div class="frame-container">
                <div class="frame-div">
                  <div class="frame-parent1">
                    <div class="strong-my-cart-parent">
                      <h2 class="strong-my">MY CART</h2>
                      <div class="wrapper">
                        <div class="div">나의 · 장바구니</div>
                      </div>
                    </div>
                    <div class="horizontal-divider-wrapper">
                      <div class="horizontal-divider"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="order-status-link-wrapper">
                <div class="order-status-link">
                  <div class="parent">
                    <b class="b">01. 장바구니  </b>
                    <div class="background">
                      <b class="now">now</b>
                    </div>
                  </div>
                  <div class="link-02-wrapper">
                    <div class="link-02">02. 주문서 작성</div>
                  </div>
                  <div class="link-03-wrapper">
                    <div class="link-03">03. 결제완료</div>
                  </div>
                  <div class="link-04">04. 주문완료</div>
                </div>
              </div>
            </div>
          </div>
          <div class="frame-wrapper1">
            <div class="horizontal-divider-parent">
              <div class="horizontal-divider1"></div>
              <div class="horizontal-divider2"></div>
            </div>
          </div>
          <div class="frame-wrapper2">
            <div class="shop-info-content-parent">
              <div class="shop-info-content">
                <div class="border">
                  <div class="support-info">
                    <div class="container-wrapper">
                      <img
                        class="container-icon"
                        loading="lazy"
                        alt=""
                        src="/catshap/image/iii2.png"
                      />
                    </div>
                    <div class="vertical-divider-parent">
                      <div class="vertical-divider"></div>
                      <div class="login-info-parent">
                        <div class="login-info">
                          <div class="div3">
                            저희 쇼핑몰을 이용해 주셔서 감사합니다.
                          </div>
                          <div class="div4">
                            <span>
                              <span>로그인</span>
                              <span class="span"> 을 하시면 </span>
                              <span>다양한 혜택</span>
                              <span class="span1"> 을 확인할 수 있습니다.</span>
                            </span>
                          </div>
                        </div>
                        <div class="separator-parent">
                          <img
                            class="separator-icon"
                            loading="lazy"
                            alt=""
                            src="./public/separator.svg"
                          />

                          <div class="frame-parent2">
                            <div class="background-wrapper">
                              <div class="background1">
                                <img
                                  class="circlesvg-fill-icon"
                                  alt=""
                                  src="./public/circlesvg-fill.svg"
                                />

                                <div class="div5">|</div>
                              </div>
                            </div>
                            <div class="div6">
                              <span class="txt">
                                <span>궁금한점은 </span>
                                <span class="span2">게시판</span>
                                <span>으로 문의주세요.</span>
                              </span>
                            </div>
                          </div>
                          <img
                            class="separator-icon1"
                            loading="lazy"
                            alt=""
                            src="./public/separator-1.svg"
                          />
                        </div>
                        <div class="user-info">
                          <div class="item-link">
                            <div class="div7">가용 적립금  </div>
                          </div>
                          <div class="item-link1">
                            <div class="div8">마일리지  </div>
                          </div>
                          <div class="item-link2">
                            <div class="div9">쿠폰  </div>
                          </div>
                        </div>
                      </div>
                      <div class="vertical-divider-wrapper">
                        <div class="vertical-divider1"></div>
                      </div>
                    </div>
                    <div class="support-info-inner">
                      <div class="ddb5f2541png-parent">
                        <img
                          class="ddb5f2541png-icon"
                          loading="lazy"
                          alt=""
                          src="/catshap/image/iii3.png"
                        />

                        <div class="frame">
                          <div class="div10">고객센터</div>
                        </div>
                      </div>
                    </div>
                    <div class="delivery-info-wrapper">
                      <div class="delivery-info">
                        <div class="delivery-info-content">
                          <div class="vertical-divider2"></div>
                        </div>
                        <div class="delivery-info-content1">
                          <div class="e229a30png-parent">
                            <img
                              class="e229a30png-icon"
                              loading="lazy"
                              alt=""
                              src="/catshap/image/iii4.png"
                            />

                            <div class="wrapper1">
                              <div class="div11">배송조회</div>
                            </div>
                          </div>
                        </div>
                        <div class="delivery-info-content2">
                          <div class="vertical-divider3"></div>
                        </div>
                        <div class="delivery-info-content3">
                          <div class="e8d6f0575png-parent">
                            <img
                              class="e8d6f0575png-icon"
                              loading="lazy"
                              alt=""
                              src="/catshap/image/iii5.png"
                            />

                            <div class="wrapper2">
                              <div class="div12">상품문의</div>
                            </div>
                          </div>
                        </div>
                        <div class="vertical-divider4"></div>
                      </div>
                    </div>
                    <div class="support-info-child">
                      <div class="f7a406fccpng-parent">
                        <img
                          class="f7a406fccpng-icon"
                          loading="lazy"
                          alt=""
                          src="/catshap/image/iii6.png"
                        />

                        <div class="wrapper3">
                          <div class="div13">상품후기</div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="container1">
                    <img
                      class="backgroundshadow-icon"
                      loading="lazy"
                      alt=""
                      src=""
                    />
                  </div>
                </div>
                <div class="item2">
                  <div class="background-container">
                    <div class="background2">
                      <div class="div14">0</div>
                    </div>
                  </div>
                  <div class="delivery-info-item">
                    <div class="icon-frame">
                      <img
                        class="icon2"
                        loading="lazy"
                        alt=""
                        src="./public/icon-2.svg"
                      />
                    </div>
                    <div class="div15">   국내배송상품</div>
                  </div>
                </div>
              </div>
              
<form id="orderForm" action="productOrdersProc.jsp?purchaseType=basket" method="post">
    <input type="hidden" name="userno" value="<%= userNo %>">

    <ul>
        <li class="header">
            <div><input type="checkbox" id="allcheckbox" /></div>
            <div>번호</div>
            <div>제품 이미지</div>
            <div>제품 이름</div>
            <div>가격</div>
            <div>총가격</div>
            <div>수량</div>
            <div>총수량</div>
            <div>선택</div>
        </li>

        <c:forEach var="basket" items="${basketList}">
            <li class="product-row">
                <div><input type="checkbox" class="product-checkbox" value="${basket.basketNo}" 
                       data-prodno="${basket.prodNo}" data-price="${basket.prodPrice}"
                       data-prodimgpath="${basket.prodimgpath}" data-proddescript="${basket.proddescript}">
				</div>
				<div class="product-number">${basket.prodNo}</div>
                <div><img src="/catshap/image/${basket.prodimgpath}" /></div>
                <div>${basket.proddescript}</div>
                <div class="product-price">${basket.prodPrice}원</div>
                <div class="total-price">0원</div>
                <div class="input1">
                    <button type="button" class="decrease-btn">-</button>
                    <div class="input-field number-display">1</div>
                    <button type="button" class="increase-btn">+</button>
                </div>
                <div class="quantity-display">(1개)</div>
                <div><a href="basketDelete.jsp?basketNo=${basket.basketNo}">[삭제]</a></div>
            </li>
        </c:forEach>
    </ul>
    <button type="button" id="submitSelectedOrder">[선택상품 주문하기]</button>
</form>
            </div>
          </div>
        </div>
      </section>
      <section class="cart-info-background-parent">
        <footer class="cart-info-background"></footer>
        <div class="border-wrapper">
          <div class="border1">
            <img
              class="item-icon"
              loading="lazy"
              alt=""
              src="/catshap/image/iii1.png"
            />

            <div class="vertical-divider5"></div>
            <div class="cart-info">
              <div class="info-title">
                <div class="icon-title">
                  <div class="info-icon">
                    <img
                      class="icon6"
                      loading="lazy"
                      alt=""
                      src="./public/icon-6.svg"
                    />
                  </div>
                  <b class="b1">   장바구니 이용안내</b>
                </div>
                <img
                  class="separator-icon2"
                  loading="lazy"
                  alt=""
                  src="./public/separator-2.svg"
                />

                <div class="delivery-info1">
                  <div class="group">
                    <div class="div19">
                      해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니
                      장바구니 별로 따로 결제해 주시기 바랍니다.
                    </div>
                    <div class="delivery-content">
                      <div class="div20">
                        해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가
                        해외배송 장바구니로 이동하여 결제하실 수 있습니다.
                      </div>
                    </div>
                    <div class="div21">
                      선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경]
                      버튼을 누르시면 됩니다.
                    </div>
                    <div class="delivery-content1">
                      <div class="div22">
                        [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수
                        있습니다.
                      </div>
                    </div>
                    <div class="delivery-content2">
                      <div class="div23">
                        장바구니와 관심상품을 이용하여 원하시는 상품만
                        주문하거나 관심상품으로 등록하실 수 있습니다.
                      </div>
                    </div>
                    <div class="delivery-content3">
                      <div class="div24">
                        파일첨부 옵션은 동일상품을 장바구니에 추가할 경우
                        마지막에 업로드 한 파일로 교체됩니다.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="installment-info">
                <div class="installment-title">
                  <div class="dollar-icon">
                    <img
                      class="icon7"
                      loading="lazy"
                      alt=""
                      src="./public/icon-7.svg"
                    />
                  </div>
                  <b class="b2">   무이자할부 이용안내</b>
                </div>

                <div class="installment-details">
                  <div class="parent1">
                    <div class="div25">
                      상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만
                      선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.
                    </div>
                    <div class="installment-content">
                      <div class="div26">
                        [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이
                        선택된 모든 상품에 대한 주문/결제가 이루어집니다.
                      </div>
                    </div>
                    <div class="div27">
                      단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부
                      혜택을 받으실 수 없습니다.
                    </div>
                    <div class="installment-content1">
                      <div class="div28">
                        무이자할부 상품은 장바구니에서 별도 무이자할부 상품
                        영역에 표시되어, 무이자할부 상품 기준으로 배송비가
                        표시됩니다.
                      </div>
                    </div>
                    <div class="installment-content2">
                      <div class="div29">
                        실제 배송비는 함께 주문하는 상품에 따라 적용되오니
                        주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    <script>
      var linkContainer = document.getElementById("linkContainer");
      if (linkContainer) {
        linkContainer.addEventListener("click", function (e) {
          window.location.href = "./frame.html";
        });
      }
      
      var linkContainer1 = document.getElementById("linkContainer1");
      if (linkContainer1) {
        linkContainer1.addEventListener("click", function (e) {
          window.location.href = "./frame.html";
        });
      }
      </script>
  </body>
  </html>