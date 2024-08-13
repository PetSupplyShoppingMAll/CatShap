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
});
