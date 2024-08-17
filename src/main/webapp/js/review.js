$(document).ready(function() {
	
      // 전체보기 버튼 클릭 이벤트
    $('#viewAllBtn').on('click', function() {
        const $fullImage = $('#fullImage');

        if ($fullImage.css('height') === '900px') {
            $fullImage.css('height', 'auto'); // 이미지 전체를 표시
            $(this).text('닫기'); // 버튼 텍스트 변경
        } else {
            $fullImage.css('height', '900px'); // 이미지 높이를 다시 900px로 설정
            $(this).text('전체보기'); // 버튼 텍스트 변경
        }
    });



    // prodNo input 요소를 선택하고 값을 페이지에 표시
    const prodNoValue = $('#prodNo').val();
    $('#displayProdNo').text("Product Number: " + prodNoValue);

    // 페이지 로드 시 저장된 스크롤 위치로 이동
    const scrollPosition = localStorage.getItem('scrollPosition');
    if (scrollPosition) {
        $(window).scrollTop(parseInt(scrollPosition, 10));
        localStorage.removeItem('scrollPosition');
    }

    // 스크롤 위치 저장
    $(window).on('beforeunload', function() {
        localStorage.setItem('scrollPosition', $(window).scrollTop());
    });

    // 모달 관련 코드
    const $modal = $('#reviewModal');
    const $openModalButton = $('#reviewBtn');

    // 모달 열기
    $openModalButton.on('click', function() {
        $modal.show();
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    $modal.on('click', '.close', function () {
        $modal.hide();
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).on('click', function (event) {
        if ($(event.target).is($modal)) {
            $modal.hide();
        }
    });

    // 리뷰 제출
    $('#submitReview').on('click', function(event) {
        event.preventDefault(); // 폼 제출 기본 동작 방지
        checkLoginStatus(function() {
            // 폼 데이터 가져오기
            const prodNo = $('#prodNo').val();
            const userNo = $('#userNo').val();
            const revTitle = $('#revTitle').val();
            const revText = $('#revText').val();
            const revScore = $('#revScore').val();

            // 값 콘솔에 출력하기
            console.log('prodNo:', prodNo);
            console.log('userNo:', userNo);
            console.log('revTitle:', revTitle);
            console.log('revText:', revText);
            console.log('revScore:', revScore);

            // 필수 필드가 비어있는지 확인
            if (!userNo || !prodNo || !revTitle || !revText || isNaN(revScore) || revScore <= 0) {
                $('#message').text('모든 필드를 올바르게 입력하세요.');
                return;
            }

            // AJAX 요청
            $.ajax({
                url: '/catshap/RegistReview',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    prodNo: prodNo,
                    userNo: userNo,
                    revTitle: revTitle,
                    revText: revText,
                    revScore: revScore // 숫자로 변환
                }),
                success: function(data) {
                    if (data.success) {
                        $('#message').text('리뷰가 성공적으로 제출되었습니다!');
                        $modal.hide(); // 모달 닫기
                    } else {
                        $('#message').text('리뷰 제출에 실패했습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    $('#message').text('오류: ' + error);
                }
            });
        });
    });

    // 로그인 상태 확인
    function checkLoginStatus(callback) {
        $.ajax({
            url: '/catshap/check-login-status',
            method: 'GET',
            dataType: 'json',
            success: function(response) {
                if (!response.loggedIn) {
                    alert('로그인 정보가 없습니다. 로그인 페이지로 이동합니다.');
                    window.location.href = '/catshap/user_login.jsp'; // 로그인 페이지로 리디렉션
                } else {
                    callback(); // 로그인 상태가 유효하면 콜백 함수 호출
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error checking login status:', textStatus, errorThrown);
            }
        });
    }
});
