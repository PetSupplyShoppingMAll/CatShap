package catshap.butler.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import catshap.butler.bean.QnaBoard;
import catshap.butler.dao.QnaBoardDao;

//@WebServlet("/QnaBoardMainServlet")
public class QnaBoardMainServlet extends HttpServlet {
	private QnaBoardDao qnaBoardDao;

	@Override
	public void init() {
		qnaBoardDao = new QnaBoardDao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 검색 및 정렬 파라미터
			String qsort = request.getParameter("qsort");
			String searchKeyword = request.getParameter("searchKeyword");
			String searchValue = request.getParameter("searchValue");

			// 디버깅 로그
			System.out.println("qsort: " + qsort);
			System.out.println("searchKeyword: " + searchKeyword);
			System.out.println("searchValue: " + searchValue);

			// QnA 데이터 리스트 조회
			List<QnaBoard> qnaList = qnaBoardDao.listQnaBoard(qsort, searchKeyword, searchValue);

			// 로그로 데이터 크기 확인
			if (qnaList.isEmpty()) {
				System.out.println("Qna list is empty");
			} else {
				System.out.println("Qna list retrieved with size: " + qnaList.size());
			}

			// 데이터를 JSP에 전달
			request.setAttribute("qnaList", qnaList);
			request.getRequestDispatcher("qnaboardmain.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving Q&A data");
			request.getRequestDispatcher("/qnaboardmain.jsp").forward(request, response);
		}
	}
}