package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Orders;
import catshap.butler.bean.Users;
import catshap.butler.dao.OrdersDao;
import catshap.butler.dao.ProductPriceDao;
import catshap.butler.interfaces.OrdersInterface;
import catshap.butler.interfaces.ProductPriceInterface;

@WebServlet("/registOrder")
public class OrderRegisterServlet extends HttpServlet {

	private ProductPriceInterface ppi;
	private OrdersInterface oi;

	@Override
	public void init() throws ServletException {
		ppi = new ProductPriceDao();
		oi = new OrdersDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonObject jsonResponse = new JsonObject();
		try {
			HttpSession session = request.getSession(false);
			Users user = (session != null) ? (Users) session.getAttribute("user") : null;
			if (user != null) {
				int userNo = user.getUserNo();
				int prodNo = Integer.parseInt(request.getParameter("prodNo"));
				int prodCnt = Integer.parseInt(request.getParameter("prodCnt"));

				if (getBeforeOrders(userNo, prodNo)) {
					jsonResponse.addProperty("success", false);
					jsonResponse.addProperty("falseMessage", "이미 주문한 내역이 있습니다.");
				} else {
					int ordTotalPrice = getProdPrice(prodNo, prodCnt);
					int ordNo = insertOrdersAndGetOrdNo(userNo, ordTotalPrice);
					int result = insertOrderProduct(prodNo, ordNo, prodCnt, ordTotalPrice);
					if (result > 0) {
						jsonResponse.addProperty("success", true);
					} else {
						jsonResponse.addProperty("success", false);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResponse.toString());
		out.flush();
	}

	// 해당 상품을 이전의 본 사용자인지 판단 메소드
	private boolean getBeforeOrders(int userNo, int prodNo) throws SQLException {
		Map<String, Object> userParams = new HashMap<>();
		userParams.put("userNo", userNo);
		userParams.put("prodNo", prodNo);
		int count = oi.getBeforeOrders(userParams);
		return count > 0 ? true : false;
	}

	// 상품의 가격 정보 추출 메소드
	private int getProdPrice(int prodNo, int prodCnt) throws SQLException {
		Map<String, Object> prodParams = new HashMap<>();
		prodParams.put("prodNo", prodNo);
		prodParams.put("prodCnt", prodCnt);
		return ppi.getProdPrice(prodParams);
	}

	// 주문 정보 저장 메소드
	private int insertOrdersAndGetOrdNo(int userNo, int ordTotalPrice) throws SQLException {
		Orders orders = new Orders();
		orders.setUserNo(userNo);
		orders.setOrdTotalPrice(ordTotalPrice);
		return oi.insertOrdersAndGetOrdNo(orders);
	}

	// 상품 주문 정보 저장 메소드
	private int insertOrderProduct(int prodNo, int ordNo, int prodCnt, int ordTotalPrice) throws SQLException {
		OrderProduct orderProduct = new OrderProduct();
		orderProduct.setProdNo(prodNo);
		orderProduct.setOrdNo(ordNo);
		orderProduct.setOrdProdAmt(prodCnt);
		orderProduct.setOrdProdPrice(ordTotalPrice / prodCnt);
		return oi.insertOrderProduct(orderProduct);
	}

}
