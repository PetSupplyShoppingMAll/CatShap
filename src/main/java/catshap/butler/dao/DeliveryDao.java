package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Delivery;
import catshap.butler.interfaces.DeliveryInterface;

public class DeliveryDao implements DeliveryInterface {

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
	public int registDelivery(Delivery delivery) throws SQLException {
		try (SqlSession ss = ssf.openSession()) {
			int result = ss.insert("delivery.registDelivery", delivery);
			ss.commit();
			ss.close();
			return result;
		}
	}

}
