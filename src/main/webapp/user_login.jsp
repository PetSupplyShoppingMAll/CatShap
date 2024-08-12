<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<body class="user_login">
	<jsp:include page="header.jsp"></jsp:include>
  	<div class="login-desktop">
    <section class="login">
      <div class="login-form">
        <div class="login-header">
          <div class="login-title">
            <div class="title">
              <div class="strong-login-wrapper">
                <h3 class="strong-login">LOGIN</h3>
              </div>
              <div class="loginTitle">회원 로그인</div>
            </div>
            <div class="horizontal-divider-frame">
              <div class="horizontal-divider"></div>
            </div>
          </div>
        </div>
        <form action="/login" method="post">
          <div class="input-fields-parent">
            <div class="input-fields">
              <div class="id-input">
                <div class="id-input-container">
                  <div class="loginDetailTitle">로그인</div>
                </div>
                <div class="password-input">
                  <div class="password-input-container">
                    <input id="usid" class="label-input-id" placeholder="ID" type="text" />
	                <p id="usid-error" class="error-message" style="display: none;"></p>
                  </div>
                  <div class="password-input-container">
	                  <input id="upass" class="label-input-pw" placeholder="PASSWORD" type="password" />
	                  <p id="upass-error" class="error-message" style="display: none;"></p>                  
                  </div>
                </div>
              </div>
            </div>
            <div class="loginBtnDiv">
              <button id="userLoginBtn" type="submit" class="loginBtn">LOGIN</button>
            </div>
          </div>
        </form>
        <div class="find-login-wrapper">
          <div class="find-login">
            <div class="userFindId" id="userLoginFindIdBtn">아이디 찾기</div>
            <div class="userFindPw" id="userLoginFindPassBtn">비밀번호 찾기</div>
            <div class="userSignUp" id="userLoginSignupBtn">회원가입</div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>