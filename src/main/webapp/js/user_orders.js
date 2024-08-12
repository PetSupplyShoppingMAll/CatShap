const orders = [
    /* 여기에 실제 주문 데이터 수정 필요 */
    // { orderDate: '2023-08-01', orderNumber: '123456', productName: '상품 A', quantity: 1, price: 10000, status: '배송완료' },
    // { orderDate: '2023-08-02', orderNumber: '123457', productName: '상품 B', quantity: 2, price: 20000, status: '배송중' }
];

// 한 페이지당 보여줄 주문 수
const ordersPerPage = 10;
let currentPage = 1;
const totalPages = Math.max(Math.ceil(orders.length / ordersPerPage), 1);

$(function () {
    renderOrders();
    renderPaging();
	updateOrderTitle($('.tab-menu .tab.active'));
	
    // 페이징 번호 클릭 이벤트 추가
    $('.page-link').on('click', function (event) {
        event.preventDefault();
        currentPage = parseInt($(this).text());
        renderOrders();
        renderPaging();
    });
    
    // 클릭한 메뉴 활성화
     $('.tab-menu .tab').click(function() {
		$('.tab-menu .tab').removeClass('active');
    	$(this).addClass('active');
       	updateOrderTitle($(this));
    });
    
});

// 주문내역 테이블 출력 메소드
const renderOrders = () => {
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
                            <td>${order.orderDate} / ${order.orderNumber}</td>
                            <td><img src="상품 이미지 경로" alt="이미지"></td>
                            <td>${order.productName}</td>
                            <td>${order.quantity}</td>
                            <td>${order.price}원</td>
                            <td>${order.status}</td>
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

    for (let i = 1; i <= totalPages; i++) {
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
