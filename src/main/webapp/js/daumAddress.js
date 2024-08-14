$(function () {
 	// 주소 검색 버튼 클릭 이벤트 핸들러
    $('#addressSearchButton').on('click', function (event) {
        execDaumPostcode(event);
    });
});

// 주소 검색 함수
const execDaumPostcode = (e) => {
    e.preventDefault();

    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById('umailAddress').value = data.zonecode;
            document.getElementById('uaddress').value = data.address;
        }
    }).open();
}