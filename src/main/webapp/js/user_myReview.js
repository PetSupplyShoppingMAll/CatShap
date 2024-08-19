$(document).ready(() => {
    let reviews = []; // 전체 리뷰 데이터
    let currentPage = 1; // 현재 페이지 초기화
    const pageSize = 10; // 페이지당 리뷰 수

    // 리뷰 데이터 로드
    loadReviews();

    // 모달창 닫기 버튼 이벤트 리스너
    $('.close').click(function() {
        $('#reviewModal').hide();
    });

    // 페이지네이션 클릭 이벤트 리스너
    $(document).on('click', '.pagination a', function(event) {
        event.preventDefault();
        const page = $(this).data('page');
        if (page && page !== currentPage) {
            currentPage = page; // 현재 페이지 업데이트
            renderReviews(); // 페이지 로드
        }
    });

    // 검색 버튼 클릭 이벤트
    $('#searchButton').click(function() {
        currentPage = 1; // 검색 시 페이지를 1로 초기화
        renderReviews(); // 검색 후 렌더링
    });

    // 초기화 버튼 클릭 이벤트
    $('#resetButton').click(function() {
        $('#search_input').val('');
        currentPage = 1;
        renderReviews(); // 초기화 후 렌더링
    });

    // 리뷰 데이터 로드 함수
    function loadReviews() {
        $.ajax({
            url: '/catshap/getReviews', // 실제 서버 URL로 변경
            method: 'GET',
            
            success: function(response) {
                // 확인: response가 객체이고 reviews 속성이 배열인지 확인
                if (response && Array.isArray(response.reviews)) {
                    reviews = response.reviews; // 전체 리뷰 데이터 저장
                    renderReviews(); // 첫 페이지 렌더링
                } else {
                    console.error('Unexpected response format:', response);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching reviews:', textStatus, errorThrown);
            }
        });
    }

    // 리뷰 렌더링 함수
    function renderReviews() {
        const searchKey = $('#search_key').val();
        const searchValue = $('#search_input').val().toLowerCase();

        // 검색 필터링
        const filteredReviews = reviews.filter(review => {
            // 확인: review[searchKey]이 문자열인지 확인
            const value = review[searchKey];
            return typeof value === 'string' && value.toLowerCase().includes(searchValue);
        });

        // 페이지네이션 적용
        const start = (currentPage - 1) * pageSize;
        const end = start + pageSize;
        const paginatedReviews = filteredReviews.slice(start, end);

        const tableBody = $('#reviewTableBody');
        tableBody.empty(); // 기존 내용을 지웁니다

        if (paginatedReviews.length === 0) {
            tableBody.append('<tr><td colspan="7">작성한 게시물이 없습니다.</td></tr>');
        } else {
            paginatedReviews.forEach(function(review, index) {
                const productInfo = '<img src="./image/' + review.prodImgPath 
                + '" alt="Product Image" style="width: 50px; height: 50px;"> ' 
                + '<a href="productView.jsp?prodNo=' + review.prodNo + '">' + review.prodTitleName + '</a>';
                
                const shortText = review.revText.length > 10 ? review.revText.substring(0, 10) + '...' : review.revText;
                const starRating = generateStarRating(review.revScore); // 별점 생성
                const reviewContentLink = '<a href="#" class="review-link" ' +
                                            'data-title="' + review.revTitle + '" ' +
                                            'data-author="' + review.unick + '" ' +
                                            'data-date="' + review.revRegDate + '" ' +
                                            'data-score="' + starRating + '" ' +
                                            'data-content="' + review.revText + '">자세히 보기</a>';

                // 순서에 맞게 번호 붙이기 (index는 페이지 내 위치)
                const number = start + index + 1; // 조회된 순서 번호

                tableBody.append('<tr>' +
                    '<td>' + number + '</td>' + // 순서 번호
                    '<td>' + productInfo + '</td>' +
                    '<td>' + review.revTitle + '</td>' +
                    '<td>' + shortText + ' ' + reviewContentLink + '</td>' +
                    '<td>' + review.unick + '</td>' +
                    '<td class="star-rating">' + starRating + '</td>' +
                    '<td>' + review.revRegDate + '</td>' +
                    '</tr>');
            });

            // 모달에 데이터 로드
            $('.review-link').click(function(event) {
                event.preventDefault();
                const title = $(this).data('title');
                const author = $(this).data('author');
                const date = $(this).data('date');
                const score = $(this).data('score');
                const content = $(this).data('content');

                $('#modalReviewTitle').text(title);
                $('#modalReviewAuthor').text(author);
                $('#modalReviewDate').text(date);
                $('#star-rating').text(score);
                $('#modalReviewContent').text(content);
                $('#reviewModal').show();
            });

            // 페이지네이션 업데이트
            const pagination = $('.pagination');
            pagination.empty();

            const totalPages = Math.ceil(filteredReviews.length / pageSize);
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

    // 별점 생성 함수
    const generateStarRating = (score) => {
        const fullStar = '★'; // 채워진 별
        const emptyStar = '☆'; // 빈 별
        let rating = '';

        for (let i = 0; i < 5; i++) {
            if (i < score) {
                rating += fullStar;
            } else {
                rating += emptyStar;
            }
        }

        return rating;
    }
});
