package catshap.butler.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import catshap.butler.bean.Delivery;
import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Users;
import catshap.butler.dao.DeliveryDao;
import catshap.butler.dao.OrdersDao;
import catshap.butler.interfaces.DeliveryInterface;
import catshap.butler.interfaces.OrdersInterface;

@WebServlet("/pay")
public class DeliveryRegisterServlet extends HttpServlet {

	private DeliveryInterface deliveryDao;

	@Override
	public void init() throws ServletException {
		deliveryDao = new DeliveryDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			JsonObject jsonResponse = new JsonObject();
			Delivery delivery = new Delivery();
			
			HttpSession session = request.getSession(false);
			Users user = (Users)session.getAttribute("user");
			int userNo = user.getUserNo();
			
			OrdersInterface oi = new OrdersDao();
			List<OrderProduct> orderProductList = oi.getOrderProductList(userNo);
			for (OrderProduct orderProduct : orderProductList) {
				delivery.setOrdNo(orderProduct.getOrdNo());
				delivery.setDelRecipient(request.getParameter("delReciPient"));
				delivery.setDelMailAddress(request.getParameter("delMailAddress"));
				delivery.setDelAddress(request.getParameter("delAddress"));
				delivery.setDelDetailAddress(request.getParameter("delDetailAddress"));
				delivery.setDelRecPhone(request.getParameter("delRecPhone"));
				delivery.setDelRequest(request.getParameter("delRequest"));
				int result = deliveryDao.registDelivery(delivery);
				if (result > 0) {
					jsonResponse.addProperty("success", true);
				} else {
					jsonResponse.addProperty("success", false);
					break;
				}
			}
		} catch (SQLException e) {
			throw new ServletException("Database error", e);
		}
	}
}
