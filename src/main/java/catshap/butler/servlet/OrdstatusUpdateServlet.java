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

import com.google.gson.JsonObject;

import catshap.butler.dao.OrdersDao;
import catshap.butler.interfaces.OrdersInterface;

@WebServlet("/orders/status/*")
public class OrdstatusUpdateServlet extends HttpServlet {

	private OrdersInterface orderDao;

	@Override
	public void init() throws ServletException {
		orderDao = new OrdersDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonObject jsonResponse = new JsonObject();
		try {
			String pathInfo = request.getPathInfo();
			String status = request.getParameter("status");
			int ordNo = Integer.parseInt(pathInfo.substring(1));
			Map<String, Object> orderParams = new HashMap<>();
			orderParams.put("status", status);
			orderParams.put("ordNo", ordNo);
			
			int result = orderDao.updateOrderStatus(orderParams);
			if (result > 0) {
				jsonResponse.addProperty("success", true);
			} else {
				jsonResponse.addProperty("success", false);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			jsonResponse.addProperty("success", false);
		}
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResponse.toString());
		out.flush();
	}

}
