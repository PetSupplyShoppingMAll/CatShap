<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.Users"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/user.css" />
    <link rel="stylesheet" href="./css/global.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="./js/user.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="login-desktop">
        <section class="login">
            <div class="login-form">
                <div class="login-header">
                    <div class="login-title">
                        <div class="title">
                            <div class="strong-login-wrapper">
                                <h3 class="strong-login">Change Password</h3>
                            </div>
                            <div class="changePwTitle">회원 비밀번호 변경</div>
                        </div>
                        <div class="logo-container">
                            <img src="image/catShapLogo.png" alt="CatShapLogoImage" />
                        </div>
                    </div>
                </div>
                <div class="login-success">
				    <p>비밀번호가 정상적으로 변경되었습니다.</p>
                </div>
                <div class="findIdBtnDiv">
                    <button id="toLoginBtn" class="toLoginBtn">로그인하러 가기</button>
                    <button id="toMainBtn" class="toMainBtn">메인화면으로 이동</button>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>