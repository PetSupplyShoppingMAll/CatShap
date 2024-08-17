<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/qnaboardmain.css" />   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="js/user_orders.js"></script> 
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="div">
      <main class="container">
        <div class="frame-container">
          <div class="frame-wrapper">
            <div class="frame-div">
              <div class="strong-q-a-wrapper">
                <h1 class="strong-q1">Q & A</h1>
              </div>
              <div class="qa-parent">
                <div class="qa">상품 Q&A입니다.</div>
              </div>
            </div>
          </div>
          <div class="parent">
            <div class="div8"> 고객지원센터</div>
            <div class="q-a"> Q & A</div>
          </div>
        </div>
        <section class="inquiry-row-wrapper">
          <div class="inquiry-row">
            <div class="footer-links">
              <div class="options">              
              </div>
             <form method="get" action="qnaboardmainProc.jsp">
             	<select name="qnacatno">
					<option value="" <c:if test="${qnacatno==null || qnacatno==''}" >selected</c:if>>--전체--</option>
					<option value="1" <c:if test="${qnacatno=='1'}" >selected</c:if>>상품문의</option>
					<option value="2" <c:if test="${qnacatno=='2'}" >selected</c:if>>배송문의</option>
					<option value="3" <c:if test="${qnacatno=='3'}" >selected</c:if>>기타문의</option>
				</select>&nbsp;		
				<select name="searchKeyword">
					<option value="" <c:if test="${searchKeyword==null || searchKeyword==''}" >selected</c:if>>--전체--</option>
					<option value="qnatitle" <c:if test="${searchKeyword=='qnatitle'}" >selected</c:if>>제목</option>
					<option value="qnatext" <c:if test="${searchKeyword=='qnatext'}" >selected</c:if>>내용</option>
				</select>&nbsp;
				
				<input type="text" name="searchValue" value="${searchValue}" />
				<input type="submit" value="검색" />
		    </form>
            </div>
            <div class="question-list">
              <div class="tablecontainer">                
                <table>
                  <thead>
                    <tr>
                      <th>카테고리</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="qna" items="${qnaBoardList}">
					    <tr onclick="location.href='qnaboarddetail.jsp?qnano=${qna.qnano}'" style="cursor:pointer;">
					        <td>
					            <c:choose>
					                <c:when test="${qna.qnacatno == 1}">상품문의</c:when>
					                <c:when test="${qna.qnacatno == 2}">배송문의</c:when>
					                <c:when test="${qna.qnacatno == 3}">기타문의</c:when>
					                <c:otherwise>알 수 없음</c:otherwise>
					            </c:choose>
					        </td>
					        <td>${qna.qnatitle}</td>
					        <td>${qna.uname}</td>
					        <td><fmt:formatDate value="${qna.qnaregdate}" pattern="yy/MM/dd HH:mm"/></td>
					    </tr>
					</c:forEach>
				  </tbody>
                </table>   
              </div>
            </div>
            <div class="footer-action">
              <div class="navigation-links">
                <div class="shopping-link-wrapper">
                  <div class="link5" id="linkContainer">
                    <div class="shopping-link-content">
                      <img class="icon9" alt="" src="./public/icon-9.svg" />
                    </div>
                    <a href="mainProc.jsp" class="div84">쇼핑하기</a>
                  </div>
                </div>
                <div class="q-a-container">
                  <div class="wrapper">
                    <div class="div85">건전한 게시글 문화를 응원합니다.</div>
                  </div>
                  <div class="vertical-divider-wrapper">
                    <div class="vertical-divider4"></div>
                  </div>
                  <div class="shopping-link">
                    <div class="link6" id="linkContainer">
                      <div class="write-post-link-content">
                        <img class="icon10" alt="" src="./public/icon-10.svg" />
                      </div>
                      <a href="qnaboardregist.jsp" class="div86">+ 글쓰기</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="separator3"></div>
            </div>
          </div>
        </section>
      </main>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>