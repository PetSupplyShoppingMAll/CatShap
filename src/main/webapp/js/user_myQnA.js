$(document).ready(function() {
    loadQnas();
    
});

function loadQnas() {
    $.ajax({
        url: '/catshap/getQnAs', // 서블릿 URL
        method: 'GET',
        dataType: 'json',
        success: function(qna) {
            // 리뷰 데이터를 테이블에 추가
            const tableBody = $('#qnaTableBody');
            tableBody.empty(); // 기존 내용을 지웁니다

            if (qna.length === 0) {
                tableBody.append('<tr><td colspan="6">작성한 게시물이 없습니다.</td></tr>');
            } else {
                qna.forEach(function(qna) {
                    // 이미지 태그와 제품 이름을 함께 출력
						let productInfo;
                    if(qna.prodImgPath  == ' '){
                    	productInfo = '';
                    }else{
					 	productInfo = '<img src="./image/' + qna.prodImgPath 
                    	+ '"  style="width: 50px; height: 50px;"> ' 
                   	 	+'<a href="#">'+ qna.prdoTitleName+'</a>';
					}
                    
                    const shortText = qna.qnaText.length > 15 ? qna.qnaText.substring(0, 15) + '...' : qna.qnaText;
                    
                    tableBody.append('<tr>' +
                        '<td>' + qna.qnaNo + '</td>' +
                        '<td>' + qna.qnaCatName + '</td>' +
                        '<td>' + productInfo + '</td>' +
                        '<td>' + qna.qnaTitle + '</td>' +
                        '<td><a href="#">' + shortText + '</a></td>' +
                        '<td>' + qna.unick + '</td>' +
                        '<td>' + qna.qnaRegdate + '</td>' +
                        '</tr>');
                });
                
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error fetching reviews:', textStatus, errorThrown);
        }
    });
}
