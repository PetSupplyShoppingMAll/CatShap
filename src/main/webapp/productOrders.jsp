<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.ProductView"%>
<%@page import="catshap.butler.dao.ProductViewDao"%>
<%@page import="catshap.butler.interfaces.ProductViewInterface"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="catshap.butler.interfaces.ProductInterface"%>
<%@page import="catshap.butler.dao.ProductDao"%>
<%@page import="catshap.butler.bean.Product"%>
<%@page import="catshap.butler.bean.OrderProduct"%>
<%@page import="java.util.List"%>
<%@page import="catshap.butler.dao.OrdersDao"%>
<%@page import="catshap.butler.interfaces.OrdersInterface"%>
<%@page import="catshap.butler.bean.Users"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	Users user = (Users)session.getAttribute("user");
	int userNo = user.getUserNo();
	
	OrdersInterface oi = new OrdersDao();
	ProductInterface pi = new ProductDao();
	ProductViewInterface pvi = new ProductViewDao();
	
	List<OrderProduct> orderProductList = oi.getOrderProductList(userNo);
	int orderProductPrice = oi.getOrderProductPrice(userNo);
	
	Map<Integer, Product> productMap = new HashMap<>();
	Map<Integer, ProductView> productViewMap = new HashMap<>();
	
    for (OrderProduct orderProduct : orderProductList) {
        int prodNo = orderProduct.getProdNo();
        Product product = pi.selectProduct(prodNo);
        productMap.put(prodNo, product);
        ProductView productView = pvi.getProduct(prodNo);
        productViewMap.put(prodNo, productView);
    }
	request.setAttribute("orderProductList", orderProductList);
	request.setAttribute("productMap", productMap);
	request.setAttribute("productViewMap", productViewMap);
	request.setAttribute("orderProductPrice", orderProductPrice);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catshap Orders</title>
    <link rel="stylesheet" href="./css/productOrders.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="./js/user_regex.js"></script>
    <script src="./js/daumAddress.js"></script>
    <script src="./js/productOrders.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
    <main id="main">
        <form id="paymentForm" action="/pay" method="post">
            <p class="pay">주문/결제</p>
            <section id="main1">
                <div id="main1Wrapper">
                    <div class="main1_1 title" id="title1" data-target="content1">
                        <b>배송지</b>
                        <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
                    </div>
                    <div id="content1" class="content">
                        <div class="row36">
                            <div class="input-label-container">
                                <div class="div331">받는사람</div>
                                <div class="input-icon-container">
                                    <img class="join_icon2" alt="" src="./image/join_icon2.svg" />
                                </div>
                            </div>
                            <div class="input19">
                                <input class="container51" id="delReciPient" name="delrecipient"
                                    value=<%=user.getUname()%>
                                readOnly />
                            </div>
                        </div>
                        <div class="main1_3">
                            <div class="row-inner11">
                                <div class="parent17">
                                    <div class="div331">우편번호</div>
                                    <div class="input-icon-container">
                                        <img class="join_icon2" alt="" src="./image/join_icon2.svg" />
                                    </div>
                                </div>
                            </div>
                            <div class="input12">
                                <input class="container44" id="umailAddress" name="umailAddress" placeholder="우편번호"
                                    type="text" />
                            </div>
                            <button class="input14" id="addressSearchButton" type="button">
                                <div class="container47">
                                    <div class="search-check">address search</div>
                                </div>
                            </button>
                        </div>
                        <p id="umailAddress-error" class="error-message" style="display: none;"></p>
                        <div class="row36">
                            <div class="input-label-container">
                                <div class="div331">주소</div>
                                <div class="input-icon-container">
                                    <img class="join_icon2" alt="" src="./image/join_icon2.svg" />
                                </div>
                            </div>
                            <div class="input19">
                                <input class="container51" id="uaddress" name="uaddress" 
                                	placeholder="주소" type="text" />
                            </div>
                        </div>
                        <p id="uaddress-error" class="error-message" style="display: none;"></p>
                        <div class="row36">
                            <div class="input-label-container">
                                <div class="div331">상세주소</div>
                            </div>
                            <div class="input19">
                                <input class="container51" id="delDetailAddress" name="udetailAddress"
                                    placeholder="상세주소" type="text" />
                            </div>
                        </div>
                        <div class="row31">
                            <div class="row-inner11">
                                <div class="parent17">
                                    <div class="div331">휴대전화</div>
                                    <div class="input-icon-container">
                                        <img class="join_icon2" alt="" src="./image/join_icon2.svg" />
                                    </div>
                                </div>
                            </div>
                            <div class="input13">
                                <select id="delRecPhoneComp" name="delRecPhoneComp" class="container45">
                                    <option value="">선택</option>
                                    <option value="LG">LG</option>
                                    <option value="SK">SK</option>
                                    <option value="KT">KT</option>
                                </select>
                            </div>
                            <div class="input12">
                                <input class="container44" id="delRecPhone" name="delRecPhone" placeholder="01000000000"
                                    type="text" maxLength=11 />
                            </div>
                        </div>
                        <span id="delRecPhone-error" class="error-message"></span>
                        <div class="row36">
                            <div class="input-label-container">
                                <div class="div331">배송메세지</div>
                            </div>
                            <div class="input19">
                            	<select id="delRequest" name="delRequest" class="container51">
                                    <option value="drq1">--메시지 선택 (선택사항) --</option>
                                    <option value="drq2">배송 전에 미리 연락바랍니다.</option>
                                    <option value="drq3">부재시 경비실에 맡겨주세요.</option>
                                    <option value="drq4">부재시 문 앞에 놓아주세요.</option>
                                    <option value="drq5">빠른 배송 부탁드립니다.</option>
                                    <option value="drq6">택배함에 보관해 주세요.</option>
                                    <option value="drq7">직접 입력</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="main2">
                <div class="main2_1 title" id="title2" data-target="content2">
                    <b>주문상품</b>
                    <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
                </div>
                <div id="content2" class="content">
                    <div class="main2_2">
                       <c:forEach var="orderProduct" items="${orderProductList}">
                           <a href="#" class="product-title-img">
                               <c:set var="productView" value="${productViewMap[orderProduct.prodNo]}" />
                               <img src="${productView.prodImgPath}" alt="${productView.prodDescript} 이미지" />
                           </a>
                        <div class="main2_2text">
                           <c:set var="product" value="${productMap[orderProduct.prodNo]}" />
                           <p>상품명: ${product.prodDescript}</p>
                           <p>수량:${orderProduct.ordProdAmt}개</p>
                           <p>${orderProduct.ordProdPrice}원</p>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <div class="main2_3 endtitle">
                <p>배송비</p>
                <b>3,000원</b>
            </div>
            <section id="main3">
                <div class="main3_1 title" id="title3" data-target="content3">
                    <b>결제정보</b>
                    <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
                </div>
                <div id="content3" class="content">
                    <div class="middletext">
                        <p>주문상품</p>
                        <b>${orderProductPrice}원</b>
                    </div>
                    <div class="middletext">
                        <p>배송비</p>
                        <b>+3.000원</b>
                    </div>
                    <div class="middletext">
                        <p>할인/부가결제</p>
                        <b><span>0</span>원</b>
                    </div>
                </div>
            </section>
            <div class="main3_2 endtitle">
                <b>최종 결제 금액</b>
                <b>${orderProductPrice + 3000}원</b>
            </div>
            <section id="main4">
                <div class="main4_1 title" id="title4" data-target="content4">
                    <b>결제정보</b>
                    <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
                </div>
                <div id="payCard" class="content">
                    <div class="main4div">
                        <div class="middletext">
                            <p>카드선택</p>
                            <select>         
                                <option>간편결제</option>
                            </select>
                        </div>
                        <div id="payment" class="middletext">
                            <p>할부기간</p>
                            <select>
                                <option>일시불</option>
                            </select>
                        </div>
                        <p class="main4text">법인카드는 무이자 할부 적용이 되지 않습니다.</p>
                        <div class="middletext main4div2">
                            <p>결제 안내</p>
                            <input class="btn" type="button" value="공인 인증서 발급안내" />
                            <input class="btn" type="button" value="안심클릭 안내" />
                            <input class="btn" type="button" value="안전결제(ISP) 안내" />
                        </div>
                        <p class="main4text">- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                    </div>
                </div>
            </section>
            <section id="main5">
                <div class="main5_1 title" id="title5" data-target="content5">
                    <input class="main5check" id="allcheckbox" type="checkbox" />
                    <b>모든 약관 동의</b>
                    <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
                </div>
                <div id="content5" class="content">
                    <div class="middletext2">
                        <input id="agreePayCheck" type="checkbox" />
                        <span>[필수]</span>
                        <p>결제대행서비스 약관 동의</p>
                        <input id="agreePayCheckBtn" type="button" value=">" />
                    </div>
                    <div class="middletext2">
                        <input id="agreeShopCheck" type="checkbox" />
                        <span>[필수]</span>
                        <p>쇼핑몰 이용약관 동의</p>
                        <input id="agreeShopCheckBtn" type="button" value=">" />
                    </div>
                    <div class="middletext2">
                        <input id="agreeUserCheck" type="checkbox" />
                        <span>[필수]</span>
                        <p>개인정보 수집 및 이용 동의</p>
                        <input id="agreeUserCheckBtn" type="button" value=">" />
                    </div>
                </div>
            </section>
            <button id="payBtn" type="submit" class="main5a">${orderProductPrice + 3000}원 결제하기</button>
            <section id="main6">
                <p>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우
                    장바구니에서 무이자 할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
                <p>- 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
            </section>
        </form>
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
    <div id="event">
        <span>X</span>
        <p>
            [ 개인정보 수집 및 이용 동의 ]
            <br /><br />
            1. 개인정보의 수집 및 이용 목적
            - 고객 서비스 제공
            - 상품 및 서비스 안내
            <br />
            2. 수집하는 개인정보 항목
            - 이름, 연락처, 이메일 등
            <br />
            3. 개인정보의 보유 및 이용 기간
            - 서비스 이용 기간 동안 보유
            <br />
            4. 개인정보의 제3자 제공
            - 제3자에게 제공하지 않음
            <br />
            5. 개인정보의 안전성 확보 조치
            - 암호화 및 접근 제어
            <br />
            6. 고객의 권리와 그 행사 방법
            - 개인정보 조회 및 수정 가능
            <br />
            7. 개인정보 보호 책임자
            - 연락처 및 이메일 주소
            <br /><br />
            [냥#]
            주소: [코리아 IT 아카데미 역삼점 3층 인베디드A]<br />
            연락처: [010-1234-5678]<br />
            이메일: [이메일]
            <br /><br />
            제정일: 2024년 [8월] [8일]
        </p>
    </div>
</body>
</html>