<%@ page  contentType="text/html; charset=UTF-8"%>
<%@page import="catshap.butler.interfaces.QnaBoardProductDaoInterface"%>
<%@ page import="catshap.butler.bean.QnaBoard" %>
<%@ page import="catshap.butler.bean.Users" %>
<%@ page import="catshap.butler.bean.QnaProduct" %>
<%@ page import="catshap.butler.dao.QnaBoardDao" %>
<%@ page import="catshap.butler.dao.UserDao" %>
<%@ page import="catshap.butler.dao.QnaBoardProductDao" %>
<%@ page import="catshap.butler.interfaces.QnaBoardInterface" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.Reader" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="java.sql.SQLException" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%
    // QnA 게시물 정보 가져오기
    int qnano = Integer.parseInt(request.getParameter("qnano"));
   QnaBoardProductDaoInterface qi = new QnaBoardProductDao();
   QnaBoardInterface qnaBoardDao = new QnaBoardDao();
   
   
   QnaBoard qnaBoard = qnaBoardDao.getQnaBoard(qnano);
   
   QnaProduct qnaProduct = null;
   
   try{
      qnaProduct = qi.getProductByQnaNo(qnano);   
   } catch (SQLException e) {
      e.printStackTrace();
   }
   
   String prodName = "";
   int prodPrice = 0;
   int prodNo = 9999;  // 기본값으로 9999 설정
   String prodImgPath = "";
   String imgPath = pageContext.getServletContext().getContextPath() + "/image/default.png"; // 기본 이미지 경로
   
   if (qnaProduct != null) {
       prodName = qnaProduct.getProdName();
       prodPrice = qnaProduct.getProdPrice();
       prodNo = qnaProduct.getProdNo();
       prodImgPath = qnaProduct.getProdImgPath();
       imgPath = pageContext.getServletContext().getContextPath() + "/image/" + prodImgPath;
   } else {
       // 상품이 선택되지 않았을 때 (prodno == 9999)
       prodName = "선택된 상품 없음";
       prodPrice = 0;  // 또는 "가격 없음"과 같은 표시를 위한 값을 설정할 수 있습니다.
   }
   
   // 사용자 이름 가져오기
    QnaBoardDao qanBoardDao = new QnaBoardDao();
       Users user = null;
       try {
           user = qanBoardDao.getUserByUserNo(qnaBoard.getUserno());
       } catch (SQLException e) {
           e.printStackTrace();
       }
       String userName = user.getUname();
       
       pageContext.setAttribute("qnaProduct", qnaProduct);
       System.out.println(qnaProduct);
%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/qnaboarddetail.css" />
    </head>
  <body>

    <jsp:include page="header.jsp"></jsp:include>

      <section class="q-a-container-wrapper">
        <div class="q-a-container">
          <div class="q-a-wrapper">
            <div class="content-wrapper">
              <div class="inner-wrapper">
                <div class="title-wrapper">
                  <div class="question-wrapper">
                    <h3 class="strong-q1">Q & A</h3>
                  </div>
                  <div class="qa">상품 Q&A입니다.</div>
                </div>
              </div>
            </div>
          </div>
          <div class="reference-wrapper-wrapper">
          <c:if test="${qnaProduct ne null}">
            <div class="reference-wrapper">
              <div class="reference-content">
                <div class="icon-parent">                  
                  <div class="product-wrapper">
                    <div class="product-container">
                      <div class="background4"></div>
                      <div class="horizontalborder1">
                        <div class="div9">참조상품</div>
                      </div>
                      <div class="border">
                  <div class="link-parent">
                      <img id="productImg" src="<%= imgPath %>" alt="Product Image" style="max-width: 100px; max-height: 100px;">
                  </div>
                        <div class="border-inner">
                          <div class="frame-container">
                            <div class="parent">
                                <b class="b">
                            <%= prodName %>
                         </b>
                            </div>                            
                            <div class="container-parent">
                              <div class="container">
                                <div class="div10">판매가</div>
                              </div>
                              <div class="strong-59300-wrapper">
                        <div class="strong-59300-container">
                             <b><%= prodPrice %>원</b>
                         </div>
                              </div>
                              <div class="link-wrapper">
                                <div class="link2" id="linkContainer">
                                  <a href="productView.jsp?prodNo=<%=prodNo%>" style="color: white; text-decoration:none;">상품정보 상세보기</a>
                                  <div class="icon-wrapper">
                                    <img
                                      class="icon9"
                                      alt=""
                                      src="./public/icon-9.svg"
                                    />
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="div12">
                  문의와 관련된 상품을 확인할 수 있습니다.
                </div>
                </c:if>
              </div>
              <div class="question-list-wrapper-parent">
                <div class="question-list-wrapper">
                  <div class="horizontalborder2">
                    <div class="q-a1">Q & A</div>
                  </div>
                  <div class="content">
                    <div class="qa1">상품 Q&A입니다</div>
                  </div>
                </div>
                <div class="review">
                  <div class="background5"></div>
                  <div class="row">
                  <div class="cell">제목</div>
                  <div class="div13"><%= qnaBoard.getQnatitle() %></div>
              </div>
                  <div class="reviewer">
                    <div class="row1">
                        <div class="cell1">작성자</div>
                        <div class="div14"><%= userName %></div>
                    </div>
               <div class="row2">
                   <textarea class="data" name="qnatext"><%= qnaBoard.getQnatext() %></textarea>
               </div>
                  </div>
                  <div class="footer">
                    <div class="fter-actions">
                      <div class="item1" id="itemContainer">
                        <div class="link3">
                          <div class="lisoot-icon">
                            <img
                              class="icon12"
                              alt=""
                              src="./public/icon-12.svg"
                            />
                          </div>
                          <div class="div15">
                       <a href="./qnaboardmainProc.jsp">목록으로</a>
                    </div>
                        </div>
                      </div>
                      <div class="footer-actions-inner">
                        <div class="frame-div">
                          <div class="message">
                            <div class="div16">
                              건전한 게시글 문화를 응원합니다.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
   <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>