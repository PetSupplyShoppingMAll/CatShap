$(document).ready(() => {
    // 로그인 버튼 클릭 시 페이지 이동
    $(".link93").click(() => {
        window.location.href = "user_login.jsp";
    });

    // 로그아웃 버튼 클릭 시 페이지 이동
    $('.link95').click(() => {
        window.location.href = "user_logoutProc.jsp";
    });

    // 헤더의 고양이 로고 클릭 시 메인 페이지로 이동
    $(".div423").click(() => {
        window.location.href = "mainProc.jsp";
    });

    // 헤더의 마이페이지 클릭 시 페이지 이동
    $(".link-icon36").click(() => {
        window.location.href = "user_mypage.jsp";
    });

    // 헤더의 장바구니 클릭 시 페이지 이동
    $(".icon211").click(() => {
        window.location.href = "basket.jsp";
    });

    // 사이드바 열기
    const openNav = () => {
        $('#mySidebar').css('width', '250px');
        localStorage.setItem('sidebarOpen', 'true');
    };

    // 사이드바 닫기
    const closeNav = () => {
        $('#mySidebar').css('width', '0');
        localStorage.setItem('sidebarOpen', 'false');
    };

    // 사이드바 열기 버튼 클릭 이벤트
    $('.button30').on('click', openNav);

    // 사이드바 닫기 버튼 클릭 이벤트
    $('#closeSidebar').on('click', closeNav);

    // 사이드바 링크 클릭 시 닫기
    $('#mySidebar a').on('click', closeNav);
});
