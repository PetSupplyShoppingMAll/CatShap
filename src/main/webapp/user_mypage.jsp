<%@page import="catshap.butler.bean.Users"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/user_mypage.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/check_login.js"></script>
</head>
<body>
    <div class="login-desktop">
        <jsp:include page="header.jsp"></jsp:include>
        <section class="login">
            <div class="login-form">
                <div class="login-header">
                    <div class="login-title">
                        <div class="title">
                            <div class="strong-login-wrapper">
                                <h3 class="strong-login">MY PAGE</h3>
                            </div>
                            <div class="loginTitle">마이 페이지</div>
                        </div>
                        <div class="horizontal-divider-frame">
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <form action="/login" method="post">
                    <div class="profile-card">
                        <div class="profile-image">
                            <img src="./image/mypage_icon.png" alt="Profile Image">
                        </div>
                        <div class="profile-info">
                            <% HttpSession session2=request.getSession(); Users user=(Users)
                                session2.getAttribute("user"); // 세션에서 사용자 정보 가져오기 if (user !=null) { String
                                userNick=user.getUnick(); out.print("<h2><span style='color:#FF5733'>" +
                                    userNick + "</span>님</h2>
                                <p>환영합니다</p>");
                                } else {
                                out.print("<h2>사용자 정보를 불러올 수 없습니다.</h2>");
                                }
                                %>
                                <nav class='profile-nav'>
                                    <a href='#'>주문내역</a>
                                    <a href='/catshap/user_modify.jsp'>회원정보 수정</a>
                                    <a href='#'>내 리뷰 보기</a>
                                    <a href='#'>내 게시글 보기</a>
                                </nav>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>