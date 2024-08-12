package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import catshap.butler.bean.Orders;
import catshap.butler.bean.ProductPrice;
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
			int prodNo = Integer.parseInt(request.getParameter("prodNo"));
			int prodCnt = Integer.parseInt(request.getParameter("prodCnt"));
			ProductPrice pp = ppi.getProductPrice(prodNo);

			HttpSession session = request.getSession(false);
			Users user = (session != null) ? (Users) session.getAttribute("user") : null;
			if (user != null) {
				Orders orders = new Orders();
				orders.setUserNo(user.getUserNo());
				orders.setOrdStatus("주문중");
				orders.setOrdTotalPrice(pp.getProdPrice() * prodCnt);
				
				int result = oi.insertOrders(orders);
				if (result > 0) {
					jsonResponse.addProperty("success", true);
				} else {
					jsonResponse.addProperty("success", false);
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

}
