<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="catshap.butler.dao.QnaBoardDao"%>
<%@page import="catshap.butler.interfaces.QnaBoardInterface"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="qnaBoard" class="catshap.butler.bean.QnaBoard" />
<jsp:setProperty name="qnaBoard" property="userno" value='<%= Integer.parseInt(request.getParameter("userno")) %>' />
<jsp:setProperty name="qnaBoard" property="prodno" value='<%= Integer.parseInt(request.getParameter("prodno")) %>' />
<jsp:setProperty name="qnaBoard" property="qnacatno" value='<%= Integer.parseInt(request.getParameter("qnacatno")) %>' />
<jsp:setProperty name="qnaBoard" property="qnatitle"  value='<%=request.getParameter("qnatitle")%>' />
<jsp:setProperty name="qnaBoard" property="qnatext"  value='<%=request.getParameter("qnatext")%>' />
    <script src="./js/check_login.js"></script>

<%
	System.out.println(qnaBoard);
	QnaBoardInterface bi = new QnaBoardDao();
	bi.registQnaBoard(qnaBoard);
	response.sendRedirect("qnaboardmainProc.jsp");
%>

