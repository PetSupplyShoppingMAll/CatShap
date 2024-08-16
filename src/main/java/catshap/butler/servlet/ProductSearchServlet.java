package catshap.butler.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import catshap.butler.bean.QnaProduct;
import catshap.butler.dao.QnaBoardProductDao;
import catshap.butler.util.MyBatisUtil;

public class ProductSearchServlet extends HttpServlet {
	private QnaBoardProductDao qnaBoardProductDao;

	public void init() {
		qnaBoardProductDao = new QnaBoardProductDao(MyBatisUtil.getSqlSessionFactory());

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		System.out.println("Request URL Path: " + request.getRequestURI());
		System.out.println("Keyword: " + keyword);

		try {
			List<QnaProduct> products = qnaBoardProductDao.searchProductsByName(keyword);
			request.setAttribute("products", products);

			// 경로 수정: 컨텍스트 패스 제거
			RequestDispatcher dispatcher = request.getRequestDispatcher("api/qnaproductsearch.jsp");
			dispatcher.forward(request, response);
			System.out.println("Keyword: " + keyword);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during product search");
			System.out.println("Keyword: " + keyword);
		}
	}

}