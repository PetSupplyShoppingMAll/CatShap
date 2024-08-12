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
                                <h3 class="strong-login">Find ID</h3>
                            </div>
                            <div class="findIdTitle">회원 아이디 찾기</div>
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
				            out.print("<p>" + user.getUname() + "님의 아이디</p>");
				            out.print("<h1>" + user.getUsid() + "</h1>");
				            session.invalidate();
				        } else {
				            out.println("<p>사용자 정보가 없습니다.</p>");
				        }
				    %>
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