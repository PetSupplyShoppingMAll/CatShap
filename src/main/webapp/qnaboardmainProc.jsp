<%@page import="catshap.butler.bean.Users"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="catshap.butler.bean.QnaBoard" %>
<%@page import="catshap.butler.dao.QnaBoardDao" %>
<%@page import="catshap.butler.interfaces.QnaBoardInterface" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonSyntaxException"%>

<%
    HttpSession currentSession = request.getSession();	    
    QnaBoardInterface bi = new QnaBoardDao();
    Users user = (Users) currentSession.getAttribute("user");
    int userNo = (user != null) ? user.getUserNo() : 0;  
    
    List<QnaBoard> qnaBoardList = null;
    
    String qnacatno = request.getParameter("qnacatno");
    String searchKeyword = request.getParameter("searchKeyword");
    String searchValue = request.getParameter("searchValue");
    
    try {
        qnaBoardList = bi.listQnaBoard(qnacatno, searchKeyword, searchValue, userNo);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    Gson gson = new Gson();
    String qnaBoardJson = gson.toJson(qnaBoardList);
    
    request.setAttribute("qnaBoardJson", qnaBoardJson);
    RequestDispatcher rd = request.getRequestDispatcher("qnaboardmain.jsp");
    rd.forward(request, response);
%>
