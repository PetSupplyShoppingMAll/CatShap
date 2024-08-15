package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
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

}
