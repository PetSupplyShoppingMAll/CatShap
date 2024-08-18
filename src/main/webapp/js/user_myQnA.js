$(document).ready(() => {
    let qnas = []; // 전체 QnA 데이터
    let currentPage = 1; // 현재 페이지 초기화
    const pageSize = 10; // 페이지당 QnA 수

    // QnA 데이터 로드
    loadQnas();

    // 모달창 닫기 버튼 이벤트 리스너
    $('.close').click(function() {
        $('#qnaModal').hide();
    });

    // 페이지네이션 클릭 이벤트 리스너
    $(document).on('click', '.pagination a', function(event) {
        event.preventDefault();
        const page = $(this).data('page');
        if (page && page !== currentPage) {
            currentPage = page; // 현재 페이지 업데이트
            renderQnas(); // 페이지 로드
        }
    });

    // 검색 버튼 클릭 이벤트
    $('#searchButton').click(function() {
        currentPage = 1; // 검색 시 페이지를 1로 초기화
        renderQnas(); // 검색 후 렌더링
    });

    // 초기화 버튼 클릭 이벤트
    $('#resetButton').click(function() {
        $('#search_input').val('');
        currentPage = 1;
        renderQnas(); // 초기화 후 렌더링
    });

    // QnA 데이터 로드 함수
    function loadQnas() {
        $.ajax({
            url: '/catshap/getQnAs', // 실제 서버 URL로 변경
            method: 'GET',
            dataType: 'json',
            success: function(response) {
                // 확인: response가 객체이고 qna 속성이 배열인지 확인
                if (response && Array.isArray(response.qna)) {
                    qnas = response.qna; // 전체 QnA 데이터 저장
                    renderQnas(); // 첫 페이지 렌더링
                } else {
                    console.error('Unexpected response format:', response);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching QnAs:', textStatus, errorThrown);
            }
        });
    }

    // QnA 렌더링 함수
    function renderQnas() {
        const searchKey = $('#search_key').val();
        const searchValue = $('#search_input').val().toLowerCase();

        // 검색 필터링
        const filteredQnas = qnas.filter(qna => {
            // 확인: qna[searchKey]이 문자열인지 확인
            const value = qna[searchKey];
            return typeof value === 'string' && value.toLowerCase().includes(searchValue);
        });

        // 페이지네이션 적용
        const start = (currentPage - 1) * pageSize;
        const end = start + pageSize;
        const paginatedQnas = filteredQnas.slice(start, end);

        const tableBody = $('#qnaTableBody');
        tableBody.empty(); // 기존 내용을 지웁니다

        if (paginatedQnas.length === 0) {
            tableBody.append('<tr><td colspan="7">작성한 게시물이 없습니다.</td></tr>');
        } else {
            paginatedQnas.forEach(function(qna, index) {
                let productInfo = '';
                if (qna.prodImgPath && qna.prodImgPath.trim() !== '') {
                    productInfo = '<img src="./image/' + qna.prodImgPath + '" alt="Product Image" style="width: 50px; height: 50px;"> '
                        + '<a href="productView.jsp?prodNo=' + qna.prodNo + '">' + qna.prodTitleName + '</a>';
                }

                const shortText = qna.qnaText.length > 10 ? qna.qnaText.substring(0, 10) + '...' : qna.qnaText;
                const number = start + index + 1; // 조회된 순서 번호

                tableBody.append('<tr>' +
                    '<td>' + number + '</td>' + // 순서 번호
                    '<td>' + qna.qnaCatName + '</td>' +
                    '<td>' + productInfo + '</td>' +
                    '<td>' + qna.qnaTitle + '</td>' +
                    '<td><a href="qnaboarddetail.jsp?qnano=' + qna.qnaNo + '">' + shortText + '</a></td>' +
                    '<td>' + qna.unick + '</td>' +
                    '<td>' + qna.qnaRegdate + '</td>' +
                    '</tr>');
            });

            // 페이지네이션 업데이트
            const pagination = $('.pagination');
            pagination.empty();

            const totalPages = Math.ceil(filteredQnas.length / pageSize);
            if (totalPages > 1) {
                if (currentPage > 1) {
                    pagination.append('<a href="#" data-page="' + (currentPage - 1) + '">이전</a>');
                }

                for (let i = 1; i <= totalPages; i++) {
                    const activeClass = i === currentPage ? ' class="active"' : '';
                    pagination.append('<a href="#" data-page="' + i + '"' + activeClass + '>' + i + '</a>');
                }

                if (currentPage < totalPages) {
                    pagination.append('<a href="#" data-page="' + (currentPage + 1) + '">다음</a>');
                }
            }
        }
    }
});
