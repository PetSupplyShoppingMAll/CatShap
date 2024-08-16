package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Product;
import catshap.butler.interfaces.ProductInterface;

public class ProductDao implements ProductInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;

	static {
		try {
			reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public Product selectProduct(int prodNo) {
		try (SqlSession ss = ssf.openSession()) {
			Product product = ss.selectOne("product.selectProduct", prodNo);
			ss.close();
			return product;
		}
	}

	@Override
	public List<Product> selectAll(String category) {
		return ssf.openSession().selectList("product.selectProductList", category);
	}
	
	@Override
	public List<Product> selectBasketProductList(int userNo, String[] prodNos) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			Map<String, Object> basketParams = new HashMap<>();
			basketParams.put("userNo", userNo);
			basketParams.put("prodNos", prodNos);
			List<Product> basketProductList = ss.selectList("product.selectBasketProductList", userNo);
			ss.close();
			return basketProductList;
		}
	}

}
