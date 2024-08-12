$(function() {
    $("#buyBtn").on('click', (e) => {
		e.preventDefault();
		
        const prodNo = $(e.currentTarget).data('prodno');
        const prodCnt = $('#number-display').text();
       	if (prodNo) {
            $.ajax({
                url: '/catshap/registOrder',
                type: 'POST',
                data: {
               		prodNo: prodNo,
               		prodCnt: prodCnt
            	},
                success: (response) => {
                    if (response.success) {
                       	alert('주문 추가 성공~!!!');
                        //window.location.href = `buy.jsp?prodNo=${prodNo}`;
                    } else {
                        alert('주문 실패...');
                    }
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    console.error('Error:', textStatus, errorThrown);
                }
            });
        } else {
            console.error('해당 상품이 존재하지 않습니다.');
        }
    });
    
});
