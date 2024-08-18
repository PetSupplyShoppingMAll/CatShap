// 한 페이지당 보여줄 주문 수
const ordersPerPage = 10;
let currentPage = 1;
//const totalPages = Math.max(Math.ceil(orders.length / ordersPerPage), 1);

$(function () {
    renderPaging();
	updateOrderTitle($('.tab-menu .tab.active'));
	
    // 페이징 번호 클릭 이벤트 추가
    $('.page-link').on('click', function (event) {
        event.preventDefault();
        currentPage = parseInt($(this).text());
        getMyOrderProductList($(this));
    });
    
    // 클릭한 메뉴 활성화
     $('.tab-menu .tab').click(function() {
		$('.tab-menu .tab').removeClass('active');
    	$(this).addClass('active');
       	updateOrderTitle($(this));
       	getMyOrderProductList($(this).data('ordstatus'));
    });
    
});

// 현재 주문내역정보 추출 메소드
const getMyOrderProductList = ordStatus => {
	$.ajax({
        type: 'GET',
        url: `/catshap/userOrdersPageProc.jsp?ordStatus=${ordStatus}`,
        dataType: 'json',
        success: function (response) {
            if (response.length > 0) {
				renderOrders(response);
				renderPaging();
            } else {
                alert("내 주문 정보 확인 실패...");
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
        // 주문 내역이 없을 경우
        noOrderContainer.show(); 
        $('.orders-table').hide();
    } else {
        // 주문 내역이 있을 경우
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

// 해당 페이지 번호 활성화 메소드
const renderPaging = () => {
    var paging = $('#paging');
    paging.empty();

    for (let i = 1; i <= 1; i++) {
        let pageItem = `<li class="page-item ${i === currentPage ? 'active' : ''}">
                                <a href="#" class="page-link">${i}</a>
                            </li>`;
        paging.append(pageItem);
    }
}

// 선택한 메뉴별로 제목 호출 메소드
const updateOrderTitle = activeTab => {
	$('.order-title p').text(activeTab.data('title'));
    $('.order-title .span-title-subtext').text(activeTab.data('subtitle'));
}
