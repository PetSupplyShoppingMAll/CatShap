<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/user.css" />
    <link rel="stylesheet" href="./css/global.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="./js/user_regex.js"></script>
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
                                <h3 class="strong-login">Find PW</h3>
                            </div>
                            <div class="findPwTitle">회원 비밀번호 찾기</div>
                        </div>
                        <div class="horizontal-divider-frame">
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <form action="/user-pw-recovery" method="post">
                    <div class="input-fields-parent">
                        <div class="input-fields">
                            <div class="find-input">
                                <div class="input-title-container">
                                    <div class="findPwDetailTitle">비밀번호 찾기(이름 / ID / Email)</div>
                                </div>
                                <div class="user-input">
                                    <label for="uname">이름</label>
                                    <input id="uname" class="label-input-uname" placeholder="NAME" type="text" />
                                    <p id="uname-error" class="error-message" style="display: none;"></p>
                                    <label for="usid">아이디</label>
                                    <input id="usid" class="label-input-usid" placeholder="ID" type="text" />
                                    <p id="usid-error" class="error-message" style="display: none;"></p>
                                    <label for="email">이메일</label>
                                    <input id="email" class="label-input-email" placeholder="EMAIL" type="email" />
                                    <p id="email-error" class="error-message" style="display: none;"></p>
                                </div>
                            </div>
                        </div>
                        <div class="findPwBtnDiv">
                            <button id="userFindPwBtn" class="findPwBtn">비밀번호 찾기</button>
                            <button id="userCancelBtn" class="cancelFindPwBtn" type="button">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>