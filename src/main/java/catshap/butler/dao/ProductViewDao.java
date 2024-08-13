package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.ProductView;
import catshap.butler.interfaces.ProductViewInterface;

public class ProductViewDao implements ProductViewInterface {

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
	public ProductView getProduct(int prodNo) throws Exception {
		return ssf.openSession().selectOne("productview.getProduct", prodNo);
	}

	@Override
	public int addCount(int prodNo) throws SQLException {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("productview.addCount", prodNo);
		ss.commit();
		ss.close();
		return result;
	}

}
