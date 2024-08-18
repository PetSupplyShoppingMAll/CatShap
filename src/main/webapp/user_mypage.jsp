<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.Users"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/user_mypage.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/check_login.js"></script>
    <script src="./js/user.js"></script>
    <style>
        .profile-grade-image {
            width: 50px; /* Adjust size as needed */
            height: auto;
            margin-left: 10px;
            vertical-align: middle; /* Align with profile image */
        }
    </style>
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
                        	<%
						    HttpSession session2 = request.getSession();
						    Users user = (Users) session2.getAttribute("user");
						    String gradeName = (String) session2.getAttribute("userGrade");
						
						    if (gradeName != null && !gradeName.isEmpty()) {
						
						        // Determine the grade image path based on grade number
						        String gradeImagePath = "./image/default_grade.png"; // Default image
						        int gradeNo = user.getGradeNo(); // Assuming you have a method to get grade number
						
						        switch (gradeNo) {
						            case 1:
						                gradeImagePath = "./image/catGrade1.png";
						                break;
						            case 2:
						                gradeImagePath = "./image/catGrade2.png";
						                break;
						            case 3:
						                gradeImagePath = "./image/catGrade3.png";
						                break;
						            case 4:
						                gradeImagePath = "./image/catGrade4.png";
						                break;
						            default:
						                gradeImagePath = "./image/default_grade.png"; // Fallback image
						                break;
						        }
						        
						        // Print the grade image and grade name in one line
						        out.print("<div class='profile-grade-container'>");
						        out.print("<img src='" + gradeImagePath + "' alt='Grade Image' class='profile-grade-image'>");
						        out.print("<div class='profile-grade-text'><span class='grade-name'>회원 등급:</span> " + gradeName + "</div>");
						        out.print("</div>");
						    }
						
						    if (user != null) {
						        String userNick = user.getUnick();
						        out.print("<h2><span style='color:#FF5733'>" + userNick + "</span>님</h2><p>환영합니다</p>");
						    }
						%>
                             <button type="button" class="userExitBtn" id="userExitBtn">
								<div class="container47">
									<a href='/catshap/user_exit.jsp'>회원 탈퇴하기</a>
								</div>
							</button>     
							<div class="profile-info">
				              <nav class='profile-nav'>
				                <a href='/catshap/userOrdersPageProc.jsp'>주문내역</a>
				                <a href='/catshap/user_modify.jsp'>회원정보 수정</a>
				                <a href='/catshap/user_myReview.jsp'>내 리뷰 보기</a>
				                <a href='/catshap/user_myQnA.jsp'>내 게시글 보기</a>
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