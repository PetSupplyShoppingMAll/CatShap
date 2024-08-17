 $(document).ready(() => {
            let currentPage = 1; // 현재 페이지 초기화

            loadReviews(currentPage); // 페이지를 1로 초기화하여 로드

            // 모달창 닫기 버튼 이벤트 리스너
            $('.close').click(function() {
                $('#reviewModal').hide();
            });

            // 페이지네이션 클릭 이벤트 리스너
            $(document).on('click', '.pagination a', function(event) {
                event.preventDefault();
                var page = $(this).data('page');
                if (page && page !== currentPage) {
                    currentPage = page; // 현재 페이지 업데이트
                    loadReviews(currentPage); // 페이지 로드
                }
            });
            
 });

        const loadReviews = (page) => {
    $.ajax({
        url: '/catshap/getReviews',
        method: 'GET',
        data: {
            page: page,
            pageSize: 10
        },
        dataType: 'json',
        success: function(response) {
            // 응답 데이터 구조 확인
            if (!response || !Array.isArray(response.reviews) || typeof response.totalPages !== 'number') {
                console.error('Invalid response structure:', response);
                return;
            }
            console.log(response.reviews);
            // 리뷰 데이터를 테이블에 추가
            const tableBody = $('#reviewTableBody');
            tableBody.empty(); // 기존 내용을 지웁니다

            if (response.reviews.length === 0) {
                tableBody.append('<tr><td colspan="7">작성한 게시물이 없습니다.</td></tr>');
            } else {
                response.reviews.forEach(function(review) {
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
                    

                    
                    tableBody.append('<tr>' +
                        '<td>' + review.reviewNo + '</td>' +
                        '<td>' + productInfo + '</td>' +
                        '<td>' + review.revTitle + '</td>' +
                        '<td>' + shortText + ' ' + reviewContentLink + '</td>' +
                        '<td>' + review.unick + '</td>' +
                        '<td class="star-rating">' + starRating + '</td>' + // 별점 추가
                        '<td>' + review.revRegDate + '</td>' +
                        '</tr>');
                });
                
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

                // Update pagination
                const pagination = $('.pagination');
                pagination.empty();

                if (response.totalPages > 1) {
                    if (page > 1) {
                        pagination.append('<a href="#" data-page="' + (page - 1) + '">이전</a>');
                    }

                    for (let i = 1; i <= response.totalPages; i++) {
                        const activeClass = i === page ? ' class="active"' : '';
                        pagination.append('<a href="#" data-page="' + i + '"' + activeClass + '>' + i + '</a>');
                    }

                    if (page < response.totalPages) {
                        pagination.append('<a href="#" data-page="' + (page + 1) + '">다음</a>');
                    }
                }
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error fetching reviews:', textStatus, errorThrown);
        }
    });
}

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
