<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.MyOrderProduct"%>
<%@page import="java.util.List"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/orders.css" />
    <link rel="stylesheet" href="./css/global.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/check_login.js" ></script>
    <script src="js/user_orders.js"></script>
</head>
<body>
    <div class="screen-desktop">
    	<jsp:include page="header.jsp"></jsp:include>
        <section class="section-class">
            <div class="form-container">
                <div class="header-container">
                    <div class="title-container">
                        <div class="title-detail-container">
                            <div class="strong-wrapper">
                                <h3 class="strong-title">MY ORDER</h3>
                            </div>
                            <div class="detail-title">나의 주문 내역</div>
                        </div>
                        <div class="horizontal-divider-frame">
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <div class="orders-list-container">
                    <ul class="tab-menu">
					    <li class="tab active" data-title="주문 상품 정보" data-subtitle="/ 아래 주문 상품 정보을(를) 확인하세요." data-ordstatus="주문완료">주문내역조회 (<span id="recentOrdersAmt">${myOrderSuccessCnt}</span>)</li>
					    <li class="tab" data-title="취소/반품/교환" data-subtitle="/ 아래 취소/반품/교환을(를) 확인하세요." data-ordstatus="주문취소">취소/반품/교환 내역 (<span id="cancelOrdersAmt">${myOrderCancelCnt}</span>)</li>
					    <li class="tab" data-title="이전 주문 내역" data-subtitle="과거 주문 내역들을 조회할 수 있습니다." data-ordstatus="과거이력">과거주문내역 (<span id="beforeOrdersAmt">0</span>)</li>
					</ul>
                </div>
                <div class="order-list-info">
                    <div class="info-icon">
                        <img src="./image/order-icon.png" alt="주문 아이콘">
                    </div>
                    <div class="info-content">
                        <div class="info-title">
                            <img src="./image/order-info-icon.png" alt="info-icon" />
                            <h3 class="info-title-label">주문 안내 및 기간설정</h3>
                        </div>
                        <ul class="info-list">
                            <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</li>
                            <li>완료 후 36개월 이상 경과한 주문은 [과거주문내역]에서 확인할 수 있습니다.</li>
                            <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                            <li>취소/교환/반품 신청은 배송완료일 기준 7일까지만 가능합니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="order-info-container">
                    <div class="order-title">
                        <p></p>
                        <span class="span-title-subtext"></span>
                    </div>
                    <table class="orders-table">
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 93px;">
                            <col>
                            <col style="width: 61px;">
                            <col style="width: 150px;">
                            <col style="width: 150px;">
                            <col style="width: 150px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">주문일자 / 주문번호</th>
                                <th scope="col">이미지</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">수량</th>
                                <th scope="col">상품구매금액</th>
                                <th scope="col">주문처리상태</th>
                                <th scope="col">취소/교환/반품</th>
                            </tr>
                        </thead>
                        <tbody class="order-tbody">
                            <!-- 주문 항목 리스트가 있을 경우 -->
					        <c:forEach var="orderProduct" items="${myOrderProductList}">
					            <tr class="orders-tr">
					                <td>${orderProduct.ordDate} / ${orderProduct.ordNo}</td>
					                <td><img src="/catshap/image/${orderProduct.prodImgPath}" alt="${orderProduct.ordDescript} 이미지" width="100" height="100"></td>
					                <td>${orderProduct.ordDescript}</td>
					                <td>${orderProduct.ordProdAmt}</td>
					                <td>${orderProduct.ordProdPrice} 원</td>
					                <td>${orderProduct.ordStatus}</td>
					                <td>
					                    <button id="orderCancelBtn" class="orderCancelBtn">취소/교환/반품</button>
					                </td>
					            </tr>
					        </c:forEach>
                        </tbody>
                    </table>
                    <!-- 주문 내역이 없을 경우 -->
					<c:if test="${empty myOrderProductList}">
					    <div class="order-table-none" style="display: none;">
					        <img src="./image/order-empty-icon.png" alt="order-icon" />
					        <p>주문 내역이 없습니다.</p>
					    </div>
					</c:if>
                </div>
                <div class="paging-container">
                    <ul id="paging" class="paging-list"></ul>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>