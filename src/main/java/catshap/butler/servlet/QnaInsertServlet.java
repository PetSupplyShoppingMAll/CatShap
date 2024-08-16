package catshap.butler.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import catshap.butler.bean.QnaBoard;
import catshap.butler.dao.QnaBoardDao;

//@WebServlet("/QnaInsertServlet")
public class QnaInsertServlet extends HttpServlet {
	private QnaBoardDao qnaBoardDao;

	@Override
	public void init() {
		qnaBoardDao = new QnaBoardDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Integer userNo = (Integer) session.getAttribute("userno");

			if (userNo == null) {
				response.sendRedirect("login.jsp");
				return;
			}

			int prodNo = Integer.parseInt(request.getParameter("prodno"));
			int qnaCatNo = Integer.parseInt(request.getParameter("qnacatno"));
			String qnaTitle = request.getParameter("qnatitle");
			String qnaText = request.getParameter("qnatext");

			QnaBoard qnaBoard = new QnaBoard();
			qnaBoard.setUserno(userNo);
			qnaBoard.setProdno(prodNo);
			qnaBoard.setQnacatno(qnaCatNo);
			qnaBoard.setQnatitle(qnaTitle);
			qnaBoard.setQnatext(qnaText);
			qnaBoard.setQnaregdate(Timestamp.from(Instant.now()));
			qnaBoard.setQnaupdate(Timestamp.from(Instant.now()));
			qnaBoard.setQsort("");

			boolean isInserted = qnaBoardDao.insertQnaBoard(qnaBoard) > 0;
			if (isInserted) {
				response.sendRedirect(request.getContextPath() + "/qnaboardmain.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/qnaboardwrite.jsp?error=true");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unexpected error: " + e.getMessage());
		}
	}
}