window.onload = function (){

    // 로그인버튼 눌렀을때 페이지로 이동
	$(".link93").click(function(){
		window.location.href="user_login.jsp";
	});
    // 로그아웃 버튼 눌렀을때 페이지로 이동
    $('.link95').click(function(){
		window.location.href="user_logoutProc.jsp";
	});
	
	// 헤더에 고양이로고 클릭시 메인페이지로 이동
	$(".div423").click(function(){
		window.location.href="mainProc.jsp";
	});

	//헤더에 마이페이지 눌렀을때
	$(".link-icon36").click(function(){
		window.location.href="user_mypage.jsp";
	})

	//헤더에 장바구니 눌렀을때
	$(".icon211").click(function(){
		window.location.href="basket.jsp";
	})

}