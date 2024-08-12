package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	public int insertOrders(Orders orders) {
		try (SqlSession ss = ssf.openSession()) {
            int result = ss.insert("orders.insertOrders", orders);
            ss.commit();
            return result;
        }
	}

}
