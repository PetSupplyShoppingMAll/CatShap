$(document).ready(function () {
    // 안내 팝업창
    $(".btn").click(() => {
        $("#event").show();
    });

    $("#event span").click(() => {
        $("#event").hide();
    });

    // 주소 검색 버튼 클릭 이벤트 핸들러
    $('#addressSearchButton').click((event) => {
        event.preventDefault();
        sample6_execDaumPostcode(event);
    });

    // 주소 검색 함수
    const sample6_execDaumPostcode = (e) => {
        e.preventDefault();

        new daum.Postcode({
            oncomplete: (data) => {
                $('#zipcode').val(data.zonecode);
                $('#address1').val(data.address);
            }
        }).open();
    };

    // 타이틀 클릭 시 위로 올라가게 하기
    $('.title').click(function () {
        const targetId = $(this).data('target');
        $(`#${targetId}`).toggleClass('hidden');
    });

    // 체크 박스 클릭 시 모두 클릭하기
    $('#allcheckbox').change(function () {
        const isChecked = $(this).is(':checked');
        $('#main5check1, #main5check2, #main5check3').prop('checked', isChecked);
    });

    // 결제하기 버튼 클릭한 경우
    $('#payBtn').on('click', (e) => {
        e.preventDefault();
        const formData = {
            delReciPient: $('#delReciPient').val(),
            delMailAddress: $('#delMailAddress').val(),
            delAddress: $('#delAddress').val(),
            delDetailAddress: $('#delDetailAddress').val(),
            delRecPhone: $('#delRecPhone').val(),
            delRequest: $('#delRequest').val()
        };

        // AJAX 요청을 보내서 서버로 데이터를 전송
        $.ajax({
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
    });
});
