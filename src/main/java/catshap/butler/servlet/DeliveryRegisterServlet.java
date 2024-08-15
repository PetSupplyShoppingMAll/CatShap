package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import catshap.butler.bean.Delivery;
import catshap.butler.dao.DeliveryDao;
import catshap.butler.interfaces.DeliveryInterface;

@WebServlet("/delivery/register")
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

			delivery.setOrdNo(Integer.parseInt(request.getParameter("ordNo")));
			delivery.setDelMailAddress(request.getParameter("delMailAddress"));
			delivery.setDelAddress(request.getParameter("delAddress"));
			delivery.setDelDetailAddress(request.getParameter("delDetailAddress"));
			delivery.setDelRecipient(request.getParameter("delReciPient"));
			delivery.setDelRecPhone(request.getParameter("delRecPhone"));
			delivery.setDelRequest(request.getParameter("delRequest"));

			int result = deliveryDao.insertDelivery(delivery);
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
			throw new ServletException("Database error", e);
		}
	}
}
