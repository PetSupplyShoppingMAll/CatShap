package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Orders;
import catshap.butler.interfaces.OrdersInterface;

public class OrdersDao implements OrdersInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;

	static {
		try {
			reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getBeforeOrders(Map<String, Object> userParams) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			int result = ss.selectOne("orders.getBeforeOrders", userParams);
			ss.close();
			return result;
		}
	}
	
	@Override
	public int insertOrdersAndGetOrdNo(Orders orders) {
		try (SqlSession ss = ssf.openSession()) {
			ss.insert("orders.insertOrders", orders);
			ss.commit();
			ss.close();
			return orders.getOrdNo();
		}
	}

	@Override
	public int insertOrderProduct(OrderProduct orderProduct) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			int result = ss.insert("orders.insertOrderProduct", orderProduct);
			ss.commit();
			ss.close();
			return result;
		}
	}

	@Override
	public List<OrderProduct> getOrderProductList(int userNo) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			List<OrderProduct> orderProductList = ss.selectList("orders.getOrderProductList", userNo);
			ss.close();
			return orderProductList;
		}
	}

	@Override
	public int getOrderProductPrice(int userNo) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			int orderProductPrice = ss.selectOne("orders.getOrderProductPrice", userNo);
			ss.close();
			return orderProductPrice;
		}
	}

}
