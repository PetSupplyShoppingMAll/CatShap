<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.Users"%>
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
                        <div class="logo-container">
                            <img src="image/catShapLogo.png" alt="CatShapLogoImage" />
                        </div>
                    </div>
                </div>
                <div class="login-success">
				     <% 
					    HttpSession sessions = request.getSession(false);
				        Users user = (Users)(sessions != null ? sessions.getAttribute("user") : null);
	
				        if (user != null) {
				            out.print("<div class=\"sendEmailContent\">" + user.getEmail() + " 이메일로<br />");
				            out.print("메일이 성공적으로 전송되었습니다.</div>");
				            session.invalidate();
				        } else {
				            out.println("<div class=\"sendEmailContent\">비밀번호 찾기 실패. 다시 시도해주세요.</div>");
				        }
				    %>
                </div>
                <form action="/user-authcode-verify" method="post" class="authcode-input">
                  <div class="authcode-input-container">
                    <input id="uauthcode" class="label-input-authcode" placeholder="인증코드를 입력하세요." type="text" />
                    <input id="user_find_pw_code" class="verifyAuthcodeBtn" type="submit" value="확인" />
                  </div>
                  <p id="uauthcode-error" class="error-message" style="display: none;"></p>
                </form>
                <div class="findPwBtnDiv">
                    <button id="userTryPwcodeBtn" class="tryAuthcodeBtn">인증코드 다시받기</button>
                    <button id="userCancelBtn" class="cancelFindPwBtn">취소</button>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>