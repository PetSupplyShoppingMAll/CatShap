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

import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Users;
import catshap.butler.dao.OrderProductDao;
import catshap.butler.interfaces.OrderProductInterface;

@WebServlet("/orderProduct/register")
public class OrderProductRegisterServlet extends HttpServlet {

	private OrderProductInterface orderProductDao;

	@Override
	public void init() throws ServletException {
		orderProductDao = new OrderProductDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			JsonObject jsonResponse = new JsonObject();
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
			orderProduct.setOrdNo(Integer.parseInt(request.getParameter("ordNo")));
			orderProduct.setOrdProdAmt(Integer.parseInt(request.getParameter("ordProdAmt")));
			orderProduct.setOrdProdPrice(Integer.parseInt(request.getParameter("ordProdPrice")));

			int result = orderProductDao.insertOrderProduct(orderProduct);
			if (result > 0) {
				jsonResponse.addProperty("success", true);
			} else {
				jsonResponse.addProperty("success", false);
			}
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResponse.toString());
			out.flush();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
