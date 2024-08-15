$(document).ready(function () {
    // 안내 팝업창
    $("#agreeUserCheckBtn").click(() => {
        $("#event").show();
    });

    $("#event span").click(() => {
        $("#event").hide();
    });

    // 타이틀 클릭 시 위로 올라가게 하기
    $('.title').click(function () {
        const targetId = $(this).data('target');
        $(`#${targetId}`).toggleClass('hidden');
    });

    // 체크 박스 클릭 시 모두 클릭하기
    $('#allcheckbox').change(function () {
        const isChecked = $(this).is(':checked');
        $('#agreePayCheck, #agreeShopCheck, #agreeUserCheck').prop('checked', isChecked);
    });

    // 결제하기 버튼 클릭한 경우
    $('#payBtn').on('click', (e) => {
        e.preventDefault();

        const isDeliveryValid = validateDelivery();
        const isAgreeCheckValid = validateAgreeCheck();
        if (isDeliveryValid && isAgreeCheckValid) {

            registOrders();
        }
    });
});

// 배송지 유효성 검사 메소드
const validateDelivery = () => {
    const isMailAddressValid = validateField('#umailAddress', '#umailAddress-error', '우편 주소를 입력해주세요.');
    const isDetailAddressValid = validateField('#uaddress', '#uaddress-error', '주소를 입력해주세요.');
    const isRecPhoneValid = validateField('#delRecPhone', '#delRecPhone-error', '전화번호를 입력해주세요.');

    return isMailAddressValid && isDetailAddressValid && isRecPhoneValid;
}

// 체크 유효성 검사 메소드
const validateAgreeCheck = () => {
    // 체크박스가 모두 체크되었는지 확인
    const isAgreePayCheck = $('#agreePayCheck').is(':checked');
    const isAgreeShopCheck = $('#agreeShopCheck').is(':checked');
    const isAgreeUserCheck = $('#agreeUserCheck').is(':checked');

    // 모든 체크박스가 체크되었는지 확인
    if (!isAgreePayCheck || !isAgreeShopCheck || !isAgreeUserCheck) {
        alert('모든 약관에 동의해야 결제할 수 있습니다.');
        return false;
    }
    return true;
}

// 결제 전 주문 추가 메소드
const registOrders = () => {
    const prodTotalPrice = $('input[name="prodTotalPrice"]').val()
    $.ajax({
        type: 'POST',
        url: '/catshap/orders/register', // 서블릿 URL
        data: {
            prodTotalPrice: prodTotalPrice
        },
        success: function (response) {
            const formData = {
                delReciPient: $('#delReciPient').val(),
                delMailAddress: $('#umailAddress').val(),
                delAddress: $('#uaddress').val(),
                delDetailAddress: $('#delDetailAddress').val(),
                delRecPhone: $('#delRecPhone').val(),
                delRequest: $('#delRequest option:selected').text()
            };
            const email = response.email;
            const orders = {
                ordNo: response.ordNo,
                ordProdPrice: prodTotalPrice
            };
            const prodDescript = $('input[name="prodDescript"]').val();

            // 결제 진행
            requestPay(formData, orders, prodDescript, email);
        },
        error: function () {
            console.error('주문 등록 실패:', error);
            alert('등록 중 오류가 발생했습니다. 다시 시도해 주세요.');
        }
    });
}

// 결제 메소드
const requestPay = (formData, orders, prodDescript, email) => {
    IMP.init('가맹점 식별코드'); // 가맹점 식별코드
    IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid: orders.ordNo,   // 주문번호
        name: prodDescript,	// 주문상품명
        amount: orders.ordProdPrice, // 결제가격
        buyer_email: email,
        buyer_name: formData.delReciPient,
        buyer_tel: formData.delRecPhone,
        buyer_addr: formData.delAddress + delDetailAddress,
        buyer_postcode: formData.delMailAddress
    }, function (rsp) {
        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            alert(msg);
            updateOrdStatus(orders.ordNo, '주문완료');
            registOrderProduct(orders);
            registDelivery(formData, orders);
            registPay(orders, 'kakaopay', '0');
        } else {
            var msg = '결제에 실패하였습니다.' + rsp.error_msg;
            updateOrdStatus(orders.ordNo, '주문실패');
            alert(msg);
        }
    });
}

// 주문 상태 업데이트 메소드
const updateOrdStatus = (ordNo, status) => {
    $.ajax({
        type: 'POST',
        url: `/catshap/orders/status/${ordNo}`,
        data: {
            status: status
        },
        success: function (response) {
            if (response.success) {
            } else {
                alert("주문 상태 업데이트 실패...");
            }
        },
        error: function () {
            alert('주문 상태 업데이트 중 에러가 발생했습니다.');
        }
    });
}

// 주문 상품 내역 등록 메소드
const registOrderProduct = orders => {
    $.ajax({
        type: 'POST',
        url: '/catshap/orderProduct/register',
        data: {
            prodNo: $('input[name="prodNo"]').val(),
            ordNo: orders.ordNo,
            ordProdPrice: orders.ordProdPrice,
            ordProdAmt: $('input[name="ordProdAmt"]').val()
        },
        success: function (response) {
            if (response.success) {
            } else {
                alert("주문 상품 등록 실패...");
            }
        },
        error: function () {
            alert('주문 상품 등록 중 에러가 발생했습니다.');
        }
    });
}

// 배달 정보 내역 등록 메소드
const registDelivery = (formData, orders) => {
    $.ajax({
        type: 'POST',
        url: '/catshap/delivery/register',
        data: {
            ordNo: orders.ordNo,
            delMailAddress: formData.delAddress,
            delAddress: formData.delAddress,
            delDetailAddress: formData.delDetailAddress,
            delReciPient: formData.delReciPient,
            delRecPhone: formData.delRecPhone,
            delRequest: formData.delRequest
        },
        success: function (response) {
            if (response.success) {
            } else {
                alert("배달 정보 등록 실패...");
            }
        },
        error: function () {
            alert('배달 정보 등록 중 에러가 발생했습니다.');
        }
    });
}

// 결제 내역 등록 메소드
const registPay = (orders, payCard, payMent) => {
    $.ajax({
        type: 'POST',
        url: '/catshap/pay/register',
        data: {
            ordNo: orders.ordNo,
            payCard: payCard,
            payMent: payMent
        },
        success: function (response) {
            if (response.success) {
            } else {
                alert("배달 정보 등록 실패...");
            }
        },
        error: function () {
            alert('배달 정보 등록 중 에러가 발생했습니다.');
        }
    });
}
