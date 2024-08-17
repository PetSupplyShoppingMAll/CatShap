<%@page import="catshap.butler.bean.Users"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="catshap.butler.bean.QnaBoard" %>
<%@ page import="catshap.butler.dao.QnaBoardDao" %>
<%@ page import="catshap.butler.interfaces.QnaBoardInterface" %>

<%
    // 인터페이스 타입으로 객체 생성
    HttpSession currentSession = request.getSession();	    
    QnaBoardInterface bi = new QnaBoardDao();
    Users user = (Users) currentSession.getAttribute("user");
    int userNo = (user != null) ? user.getUserNo() : 0;  
    
	//게시물 목록 변수 선언 및 초기화
	List<QnaBoard> qnaBoardList = null;
	
    
    // 파라미터 값 가져오기

    String qnacatno = request.getParameter("qnacatno");
    String searchKeyword = request.getParameter("searchKeyword");
    String searchValue = request.getParameter("searchValue");
    
	try {
		 // 게시물 목록 가져오기
		 qnaBoardList = bi.listQnaBoard(qnacatno, searchKeyword, searchValue, userNo);
		} catch (Exception e) {
		 e.printStackTrace();
		}
	
    request.setAttribute("qnaBoardList", qnaBoardList);
    
    // 파라미터가 null일 경우 빈 문자열로 설정
    qnacatno = (qnacatno != null) ? qnacatno : "";
    searchKeyword = (searchKeyword != null) ? searchKeyword : "";
    searchValue = (searchValue != null) ? searchValue : "";  
    

    // request를 다른 페이지에 전달할 때 RequestDispatcher 사용
    RequestDispatcher rd = request.getRequestDispatcher("qnaboardmain.jsp");


    // qnaboardmain.jsp로 포워딩
    rd.forward(request, response);
%>