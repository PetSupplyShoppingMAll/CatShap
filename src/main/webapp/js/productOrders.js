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
			// 결제 진행
        	requestPay();
        	
	        const formData = {
	            delReciPient: $('#delReciPient').val(),
	            delMailAddress: $('#umailAddress').val(),
	            delAddress: $('#uaddress').val(),
	            delDetailAddress: $('#delDetailAddress').val(),
	            delRecPhone: $('#delRecPhone').val(),
	            delRequest: $('#delRequest').val()
	        };   
	        console.log(formData);	
		}
		
        // AJAX 요청을 보내서 서버로 데이터를 전송
        /*$.ajax({
            type: 'POST',
            url: '/catshap/pay',
            data: $.param(formData), // 데이터 URL 인코딩
            contentType: 'application/x-www-form-urlencoded; charset=utf-8', // 요청 데이터 형식 설정
            success: function (response) {
                alert('등록이 완료되었습니다!');
            },
            error: function (xhr, status, error) {
                alert('등록 중 오류가 발생했습니다. 다시 시도해 주세요.');
            }
        });
        */
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

// 결제 메소드
const requestPay = () => {
    IMP.init('가맹점 식별코드'); // 가맹점 식별코드
    IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid: "200",   // 주문번호
        name: "냥샵 결제",
        amount: 20000,                         // 숫자 타입
        buyer_email: "gildong@example.com",
        buyer_name: "홍길동",
        buyer_tel: "010-1234-5678",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        console.log(rsp);
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            alert(msg);
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
        }
    });
}
