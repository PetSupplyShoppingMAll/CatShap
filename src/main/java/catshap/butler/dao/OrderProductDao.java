package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<MyOrderProduct> getMyOrderProductList(int userNo, String ordStatus) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			Map<String, Object> myOrderProductParam = new HashMap<>();
			myOrderProductParam.put("userNo", userNo);
			myOrderProductParam.put("ordStatus", ordStatus);
			List<MyOrderProduct> myOrderProduct = ss.selectList("orderproduct.getMyOrderProductList", myOrderProductParam);
			ss.close();
			return myOrderProduct;
		}
	}
	
	@Override
	public int getMyOrderProductCnt(int userNo, String ordStatus) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			Map<String, Object> myOrderProductParam = new HashMap<>();
			myOrderProductParam.put("userNo", userNo);
			myOrderProductParam.put("ordStatus", ordStatus);
			int myOrderProductCnt = ss.selectOne("orderproduct.getMyOrderProductCnt", myOrderProductParam);
			ss.close();
			return myOrderProductCnt;
		}
	}

}
