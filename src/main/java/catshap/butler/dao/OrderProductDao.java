package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.MyOrderProduct;
import catshap.butler.bean.OrderProduct;
import catshap.butler.interfaces.OrderProductInterface;

public class OrderProductDao implements OrderProductInterface {

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
	public int insertOrderProduct(OrderProduct orderProduct) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			int result = ss.insert("orderproduct.insertOrderProduct", orderProduct);
			ss.commit();
			ss.close();
			return result;
		}
	}

	@Override
	public List<MyOrderProduct> getMyOrderProductList(int userNo) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			List<MyOrderProduct> myOrderProduct = ss.selectList("orderproduct.getMyOrderProductList", userNo);
			ss.close();
			return myOrderProduct;
		}
	}

}
