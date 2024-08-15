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

import catshap.butler.bean.Pay;
import catshap.butler.dao.PayDao;
import catshap.butler.interfaces.PayInterface;

@WebServlet("/pay/register")
public class PayRegisterServlet extends HttpServlet {

	private PayInterface payDao;

	@Override
	public void init() throws ServletException {
		payDao = new PayDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			JsonObject jsonResponse = new JsonObject();
			Pay pay = new Pay();

			pay.setOrdNo(Integer.parseInt(request.getParameter("ordNo")));
			pay.setPayCard(request.getParameter("payCard"));
			pay.setPayMent(request.getParameter("payMent"));
			
			int result = payDao.insertPay(pay);
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
