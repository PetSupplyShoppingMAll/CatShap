const ordersPerPage = 10;
let currentPage = 1;
let totalPages = 1;
let currentOrdStatus = ''; // 현재 선택된 주문 상태를 저장할 변수

$(function () {
    updateOrderTitle($('.tab-menu .tab.active'));
    currentOrdStatus = $('.tab-menu .tab.active').data('ordstatus'); // 초기 로드 시 현재 주문 상태 설정
    getMyOrderProductList(currentOrdStatus);
    
    // 메뉴 클릭 이벤트 추가
    $('.tab-menu .tab').click(function() {
        $('.tab-menu .tab').removeClass('active');
        $(this).addClass('active');
        updateOrderTitle($(this));
        currentOrdStatus = $(this).data('ordstatus'); // 현재 주문 상태 갱신
        currentPage = 1; // 메뉴를 변경할 때마다 페이지를 1로 초기화
        getMyOrderProductList(currentOrdStatus);
    });
});

// 주문내역 추출 메소드
const getMyOrderProductList = ordStatus => {
    $.ajax({
        type: 'GET',
        url: `/catshap/userOrdersPageProc.jsp?ordStatus=${ordStatus}`,
        dataType: 'json',
        success: function (response) {
            if (response.length > 0) {
                totalPages = Math.max(Math.ceil(response.length / ordersPerPage), 1);  // 총 페이지 수 계산
                renderOrders(response);
                renderPaging();
            } else {
                renderOrders(response);
                renderPaging();
            }
        },
        error: function () {
            alert('주문 상태 업데이트 중 에러가 발생했습니다.');
        }
    });
}

// 주문내역 테이블 출력 메소드
const renderOrders = orders => {
    const startIndex = (currentPage - 1) * ordersPerPage;
    const endIndex = Math.min(startIndex + ordersPerPage, orders.length);
    const tbody = $('.order-tbody');
    const noOrderContainer = $('.order-table-none');

    tbody.empty(); 

    if (orders.length === 0) {
        noOrderContainer.show(); 
        $('.orders-table').hide();
    } else {
        noOrderContainer.hide(); 
        $('.orders-table').show(); 

        for (let i = startIndex; i < endIndex; i++) {
            let order = orders[i];
            let row = `<tr class="orders-tr">
                            <td>${order.ordDate} / ${order.ordNo}</td>
                            <td><img src="/catshap/image/${order.prodImgPath}" alt="${order.ordDescript} 이미지"></td>
                            <td>${order.ordDescript}</td>
                            <td>${order.ordProdAmt}</td>
                            <td>${order.ordProdPrice}원</td>
                            <td>${order.ordStatus}</td>
                            <td><button id=orderCancelBtn${i + 1} class="orderCancelBtn">취소/교환/반품</button></td>
                        </tr>`;
            tbody.append(row);
        }
    }
}

// 페이징 처리 함수
const renderPaging = () => {
    const paging = $('#paging');
    paging.empty();

    for (let i = 1; i <= totalPages; i++) {
        let pageItem = `<li class="page-item ${i === currentPage ? 'active' : ''}">
                            <a href="#" class="page-link" data-page="${i}">${i}</a>
                        </li>`;
        paging.append(pageItem);
    }

    // 페이지 번호 클릭 이벤트 추가 (여기서 재바인딩)
    $('.page-link').on('click', function (event) {
        event.preventDefault();
        currentPage = parseInt($(this).data('page'));  // 현재 페이지 갱신
        getMyOrderProductList(currentOrdStatus);  // 현재 페이지에 맞는 데이터 요청
    });
}

// 선택한 메뉴별로 제목 호출 메소드
const updateOrderTitle = activeTab => {
    $('.order-title p').text(activeTab.data('title'));
    $('.order-title .span-title-subtext').text(activeTab.data('subtitle'));
}
