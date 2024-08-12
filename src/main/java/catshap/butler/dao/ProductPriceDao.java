package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.ProductPrice;
import catshap.butler.interfaces.ProductPriceInterface;

public class ProductPriceDao implements ProductPriceInterface {

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
	public ProductPrice getProductPrice(int prodNo) throws SQLException {
		return ssf.openSession().selectOne("productprice.selectProductPrice", prodNo);
	}

}
