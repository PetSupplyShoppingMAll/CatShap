<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />
<link rel="stylesheet" href="./css/global.css" />
<link rel="stylesheet" href="./css/user_modify.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400;700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Short+Stack:wght@400&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400&display=swap" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./js/daumAddress.js"></script>
<script src="./js/check_login.js"></script>
<script src="./js/user_info.js"></script>
<script src="./js/user_regex.js"></script>
<script src="./js/user.js"></script>
</head>
<body class="user_modify">
	<div class="modify-wrapper">`
		<div class="auth-modify-wrapper">
			<div class="auth-container">
				<div class="auth-options">
					<h2 class="strong-join">MODIFY</h2>
				</div>
				<div class="login-container">
					<div class="link-wrapper4">
						<img class="link-icon29" alt="" src="./image/join_link.svg" />
					</div>
					<div class="login-icon-container-parent">
						<div class="login-icon-container">
							<img class="link-icon29" alt="" src="./image/join_icon1.svg" />
						</div>
						<div class="div327">로그인</div>
					</div>
					<div class="icon-wrapper21">
						<img class="link-icon29" alt="" src="./image/join_icon1.svg" />
					</div>
					<div class="div328">정보수정</div>
				</div>
			</div>
		</div>
		<section class="form-header">
			<img class="join_separator1" alt="" src="./image/join_separator.svg" />
			<h2 class="h21">
				<span>
					<p class="p14">수정정보를 입력해주세요.</p>
				</span>
			</h2>
			<img class="join_separator1" alt="" src="./image/join_separator.svg" />
		</section>
		<section class="form-container">
			<div class="form-content">
					<div class="row31">
						<div class="row-inner11">
							<div class="parent17">
								<div class="div331">아이디</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input12">
					        <input class="container44" id="usid" name="usid" type="text" readonly />
					    </div>
					</div>
					<div class="row31">
						<div class="row-inner11">
							<div class="parent17">
								<div class="div331">비밀번호</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<button type="button" class="passwordBtn" id="changPw">
							<div class="container47">
								<div>비밀번호 변경</div>
							</div>
						</button>
					</div>
					<div class="row31">
						<div class="row-inner11">
							<div class="parent17">
								<div class="div331">이름</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input12">
							<input class="container44" id="uname" name="uname" placeholder="Name" type="text" />
						</div>
						<span id="uname-error" class="error-message"></span>
					</div>
					<div class="row31">
						<div class="row-inner11">
							<div class="parent17">
								<div class="div331">닉네임</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input12">
							<input class="container44" id="unick" name="unick" placeholder="nickname" type="text" />
						</div>
						<button type="button" class="checkBtn" id="nickCheckButton">
							<div class="container47">
								<div class="duplicate-check">nickname check</div>
							</div>
						</button>
						<div class="wrapper28">
							<div class="div330">(한글/영문/숫자, 2~10자)</div>
						</div>
					</div>
					<span id="unick-error" class="error-message"></span>
					<div class="row31">
						<div class="row-inner11">
							<div class="parent17">
								<div class="div331">휴대전화</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input13">
							<select id="utelecom" name="utelecom" class="container45">
								<option value="">선택</option>
								<option value="LG">LG</option>
								<option value="SK">SK</option>
								<option value="KT">KT</option>
							</select>
						</div>
						<div class="input12">
							<input class="container44" id="uphone" name="uphone" placeholder="01000000000" type="text" />
						</div>
						<span id="uphone-error" class="error-message"></span>
					</div>
					<div class="row36">
						<div class="input-label-container-wrapper">
							<div class="input-label-container">
								<div class="div331">이메일</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input19">
							<input class="container51" id="email" name="email" placeholder="user@domain.com" type="text" />
						</div>
						<span id="email_error" class="error-message"></span>
					</div>
					<div class="row31">
						<div class="row-inner11">
							<div class="parent17">
								<div class="div331">우편번호</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input12">
							<input class="container44" id="umailAddress" name="umailAddress" placeholder="우편번호" type="text" />
						</div>
						<button class="input14" id="addressSearchButton">
							<div class="container47">
								<div class="search-check">address search</div>
							</div>
						</button>
					</div>
					<div class="row36">
						<div class="input-label-container-wrapper">
							<div class="input-label-container">
								<div class="div331">주소</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input19">
							<input class="container51" id="uaddress" name="uaddress" placeholder="주소" type="text" />
						</div>
					</div>
					<div class="row36">
						<div class="input-label-container-wrapper">
							<div class="input-label-container">
								<div class="div331">상세주소</div>
								<div class="input-icon-container">
									<img class="join_icon2" alt="" src="./image/join_icon2.svg" />
								</div>
							</div>
						</div>
						<div class="input19">
							<input class="container51" id="udetailAddress" name="udetailAddress" placeholder="상세주소" type="text" />
						</div>
					</div>
					<div class="actions3">
						<div class="link-parent11">
							<button type="button" class="link75" id="modifyBtn">
								<div class="action-icons">
									<img class="icon165" src="./image/icon_v.svg" />
								</div>
								<div class="div344">정보수정</div>
							</button>
							<button type="button" class="link76" id="modifyCancelBtn">
								<div class="icon-wrapper26">
									<img class="link-icon29" alt="" src="./image/icon_x.svg" />
								</div>
								<div class="div345"> 취소</div>
							</button>
						</div>
					</div>
			</div>
		</section>
	</div>
</body>
</html>
