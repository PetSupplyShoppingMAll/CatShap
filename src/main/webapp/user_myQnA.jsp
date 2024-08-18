<%@page import="catshap.butler.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%
	Users user = (Users)session.getAttribute("user");
	if(user != null){
		int userNo = user.getUserNo(); 
	}
%>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/user_myView.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Short+Stack:wght@400&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400;700&display=swap" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <script src="./js/check_login.js" ></script>
    <script src="./js/user_myQnA.js" ></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="xans-element- xans-myshop xans-myshop-boardpackage">
        <div class="sp--width" scope="box">
            <div class="sp--title" theme="underline-heavy" scale="2xl-nude">
                <div class="sp--title-inner">
                    <dt><span>Q n A</span></dt>
                    <i class="sp--icon" ico="string" rotate="135" scale="xs" hspace="xs"></i>
                    <span class="sp--title-subtext">내가 작성한 QnA의 목록입니다.</span>
                </div>
            </div>
            <form id="searchForm">
    <div class="xans-element- xans-myshop xans-myshop-boardlistsearch">
        <div class="sp--box" fill="justify" vertical="middle">
            <ul class="sp--form" theme="xl-light-fill-round" id="searchform">
                <li>
                    <div class="sp--box" gap="sm" vertical="middle">
                        <ul>
                            <li>
                                <select id="search_key" name="search_key">
                                    <option value="prodTitleName">상품명</option>
                                    <option value="qnaTitle">제목</option>
                                    <option value="qnaText">내용</option>
                                </select>
                            </li>
                            <li>
                                <input id="search_input" name="search" class="inputTypeText" placeholder="검색어를 입력하세요." type="text" />
                            </li>
                            <li>
                                <a href="#" class="sp--btn" theme="box-white-round" scale="xl" id="resetButton">
                                    <i class="sp--icon" ico="reload" scale="md-minup"></i>
                                    &nbsp; 초기화
                                </a>
                            </li>
                            <li>
                                <a href="#" class="sp--btn" theme="box-dark-round" scale="xl" id="searchButton">
                                    <i class="sp--icon" ico="search" scale="md-minup"></i>
                                    &nbsp; 검색
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</form>

            <div class="xans-element- xans-myshop xans-myshop-boardlist">
                <table  id="qnaTable" class="sp--table" theme="lg-center" gap="2xl" solid="light-nude" vertical="middle">
                    <caption>게시물 관리 목록</caption>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>상품</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody id="qnaTableBody">
                        <!-- 내가 쓴 리뷰 내용 출력 -->
                    </tbody>
                </table>
            </div>
             <!-- 페이지네이션 -->
            <div class="pagination"></div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
