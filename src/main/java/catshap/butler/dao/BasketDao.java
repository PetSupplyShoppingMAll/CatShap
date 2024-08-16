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

import catshap.butler.bean.Basket;
import catshap.butler.interfaces.BasketInterface;

public class BasketDao implements BasketInterface {

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
	public Basket getBasket(int userNo, int prodNo) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			Map<String, Object> basketParams = new HashMap<>();
			basketParams.put("userNo", userNo);
			basketParams.put("prodNo", prodNo);
			Basket basket = ss.selectOne("basket.getBasket", basketParams);
			ss.close();
			return basket;
		}
	}

	@Override
	public List<Basket> listBasket(int userNo) throws Exception {
		return ssf.openSession().selectList("basket.listBasket", userNo);
	}

	@Override
	public boolean addToBasket(Basket basket) throws Exception {
		SqlSession ss = null;
		try {
			ss = ssf.openSession();
			int rowsAffected = ss.insert("basket.addToBasket", basket);
			ss.commit();
			return rowsAffected > 0;
		} catch (Exception e) {
			if (ss != null) {
				ss.rollback();
			}
			throw e;
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
	}

	@Override
	public int deleteBasket(int basketNo) throws Exception {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("basket.deleteBasket", basketNo);
		ss.commit();
		ss.close();
		return result;
	}

	@Override
	public boolean isProductInBasket(int userNo, int prodNo) throws Exception {
		SqlSession ss = ssf.openSession();
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", userNo);
		params.put("prodNo", prodNo);

		Integer count = ss.selectOne("basket.isProductInBasket", params);
		return count != null && count > 0; // Return true if the count is greater than 0
	}

	@Override
	public void removeProductFromBasket(int userNo, int prodNo) throws Exception {
		SqlSession ss = ssf.openSession();
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", userNo);
		params.put("prodNo", prodNo);

		ss.delete("basket.removeProductFromBasket", params);
		ss.commit();
	}

}
