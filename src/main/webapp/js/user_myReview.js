$(document).ready(function() {
    loadReviews(1); // 페이지 로드 시 첫 번째 페이지를 로드합니다.

    // 모달창 닫기 버튼 이벤트 리스너
    $('.close').click(function() {
        $('#reviewModal').hide();
    });

    // 페이지네이션 버튼 클릭 이벤트 리스너
    $(document).on('click', '.pagination a', function(event) {
        event.preventDefault();
        const page = $(this).data('page'); // 페이지 번호를 가져옴
        loadReviews(page); // 해당 페이지의 리뷰를 로드
    });
});

function loadReviews(page) {
    const pageSize = 10; // 한 페이지에 보여줄 리뷰 수
    $.ajax({
        url: '/catshap/getReviews', // 서블릿 URL
        method: 'GET',
        data: {
            page: page, // 요청할 페이지 번호
            pageSize: pageSize // 페이지당 리뷰 수
        },
        dataType: 'json',
        success: function(response) {
            const reviews = response.reviews;
            const totalPages = response.totalPages;

            // 리뷰 데이터를 테이블에 추가
            const tableBody = $('#reviewTableBody');
            tableBody.empty(); // 기존 내용을 지웁니다

            if (reviews.length === 0) {
                tableBody.append('<tr><td colspan="6">작성한 게시물이 없습니다.</td></tr>');
            } else {
                reviews.forEach(function(review) {
                    // 이미지 태그와 제품 이름을 함께 출력
                    const productInfo = '<img src="./image/' + review.prodImgPath 
                    + '" alt="Product Image" style="width: 50px; height: 50px;"> ' 
                    + '<a href="productView.jsp?prodNo=' + review.prodNo + '">' + review.prdoTitleName + '</a>';
                    
                    // 리뷰 내용 요약
                    const shortText = review.revText.length > 10 ? review.revText.substring(0, 10) + '...' : review.revText;
                    
                    // 리뷰 내용 클릭 시 모달창에 내용 표시
                    const reviewContentLink = '<a href="#" class="review-link" ' +
                                            'data-title="' + review.revTitle + '" ' +
                                            'data-author="' + review.unick + '" ' +
                                            'data-date="' + review.revRegDate + '" ' +
                                            'data-content="' + review.revText + '">자세히 보기</a>';
                    
                    tableBody.append('<tr>' +
                        '<td>' + review.reviewNo + '</td>' +
                        '<td>' + productInfo + '</td>' +
                        '<td>' + review.revTitle + '</a></td>' +
                        '<td>' + shortText + ' ' + reviewContentLink + '</td>' +
                        '<td>' + review.unick + '</td>' +
                        '<td>' + review.revRegDate + '</td>' +
                        '</tr>');
                });
                
                // 리뷰 링크 클릭 시 모달창에 내용 표시
                $('.review-link').click(function(event) {
                    event.preventDefault();
                    const title = $(this).data('title');
                    const author = $(this).data('author');
                    const date = $(this).data('date');
                    const content = $(this).data('content');

                    $('#modalReviewTitle').text(title);
                    $('#modalReviewAuthor').text(author);
                    $('#modalReviewDate').text(date);
                    $('#modalReviewContent').text(content);
                    $('#reviewModal').show();
                });

                // 페이지네이션 처리
                const pagination = $('.pagination');
                pagination.empty(); // 기존 페이지네이션 버튼을 지웁니다

                if (totalPages > 1) {
                    // 이전 페이지 버튼
                    if (page > 1) {
                        pagination.append('<a href="#" data-page="' + (page - 1) + '">이전</a>');
                    }

                    // 각 페이지 번호 버튼
                    for (let i = 1; i <= totalPages; i++) {
                        const activeClass = i === page ? ' class="active"' : '';
                        pagination.append('<a href="#" data-page="' + i + '"' + activeClass + '>' + i + '</a>');
                    }

                    // 다음 페이지 버튼
                    if (page < totalPages) {
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
