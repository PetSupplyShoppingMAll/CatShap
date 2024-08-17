<%@page import="catshap.butler.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/qnaboardregist.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/check_login.js"></script>
    <script>
    
        function openProductSearch() {
            window.open('${pageContext.request.contextPath}/qnaproductsearch.jsp', '상품 검색', 'width=600,height=400');
        }
        function selectProduct(prodNo, prodName, prodImgPath) {
            document.getElementById('prodNoInput').value = prodNo;
            document.getElementById('prodNameInput').value = prodName;

            // 이미지 경로 설정
            const prodImg = document.getElementById('prodImg');
            prodImg.src = prodImgPath;  // 경로 설정
            prodImg.style.display = 'block';  // 이미지 표시

            console.log("Selected prodNo:", prodNo); // 디버깅용 로그
            console.log("Selected prodImgPath:", prodImgPath); // 디버깅용 로그
        }
    </script>
</head>
<body>
    <form method="post" action="qnaboardregistProc.jsp" >
    <% 
    // 세션에서 userNo 가져오기
   HttpSession session2 = request.getSession();
   Users user = (Users) session2.getAttribute("user");
   int userNo = (user != null) ? user.getUserNo() : 0;
    System.out.println(userNo);
    %>
    <input type="hidden" name="userno" value="<%= userNo %>">
    <input type="hidden" id="prodNoInput" name="prodno" value="9999">
    <jsp:include page="header.jsp"></jsp:include>
        <section class="author-input">
            <div class="author-input-inner">
                <div class="form-header-parent">
                    <div class="form-header">
                        <div class="horizontalborder5">
                            <div class="div113">글 작성</div>
                        </div>
                        <div class="instruction">
                            <div class="div114">아래 양식을 확인하고 입력해주세요.</div>
                        </div>
                    </div>
                    <div class="row23">
                        <div class="options1">
                            <select class="div115" name="qnacatno" required>
                                <option value="1">상품문의</option>
                                <option value="2">배송문의</option>
                                <option value="3">기타문의</option>
                            </select>
                        </div>
						<div class="options2">
						    <input class="container24" placeholder="title" type="text" name="qnatitle" required/>
						    <input type="text" id="prodNameInput" readonly placeholder="선택된 상품명">
						    <button type="button" onclick="openProductSearch()">상품 검색</button>
						    <input type="hidden" id="prodNoInput" name="prodno" value="0">
						    
						    <!-- 이미지 출력 -->
						    <img id="prodImg" src="" alt="선택된 상품 이미지" style="display:none; max-width: 100px; max-height: 100px;">
						</div>
                    </div>
                </div>
            </div>
            <div class="row-wrapper">
                <div class="data-application">
                    <textarea class="backgroundborder9" name="qnatext" required></textarea>
                </div>
            </div>
            <div class="actions-area">
                <div class="actions-row">
					<div class="item4" id="itemContainer">
					    <div class="link14">
					        <a href="./qnaboardmainProc.jsp">
					            <div class="div124">목록으로</div>
					        </a>
					    </div>
					</div>
                </div>
                <div class="frame-parent33">
                    <div class="frame">
                        <div class="div123">건전한 게시글 문화를 응원합니다.</div>
                    </div>
                    <div class="vertical-divider9"></div>
                    <div class="submission-buttons">
                        <!-- 제출 버튼 -->
                        <button type="submit" class="link15" id="linkContainer2">+ 글 등록하기</button>
                        <!-- 취소 버튼 -->
                        <button type="button" class="link16" id="linkContainer3" onclick="window.location.href='qnaboardmainProc.jsp'">
                            <div class="submission-elements">
                                <img class="icon30" alt="" src="<%= request.getContextPath() %>/public/icon-102.svg" />
                            </div>
                            <div class="div127"> X 취소하기</div>
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </form>
 <!-- <jsp:include page="footer.jsp"></jsp:include> --> 
</body>
</html>